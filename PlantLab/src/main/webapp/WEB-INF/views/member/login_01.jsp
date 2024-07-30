<%--
  Created by IntelliJ IDEA.
  User: germs
  Date: 2024-07-25
  Time: 오후 4:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>플랜트랩: 로그인</title>
    <link rel="icon" type="img/png" href="/static/images/round_logo_whiteBack.svg">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login_01.css">
</head>
<body>
<main>
    <div class="container_login">
        <div class="logo">
            <img src="/static/images/round_logo_whiteBack.svg" alt="식물나라 로고">
        </div>
        <h2 id="login_eng_name">Plant Lab</h2>
        <p id="login_kor_name">플랜트랩</p>
        <div class="input-container">
            <input class="inputbox" type="text" placeholder="아이디" required>
        </div>
        <div class="input-container">
            <input class="inputbox" type="password" placeholder="비밀번호" required>
        </div>
        <button class="login" type="button" >로그인</button>
        <div class="options">
            <ul>
                <li>
                    <a href="#">아이디 찾기</a>
                </li>
                |
                <li>
                    <a href="#">비밀번호 찾기</a>
                </li>
                |
                <li>
                    <a href="#">회원가입</a>
                </li>
            </ul>
        </div>
        <div style="font-size: 16px; color:#898989; margin-top:60px; margin-bottom:30px;">또는</div>
        <button class="social-login kakao">
            <img src="/static/images/login_kakao_logo.svg" alt="카카오톡 로고" style="height:20px; margin-right:10px;">
            카카오로 시작하기
        </button>
        <button class="social-login google">
            <img src="/static/images/login_google_logo.svg" alt="구글 로고" style="height:20px; margin-right:10px;">
            Google로 시작하기
        </button>
    </div>
</main>
<script>
    const tryLogin = document.getElementsByClassName("inputbox");
    const btn = document.getElementsByClassName("login")[0];

    btn.addEventListener("click", () => {
        if(localStorage.length == 0){
            alert("아이디 또는 비밀번호가 잘못되었습니다.")
            return;
        }
        let i = 1;
        for(i; i <= localStorage.length; i++){
            const mem = JSON.parse(localStorage.getItem(i));
            if(tryLogin[0].value == mem.id){
                if(tryLogin[1].value == mem.password){
                    sessionStorage.setItem("login", mem.nickname);
                    alert(`${mem.nickname}님 환영합니다.`);
                    window.location.href = "../../../index.jsp";
                    return;
                }
            }
        }
        alert("아이디 또는 비밀번호가 입력되지 않았습니다.")
        return;
    });
</script>
</body>
</html>
</body>
</html>
