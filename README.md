# 통합 병원 관리 시스템

Spring Boot 기반의 병원 예약 및 관리 시스템입니다. 환자 예약부터 진료 관리까지 전반적인 병원 운영에 필요한 기능을 제공합니다.

## 프로젝트 개요

- **개발 기간**: 2024.08 - 2024.10
- **역할**: 팀 프로젝트
- **기술 스택**: Java, Spring Boot, MyBatis, MariaDB, JSP, JavaScript, HTML/CSS, SiteMesh

## 주요 기능

### 1. 환자 관리 시스템
- 회원가입 및 로그인 기능
- 환자 정보 관리 및 조회
- 진료 내역 조회

### 2. 의사 관리 시스템
- 의사 정보 등록 및 관리
- 진료 과목별 의사 목록 제공
- 의사 근무 일정 관리 (요일 및 시간대)

### 3. 실시간 예약 시스템
- 날짜 및 시간 기반 실시간 예약 가능 여부 확인
- 사용자 친화적인 달력 UI
- 진료 과목별, 의사별 예약 기능

```java
// 날짜 및 의사 ID 기반 예약 가능 시간 조회
@Override
public HashMap chkDate(HttpServletRequest request) {
    // 날짜 정보 가져오기
    int year = Integer.parseInt(request.getParameter("year"));
    int month = Integer.parseInt(request.getParameter("month"));
    int day = Integer.parseInt(request.getParameter("day"));
    LocalDate date = LocalDate.of(year, month, day);
    
    // 의사 정보 및 요일 정보 가져오기
    String doc_id = request.getParameter("doc_id");
    int dayValue = date.getDayOfWeek().getValue();
    if(dayValue == 7) {
        dayValue = 0; // 일요일을 0으로 처리
    }
    
    // 해당 의사의 근무 시간 확인
    ArrayList<LocalTime> list = new ArrayList<>();
    WorkdayDto time = mapper.getTime(doc_id, dayValue);
    if(time != null) {
        LocalTime start = time.getStart_time();
        LocalTime end = time.getEnd_time();
        // 30분 간격으로 예약 가능 시간 생성
        while(start.isBefore(end)) {
            list.add(start);
            start = start.plusMinutes(30);
        }
    }
    
    // 이미 예약된 시간 확인
    ArrayList<ReserveDto> isReserve = mapper.isReserve(doc_id, date);
    ArrayList<LocalTime> reservedTimes = new ArrayList<>();
    for (ReserveDto reserve : isReserve) {
        reservedTimes.add(reserve.getRes_time());
    }
    
    // 점심 시간 처리 (13:00 ~ 14:00)
    LocalTime lunchStart = LocalTime.of(13, 0);
    LocalTime lunchEnd = LocalTime.of(14, 0);
    while(lunchStart.isBefore(lunchEnd)) {
        reservedTimes.add(lunchStart);
        lunchStart = lunchStart.plusMinutes(30);
    }
    
    // 응답 데이터 구성
    HashMap response = new HashMap<>();
    response.put("reservelist", list);
    response.put("reservedTime", reservedTimes);
    
    return response;
}
```

### 4. 진료 관리 시스템
- 환자 진료 기록 관리
- 진료 후 기록 작성 기능
- 진료 유형 및 내용 관리

```java
// 진료 정보 저장
@Override
public String medicalOk(HttpServletRequest request, MedicalDto mdto, HttpSession session) {
    int doc_id = Integer.parseInt(request.getParameter("doc_id"));
    String res_code = request.getParameter("res_code");
    
    if(session.getAttribute("user_id") == null) {
        return "redirect:/main";
    } else {
        String userid = session.getAttribute("user_id").toString();
        if(userid.equals(mapper.getDocUserid(doc_id))) {
            mdto.setDoc_name(mapper.getDocName(doc_id));
            
            mapper.medicalOk(mdto);
            mapper.upState(res_code); // 예약 상태 업데이트
        } else {
            return "redirect:/admin/medical/patient";
        }
    }
    return "redirect:/admin/medical/patient";
}
```

### 5. 프로그램 관리 시스템
- 건강 증진 프로그램 관리
- 프로그램 정보 등록 및 수정
- 프로그램 이미지 업로드 기능

### 6. 커뮤니티 시스템
- 공지사항 관리
- 게시판 기능
- 문의사항 등록 및 답변

## 사용자 역할별 기능

### 일반 사용자 (환자)
- 의사 정보 조회
- 진료 예약
- 예약 내역 조회
- 게시판 활용
- 문의 작성

### 의사
- 진료 스케줄 확인
- 예약된 환자 목록 확인
- 진료 기록 작성
- 환자 정보 조회

### 관리자
- 의사 계정 관리
- 진료 기록 전체 조회
- 프로그램 관리
- 공지사항 및 게시판 관리

## 기술적 특징

### 1. 예약 시스템 구현
- LocalDate, LocalTime을 활용한 날짜/시간 처리
- 의사별 근무일 및 시간 설정 기능
- 예약 충돌 방지 로직

### 2. 파일 업로드 처리
```java
// 파일 업로드 처리 유틸리티
public static String getFileName(String fname, String str) throws Exception {
    File ff = new File(str);
    while(ff.exists()) {
        String code = ""; 
        for(int i=1; i<=4; i++) {
            int num = (int)(Math.random()*62);
            
            if(num>=0 && num<=9)
                num = num+48;
            else if(num>=10 && num<=35)
                num = num+55;
            else
                num = num+61;
            
            code = code+(char)num;
        }
        String[] imsi = fname.split("[.]");
        String newFname = imsi[0]+code+"."+imsi[1];
        
        str = ResourceUtils.getFile("classpath:static/admin/programfile").toPath().toString()+"/"+newFname;
        ff = new File(str);
    }
    return str;
}
```

### 3. SiteMesh를 활용한 레이아웃 관리
```java
@Override
protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
    builder.addDecoratorPath("*", "/default.jsp");        
    builder.addDecoratorPath("/admin/*", "/admindefault.jsp");
    
    super.applyCustomConfiguration(builder);
}
```

### 4. 관리자/의사/환자 권한 관리
```java
@Override
public String loginOk(UserDto udto, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
    String user_name = mapper.loginOk(udto);
    String menu = request.getParameter("menu");
    
    if(user_name != null) {
        session.setAttribute("user_id", udto.getUser_id());
        String userid = udto.getUser_id();
        
        // 관리자 권한 확인
        if(mapper.getState(userid) == 2) {
            return "redirect:/admin/main/index";
        } else {
            // 쿠키 기반 원래 페이지로 리다이렉트
            Cookie cookie = WebUtils.getCookie(request, "url");
            String url = null;
            if(cookie != null) {
                url = cookie.getValue();
                cookie.setMaxAge(0);
                cookie.setPath("/");
                response.addCookie(cookie);
                return "redirect:" + url;
            } else {
                return "redirect:/main/index";                
            }
        }
    } else {
        return "redirect:/main/login?err=1";
    }
}
```

## 프로젝트 구조
```
hospital/
├── src/main/java/kr/co/hospital/
│   ├── admin/
│   │   ├── controller/
│   │   │   ├── AdminMainController.java
│   │   │   ├── DoctorController.java
│   │   │   ├── MedicalController.java
│   │   │   └── ProgramController.java
│   │   ├── dto/
│   │   ├── mapper/
│   │   └── service/
│   ├── client/
│   │   ├── controller/
│   │   │   ├── BoardController.java
│   │   │   ├── ClientMainController.java
│   │   │   ├── InquiryController.java
│   │   │   ├── LoginController.java
│   │   │   ├── NoticeController.java
│   │   │   ├── PartController.java
│   │   │   ├── ReserveController.java
│   │   │   └── UserController.java
│   │   ├── dto/
│   │   ├── mapper/
│   │   └── service/
│   ├── config/
│   ├── util/
│   ├── HospitalApplication.java
│   └── SitemeshConfig.java
└── src/main/resources/
    ├── mapper/
    │   ├── admin/
    │   └── client/
    ├── static/
    └── application.properties
```

## 배운 점 및 향후 개선 방향

### 배운 점
- Spring Boot 기반 대규모 애플리케이션 설계 경험
- 복잡한 예약 시스템 로직 구현
- 권한별 기능 분리 및 관리
- SiteMesh를 활용한 레이아웃 관리
- 요일 및 시간 기반 예약 시스템 구현

### 향후 개선 방향
- REST API 기반 백엔드 리팩토링
- 실시간 알림 시스템 도입
- 모바일 반응형 UI 개선
- 결제 시스템 연동
- 보안 강화 (Spring Security 도입)
