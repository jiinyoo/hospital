<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장인호 병원 소개</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'goorm-sans-bold';

        }

        .container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            padding: 20px 0;
            color: #2b7bba;
            border-radius: 15px 15px 0 0;
        }

        .header h1 {
            margin:20px;
            font-size: 2.5rem;
        }

        .section {
        	margin-top:50px;
            padding: 30px;
            margin-bottom: 30px;
        }

        .section h2 {
            font-size: 2rem;
            margin-bottom: 20px;
            color: #007bff;
        }

        .section p {
            line-height: 1.8;
            font-size: 1.1rem;
            margin-bottom: 15px;
            color: #555;
        }

        /* 미션과 비전 스타일 */
        .mission {
            background-color: #f0f4ff;
            padding: 20px;
            border-left: 6px solid #007bff;
            margin-bottom: 20px;
            border-radius: 10px;
        }

        .mission h2 {
            color: #007bff;
            font-size: 1.8rem;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        /* 조직도 이미지 스타일 */
        .image-section img {
            max-width: 100%;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .image-section {
            text-align: center;
            margin: 30px 0;
        }

        /* 오시는 길 */
        .location {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .location p {
            font-size: 1.1rem;
            margin-bottom: 10px;
        }

        /* 지도 및 위치 관련 스타일 */
        .location img {
            width: 100%;
            height: auto;
            border-radius: 10px;
            margin-top: 20px;
        }

        .contact-info {
            margin-top: 20px;
            font-size: 1.2rem;
            font-weight: bold;
            color: #007bff;
        }

    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>장인호 병원</h1>
        <p>환자의 건강을 최우선으로 생각하는, 최상의 의료 서비스를 제공하는 병원</p>
    </div>

    <!-- 병원 소개 섹션 -->
    <div class="section" id="menu1">
        <h2>병원 소개</h2>
        <p>
            장인호 병원은 환자의 건강을 최우선으로 생각하며, 현대적이고 전문적인 의료 서비스를 제공합니다. 저희 병원은 최신 의료기술과
            풍부한 경험을 바탕으로 다양한 진료과목을 운영하고 있으며, 환자 중심의 케어를 실천하고 있습니다. 저희 병원은 지역사회에서
            신뢰받는 병원으로 자리잡고 있으며, 모든 환자들에게 맞춤형 치료를 제공하고 있습니다.
        </p>
        <p>
            장인호 병원은 고작 한 달의 역사를 자랑하며, 그 동안 수많은 환자들의 건강을 돌보며 신뢰를 쌓아왔습니다. 최신 의료 장비와
            전문 의료진이 협력하여 환자들의 다양한 건강 문제를 해결하기 위해 최선을 다하고 있습니다. 또한, 환자들이 더욱 편안하게
            병원을 이용할 수 있도록 쾌적한 환경을 제공하고 있습니다.
        </p>
        <p>
            저희 병원은 또한 연구와 교육을 통해 지속적으로 발전하고 있으며, 최신 의료 트렌드를 반영한 치료법을 환자들에게 제공하고
            있습니다. 모든 환자에게 최상의 의료 서비스를 제공하며, 장인호 병원은 앞으로도 지역사회의 건강을 책임지는 병원으로서
            자리매김할 것입니다.
        </p>
    </div>

    <!-- 미션과 비전 -->
    <div class="section mission" id="menu2">
        <h2>미션과 비전</h2>
        <p>
            장인호 병원의 미션은 "환자 중심의 케어"입니다. 모든 환자들에게 신뢰받는 의료 서비스를 제공하며, 개인 맞춤형 치료를 통해
            환자들의 건강과 삶의 질을 향상시키는 것을 목표로 하고 있습니다. 또한 저희 병원은 지속적인 연구와 교육을 통해 의료 서비스의
            품질을 향상시키며, 지역 사회의 건강 리더로서 자리잡고 있습니다.
        </p>
        <p>
            저희의 비전은 "세계 수준의 의료 서비스를 지역사회에 제공하는 것"입니다. 장인호 병원은 지역과 세계를 연결하는 최고의 의료
            시설이 될 것이며, 지속적인 혁신과 발전을 통해 더 나은 의료 서비스를 제공할 것을 약속드립니다.
        </p>
    </div>

    <!-- 조직도 섹션 -->
    <div class="section image-section" id="menu3">
        <h2>조직도</h2>
        <img src="/static/client/info/조직도.jpg" alt="장인호 병원 조직도">
    </div>

    <!-- 오시는 길 섹션 -->
    <div class="section location" id="menu4">
        <h2>오시는 길</h2>
        <p>
            장인호 병원은 경기도 고양시에 위치하고 있으며, 병원 내 주차 공간을 비롯하여 다양한 교통수단으로 쉽게 방문하실 수 있습니다.
            병원 주변에는 다양한 편의시설이 마련되어 있어 환자분들이 더욱 편리하게 병원을 이용하실 수 있습니다.
        </p>
        <div class="contact-info">
            <p>주소: 경기도 고양시 마두동 병원로 123</p>
            <p>전화: 031-123-4567</p>
            <p>이메일: JangINHO@hospital.com</p>
        </div>
        <!-- 지도 영역 -->
        <img src="/static/client/info/map.jpg" alt="장인호 병원 위치 지도">
    </div>

</div>

</body>
</html>
