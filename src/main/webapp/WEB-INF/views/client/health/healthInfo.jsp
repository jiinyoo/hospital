<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5대 건강 정보</title>
 <style>


    h1 {
        font-size: 36px;
        text-align: center;
        margin-bottom: 40px;
        color: #2b7bba;
    }

    .health-info-container {
        width: 80%;
        margin: 0 auto;
        margin-top:30px;
        background-color: white;
        padding: 40px; 
        border-radius: 15px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    }

    .health-section {
        display: flex;
        justify-content: space-between; /* 텍스트와 이미지의 간격을 균등하게 배치 */
        margin-bottom: 70px;
        padding: 30px;
        border-radius: 10px;
        background-color: #ffffff;
        background-image: linear-gradient(to bottom right, #e3f2fd, #f9f9f9); /* 그라디언트 배경 추가 */
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    .health-section:nth-child(even) {
        flex-direction: row-reverse;
    }

    .health-section img {
        width: 420px; 
        height: 250px;
        object-fit: cover;
        margin: 20px;
        border-radius: 15px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
    }

    .health-section p {
        padding: 20px;
        padding-left: 30px;
        font-size: 16px;
        line-height: 1.8;
        color: #333;
        text-align: justify;
    }

    .health-section h2 {
        padding: 20px;
        padding-left: 30px;
        color: #2b7bba;
        font-size: 28px;
        margin-bottom: 10px;
        font-weight: bold;
        border-bottom: 2px solid #2b7bba;
    }

    .health-section h3 {
        padding-left: 40px; /* 왼쪽 패딩을 추가하여 오른쪽으로 당김 */
        margin-bottom: 10px;
    }
    

    .health-section ul {
        padding-left: 60px; /* 왼쪽 패딩을 추가하여 오른쪽으로 당김 */
        margin-bottom: 30px;
    }

    /* 각 섹션에 아이콘 추가 */
    .icon {
        font-size: 60px;
        color: #2b7bba;
        margin-right: 20px;
    }

    /* 비디오 스타일 */
    iframe {
        width: 400px;
        height: 250px;
        border-radius: 15px;
        
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        margin-top: 20px;
    }
    
    a {
    	text-decoration: none;
    	color:#2b7bba;
    }

    </style>
</head>
<body>
    <div class="health-info-container">
        <h1>5대 건강 정보</h1>

        <div class="health-section">
            <div class="icon">🏃‍♀️</div>
            <div>
                <h2>규칙적인 운동</h2>
                <p>하루 최소 30분 이상, 주 5회 이상 규칙적인 운동은 심혈관 건강을 유지하는 데 중요한 역할을 합니다. <br>
                적절한 운동은 체중 조절과 정신 건강에도 긍정적인 영향을 미칩니다. 특히 유산소 운동은 심혈관계 건강을 향상시키며, 근력 운동은 근육량 증가와 대사 속도 개선에 도움을 줍니다.<br>
                운동은 우울증과 불안 감소에도 긍정적인 영향을 미치며, 정기적인 운동은 더 나은 수면과 면역력 강화에도 기여합니다.</p>
                
                <h3>운동 팁</h3>
                <ul>
                    <li>주 3회 이상 30분간의 걷기 또는 조깅</li>
                    <li>주 2회 근력 운동(예: 팔굽혀펴기, 덤벨 리프트)</li>
                    <li>하루 중 스트레칭으로 근육 풀기</li>
                </ul>
                <h3>관련 통계</h3>
                <p>대한민국 국민의 40%가 규칙적인 운동을 하지 않고 있으며, 이는 심혈관 질환과 당뇨병 발병률을 높이는 주요 원인 중 하나입니다.</p>
                <h3>추가 리소스</h3>
                <p>더 많은 정보는 <a href="https://www.khanacademy.org/science/health-and-medicine">Khan Academy 건강 및 운동 섹션</a>에서 확인할 수 있습니다.</p>
            </div>
            <img src="/static/client/health/exercise.jpg" alt="운동 이미지">
        </div>

        <div class="health-section">
            <div class="icon">💧</div>
            <div>
                <h2>수분 섭취</h2>
                <p>하루에 8잔 이상의 물을 마시는 것은 체내 대사활동을 원활하게 하고, 신장 기능을 유지하는 데 도움을 줍니다. <br>
                수분은 신체의 여러 생리 작용에 중요한 역할을 하며, 탈수를 예방하여 집중력과 에너지를 유지할 수 있게 합니다. 적절한 수분 섭취는 피부 건강을 유지하고, 변비를 예방하는 데도 중요한 역할을 합니다.</p>
                <h3>수분 섭취 팁</h3>
                <ul>
                    <li>하루 최소 8잔의 물 마시기</li>
                    <li>운동 전후로 추가적인 수분 섭취</li>
                    <li>카페인 음료는 피하고 물 위주로 섭취</li>
                </ul>
                <h3>관련 통계</h3>
                <p>성인의 약 60%가 하루 권장 수분 섭취량을 지키지 않고 있으며, 이로 인해 만성 탈수 증상을 경험할 수 있습니다.</p>
            </div>
            <img src="/static/client/health/water.jpg" alt="물 섭취 이미지">
        </div>

        <div class="health-section">
            <div class="icon">🛌</div>
            <div>
                <h2>충분한 수면</h2>
                <p>하루 7~8시간의 충분한 수면은 면역 체계를 강화하고, 기억력과 집중력을 향상시키는 데 중요합니다. <br>
                수면은 신체가 스스로 회복하고 치유하는 시간을 제공하며, 신경계의 기능을 정상적으로 유지하는 데 필수적입니다.</p>
                <h3>좋은 수면을 위한 팁</h3>
                <ul>
                    <li>취침 전 1시간 동안 전자기기 사용 금지</li>
                    <li>잠들기 30분 전에 따뜻한 차 한잔</li>
                    <li>매일 같은 시간에 잠들고 깨기</li>
                </ul>
                <h3> < 관련 영상 > </h3>
                <iframe src="https://www.youtube.com/embed/5MuIMqhT8DM" frameborder="0" allowfullscreen></iframe>
            </div>
            <img src="/static/client/health/sleep.jpg" alt="수면 이미지">
        </div>

        <div class="health-section">
            <div class="icon">🥗</div>
            <div>
                <h2>균형 잡힌 식사</h2>
                <p>탄수화물, 단백질, 지방, 비타민, 미네랄이 균형 잡힌 식사를 통해 신체 기능을 최적화할 수 있습니다. <br>
                과일과 채소를 충분히 섭취하고 가공식품을 피하는 것이 좋습니다. 건강한 식습관은 심혈관 질환, 당뇨병 및 비만과 같은 만성 질환의 예방에 중요한 역할을 합니다.</p>
                <h3>식사 팁</h3>
                <ul>
                    <li>하루 5회 이상의 과일 및 채소 섭취</li>
                    <li>가공식품 대신 자연식품 선택</li>
                    <li>설탕과 나트륨 섭취 최소화</li>
                </ul>
                <h3>관련 통계</h3>
                <p>전 세계 성인의 약 30%가 비만으로 인해 건강 문제가 발생하고 있으며, 이는 균형 잡힌 식사를 하지 않은 결과입니다.</p>
            </div>
            <img src="/static/client/health/food.jpg" alt="균형 잡힌 식사 이미지">
        </div>

        <div class="health-section">
            <div class="icon">🏥</div>
            <div>
                <h2>정기적인 건강 검진</h2>
                <p>정기적인 건강 검진은 조기 발견과 예방에 중요한 역할을 합니다. <br>
                건강 검진을 통해 암, 고혈압, 당뇨병 등의 질환을 초기 단계에서 발견하고 치료할 수 있습니다. 검진 주기는 연령대와 가족력에 따라 달라지며, 개인 맞춤형 검진을 받는 것이 좋습니다.</p>
                <h3>검진 팁</h3>
                <ul>
                    <li>30대 이후 매년 건강 검진 받기</li>
                    <li>필수 예방접종 챙기기</li>
                    <li>건강 상태에 따른 맞춤형 검진 프로그램 선택</li>
                </ul>
                <h3>관련 통계</h3>
                <p>암 조기 발견을 위한 정기 검진으로 사망률이 약 15% 감소한 것으로 조사되었습니다.</p>
            </div>
            <img src="/static/client/health/checkup.jpg" alt="건강 검진 이미지">
        </div>

    </div>
</body>
</html>
