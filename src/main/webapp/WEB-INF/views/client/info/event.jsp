<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>학술 행사</title>
    <style>

        h1 {
            font-size: 42px;
            text-align: center;
            margin-bottom: 40px;
            color: #2b6cb0;
            font-weight: bold;
            padding-top: 40px;
        }

        .event-container {
            width: 90%;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            
            margin-bottom: 100px;
        }

        .event-card {
            background-color: #ffffff;
            border-radius: 20px;
            padding: 27px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .event-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        }

        .event-card img {
            width: 100%;
            border-radius: 15px;
            object-fit: cover;
            margin-bottom: 20px;
        }

        .event-info {
            margin-bottom: 15px;
        }

        .event-info h2 {
            font-size: 22px;
            color: #2b6cb0;
            margin-bottom: 15px;
            font-weight: bold;
            border-bottom: 2px solid #2b6cb0;
        }

        .event-info p {
            font-size: 16px;
            line-height: 1.6;
            color: #555;
            margin-bottom: 20px;
        }

        /* 참여하기 버튼 */
        .register-btn {
            display: block;
            text-align: center;
            padding: 12px 0;
            background-color: #2b6cb0;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border-radius: 8px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .register-btn:hover {
            background-color: #224b7b;
        }

        @media only screen and (max-width: 768px) {
            .event-container {
                grid-template-columns: 1fr;
            }
        }

    </style>
</head>
<body>
    <h1>학술 행사</h1>

    <div class="event-container">
        <div class="event-card">
            <img src="/static/client/info/webinar1.avif" style="height:200px;" alt="Webinar 이미지">
            <div class="event-info">
            <br>
                <h2>SPC Webinar: BUN/Cr 수치 상승 고려 사항</h2>
                <p>2024년 8월 26일에 진행되는 SPC Webinar는 BUN/Cr 수치 상승을 고려한 사항을 중심으로 최신 연구를 공유합니다. 이 웹 세미나는 임상 실무자들에게 유익한 정보를 제공하며, 최신 연구 결과를 바탕으로 한 치료 방법을 논의합니다.</p>
            </div>
            <a href="#" class="register-btn">참여하기</a>
        </div>

        <div class="event-card">
            <img src="/static/client/info/onlinelecture.jpg" style="height:200px;" alt="온라인 강의 이미지">
            <div class="event-info">
                <h2>의료인을 위한 온라인 강의</h2>
                <p>2024년 8월 20일에 진행되는 이 온라인 강의는 최신 의료 기술과 환자 관리 방법에 대한 정보를 제공합니다. 의료인들이 임상 현장에서 바로 적용할 수 있는 다양한 팁과 노하우를 공유합니다.</p>
            </div>
            <a href="#" class="register-btn">참여하기</a>
        </div>

        <div class="event-card">
            <img src="/static/client/info/mentalhealth.jpeg" alt="건강한 생각 이미지">
            <div class="event-info">
            <br>
                <h2>건강한 생각을 하기 위한 준비자세</h2>
                <p>2024년 8월 15일에 진행되는 세미나는 건강한 삶을 위한 긍정적인 생각과 스트레스 관리 방법을 다룹니다. 정신 건강과 신체 건강 간의 상관관계에 대해 논의하며, 삶의 질을 향상시키는 방법에 대해 이야기합니다.</p>
            </div>
            <a href="#" class="register-btn">참여하기</a>
        </div>

        <div class="event-card">
            <img src="/static/client/info/cancertreatment.jpg" style="height:200px;" alt="암 치료 기술 이미지">
            <div class="event-info">
                <h2>암 치료를 위한 최신 기술 발표</h2>
                <p>2024년 7월 30일에 진행되는 발표는 암 치료를 위한 최신 기술에 대해 논의하며, 연구 결과를 바탕으로 한 치료법을 소개합니다. 환자 맞춤형 치료 계획 수립과 신약 개발에 대한 최신 연구를 소개합니다.</p>
            </div>
            <a href="#" class="register-btn">참여하기</a>
        </div>

        <div class="event-card">
            <img src="/static/client/info/hypertension.webp" style="height:200px;" alt="고혈압 심포지엄 이미지">
            <div class="event-info">
                <h2>고혈압 관리를 위한 심포지엄</h2>
                <p>2024년 7월 20일에 진행되는 심포지엄은 고혈압 환자를 위한 효과적인 관리 방법을 소개하며, 최신 연구 결과를 공유합니다. 고혈압과 관련된 위험 요소와 예방법에 대해 논의합니다.</p>
            </div>
            <a href="#" class="register-btn">참여하기</a>
        </div>
    </div>
</body>
</html>
