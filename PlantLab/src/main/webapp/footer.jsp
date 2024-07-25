<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-07-24
  Time: 오전 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="static/css/footer.css">
</head>
<body>
    <div id="popup-icon1">
        <img src="static/images/챗봇아이콘.png" alt="Popup Icon" id="chatboot-image" style="width: 60px; height: 60px;">
    </div>
    <div id="popup-content1" class="hidden">
        <p>안녕하세요! 플랜트 봇 입니다!<br>궁금한 것은 모두 플랜트 봇에게 물어보세요!</p>
    </div>
    <div id="popup-icon2">
        <img src="static/images/top아이콘.png" alt="Popup Icon" id="top-image" style="width: 60px; height: 60px;">
    </div>
    <footer>
        <div class="f_container">
            <div style="margin: auto 50px;">
                <img width="150px" height="150px" src="static/images/round_logo_colorBack.svg" alt="플랜트랩 로고">
            </div>
            <div>
                <p>주소 :  서울특별시 강남구 강남대로2689길 20, 5층(역삼동)   TEL : 02 - 1111-2222</p>
                <p>상호명 : (주)플랜트랩</p>
                <p>Copyright © 2024 .All RIGHTS RSERVED.</p>
                <p>불4조 :  정다은  김화영  김시표  송주헌  반재형</p>
            </div>
        </div>
    </footer>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const popupIcon = document.getElementById('popup-icon1');
            const popupContent = document.getElementById('popup-content1');
            const popupIcon2 = document.getElementById('popup-icon2');

            popupIcon.addEventListener('mouseover', () => {
                popupContent.classList.remove('hidden');
            });

            popupIcon.addEventListener('mouseleave', () => {
                popupContent.classList.add('hidden');
            });

            popupIcon2.addEventListener('click', () => {
                window.scrollTo({ top: 0, behavior: 'smooth' });
            });
        });
    </script>
</body>
</html>
