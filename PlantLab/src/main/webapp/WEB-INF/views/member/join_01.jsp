<%--
  Created by IntelliJ IDEA.
  User: germs
  Date: 2024-07-25
  Time: 오후 5:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>플랜트랩: 회원가입</title>
    <link rel="icon" type="img/png" href="/static/images/round_logo_whiteBack.svg">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/join_01.css">
</head>
<body>
    <main>
        <div class="join-container">
            <h2 id="join-explain">회원가입을 위해<br>정보를 입력해주세요.</h2>
            <form id="join-form" action="/member/join.do" method="post">
                <div class="form-group">
                    <div class="custom-input">
                        <input type="text" id="veri_btn" name="loginId" placeholder="아이디" required>
                        <button type="button" onclick="checkDuplicate()"></button>
                    </div>
                    <small id="check-message"></small>
                </div>
                <div class="form-group">
                    <label for="nickname"></label>
                    <input type="text" id="nickname" name="memNickname" placeholder="닉네임" required>
                    <small id="check-message1"></small>
                </div>
                <div class="form-group">
                    <label for="password"></label>
                    <input type="password" id="password" name="password" placeholder="비밀번호"required>
                    <small id="check-message2"></small>
                </div>
                <div class="form-group">
                    <label for="confirmPassword"></label>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 확인" required>
                    <small id="check-message3"></small>
                </div>
                <div class="form-group">
                    <label for="userName"></label>
                    <input type="text" id="userName" name="memName" placeholder="이름" required>
                    <small id="check-message4"></small>
                </div>
                <div class="form-group">
                    <div class="custom-input2">
                        <input type="email" id="veri_btn" name="email" placeholder="이메일" required>
                        <button type="button" onclick="checkDuplicate()"></button>
                    </div>
                    <small id="check-message5"></small>
                </div>
                <div class="form-group">
                    <div class="custom-input3">
                        <input type="text" id="veri_btn" name="memTel" placeholder="인증번호" required>
                        <button type="button" onclick="checkDuplicate()"></button>
                    </div>
                    <small id="check-message6"></small>
                </div>
                <div class="form-group">
                    <div class="custom-input4">
                        <input type="text" id="veri_btn2" name="postNum" placeholder="우편번호" required>
                        <button type="button" onclick="checkDuplicate()"></button>
                    </div>
                    <small id="check-message7"></small>
                </div>
                <div class="form-group">
                    <label for="addr"></label>
                    <input type="text" id="addr" name="address" placeholder="주소" required>
                    <small id="check-message8"></small>
                </div>
                <div class="form-group">
                    <label for="addr_detail"></label>
                    <input type="text" id="addr_detail" name="addr_detail" placeholder="상세 주소" required>
                    <small id="check-message9"></small>
                </div>
                <button type="submit" class="submit-btn" onclick="joinComplete()">가입하기</button> <!--백연결시 type="submit"으로 변경 필요-->
            </form>
        </div>
    </main>
    </div>
    <script>
    const userId = document.querySelector("input[name='userId']");
    const userNickname = document.querySelector("input[name='nickname']");
    const checkMessage = document.querySelector("#check-message");
    const checkMessage1 = document.querySelector("#check-message1");
    const checkMessage2 = document.querySelector("#check-message2");
    const checkMessage3 = document.querySelector("#check-message3");
    const checkMessage4 = document.querySelector("#check-message4");
    const checkMessage5 = document.querySelector("#check-message5");
    const checkMessage6 = document.querySelector("#check-message6");
    const checkMessage7 = document.querySelector("#check-message7");
    const checkMessage8 = document.querySelector("#check-message8");
    const checkMessage9 = document.querySelector("#check-message9");
    const userPassword = document.querySelector("input[name='password']");
    const confirmPassword = document.querySelector("input[name='confirmPassword']");
    const addr = document.querySelector("input[name='addr']");
    const addr_detail = document.querySelector("input[name='addr_detail']");


    // 회원정보
    let id = '0';
    let nickname, password;

    //아이디 입력받을 조건
    userId.addEventListener("change", (e) => {
        if (e.target.value.length < 8 || e.target.value.length > 21) {
            checkMessage.textContent = "아이디는 8자리이상 20자이하로 지정해주세요.";
            checkMessage.style.color = "red"; // 텍스트 색상을 빨간색으로 설정
            userId.focus();
        } else {
            //바로 없어지게 가능한지??
            checkMessage.textContent = "";
            id = e.target.value;
            // checkMessage.textContent ="사용 가능한 아이디입니다.";
            // checkMessage.style.color = "#23C961"; // 텍스트 색상을 초록색으로 설정
            // userIdValidation = true;
            // userId.focus();
        }
    });

    // 아이디 중복체크
    let userIdCheck = false;
    function checkDuplicate(){

        if(id === '0'){
            checkMessage.textContent = "아이디를 입력하세요.";
            checkMessage.style.color = "red";
            userId.focus();
            return;
        }
        // 로컬스토리지가 비어있는 경우
        if(localStorage.length === 0) {
            checkMessage.textContent ="사용 가능한 아이디입니다.";
            checkMessage.style.color = "#23C961";
            userIdCheck = true;
            return;
        }

        // 안비어있는 경우(값 중복 체크가 필요함.)
        for(let i = 1; i <= localStorage.length; i++){
            if(JSON.parse(localStorage.getItem(i)).id == id){
                checkMessage.textContent = "중복된 아이디입니다.";
                checkMessage.style.color = "red";
                userId.focus();
                return;
            }
        }

        checkMessage.textContent ="사용 가능한 아이디입니다.";
        checkMessage.style.color = "#23C961";
        userIdCheck = true;
        return;
    }

    // 닉네임 중복체크
    let userNicknameCheck = false;
    function checkNickname(){
        // 로컬스토리지가 비어있는 경우
        if(localStorage.length === 0) {
            checkMessage1.textContent ="사용 가능한 닉네임입니다.";
            checkMessage1.style.color = "#23C961";
            userNicknameCheck = true;
            return;
        }

        // 안비어있는 경우(값 중복 체크가 필요함.)
        for(let i = 1; i <= localStorage.length; i++){
            if(JSON.parse(localStorage.getItem(i)).nickname == nickname){
                checkMessage1.textContent = "중복된 닉네임입니다.";
                checkMessage1.style.color = "red";
                userNickname.focus();
                return;
            }
        }

        checkMessage1.textContent ="사용 가능한 닉네임입니다.";
        checkMessage1.style.color = "#23C961";
        userNicknameCheck = true;
        return;
    }

    //닉네임 입력받을 조건
    userNickname.addEventListener("change", (e) => {
        if (e.target.value.length > 8) {
            checkMessage1.textContent = "닉네임은 8자이하로 지정해주세요.";
            checkMessage1.style.color = "red"; // 텍스트 색상을 빨간색으로 설정
            userNickname.focus();
        } else {
            nickname = e.target.value;
            checkNickname();
        }
    });

    // 패스워드 입력
    let passwordValidation = false;
    userPassword.addEventListener("change", (e) => {
        // e.target.style.background = "#fff";
        let reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{8,15}$/;

        if(!reg.test(e.target.value)) {
            checkMessage2.textContent = "비밀번호는 영문 숫자 특수기호 포함 8자리 이상으로지정해주세요.";
            checkMessage2.style.color = "red"; // 텍스트 색상을 빨간색으로 설정
            userPassword.focus();//다시 입력 칸에 포커스
        } else{
            checkMessage2.textContent = "";
            password = e.target.value;
            passwordValidation = true;
        }
    });



    // 패스워드 입력확인
    let passwordConfirmValidation = false;
    confirmPassword.addEventListener("change", (e) => {
        if (e.target.value !== password) {
            checkMessage3.textContent = "입력한 비밀번호와 다릅니다.";
            checkMessage3.style.color = "red"; // 텍스트 색상을 빨간색으로 설정
            password.focus();//다시 입력 칸에 포커스
        } else{
            checkMessage3.textContent="";
            passwordConfirmValidation = true;
        }
    });


    //이름 입력 확인
    let userNameInput = '';
    userName.addEventListener("change", (e) => {
        if (e.target.value.length === 0) {
            checkMessage4.textContent = "이름을 입력하세요.";
            checkMessage4.style.color = "red";
            userName.focus();
        } else {
            checkMessage4.textContent = "";
            userNameInput = e.target.value;
        }
    });


    //휴대폰번호 입력 확인

    //인증번호

    //우편번호

    //주소입력확인
    let addrInput = '';
    addr.addEventListener("change", (e) => {
        if (e.target.value.length === 0) {
            checkMessage8.textContent = "주소를 입력하세요.";
            checkMessage8.style.color = "red";
            userName.focus();
        } else {
            checkMessage8.textContent = "";
            userNameInput = e.target.value;
        }
    });

    //상세주소 입력확인
    let addr_detailInput = '';
    addr_detail.addEventListener("change", (e) => {
        if (e.target.value.length === 0) {
            checkMessage9.textContent = "상세주소를 입력하세요.";
            checkMessage9.style.color = "red";
            userName.focus();
        } else {
            checkMessage9.textContent = "";
            userNameInput = e.target.value;
        }
    });


    // 가입하기 버튼 클릭
    function joinComplete(){
        if(!userIdCheck) {
            alert("아이디를 입력해주세요.");
            return;
        }

        if(!userNicknameCheck) {
            alert("닉네임을 입력해주세요.");
            return;
        }

        if(!(passwordValidation && passwordConfirmValidation)) {
            alert("비밀번호를 입력해주세요.");
            return;
        }

        if(userNameInput === '') {
            alert("이름을 입력해주세요.");
            return;
        }

        if(addrInput === '') {
            alert("주소를 입력해주세요.");
            return;
        }

        if(addr_detailInput === '') {
            alert("상세주소를 입력해주세요.");
            return;
        }



        if(userIdCheck && userNicknameCheck && passwordValidation && passwordConfirmValidation) {
            localStorage.setItem(localStorage.length + 1, JSON.stringify({id, nickname, password}));
            window.location.href = "_02_join02.html";
        }
    }
        </script>
    </body>
</html>
