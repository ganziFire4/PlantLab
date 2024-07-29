<%--
  Created by IntelliJ IDEA.
  User: publi
  Date: 2024-07-24
  Time: 오전 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>마이페이지</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mypage.css">
    </head>
    <body class="noto-sans-kr">
        <jsp:include page="../../../nav.jsp"/>
        <header>
            <img src="../../../static/images/Header%20with%20image_마이페이지.png" alt="마이페이지 헤더">
        </header>
        <div class="container">
            <div class="container-flex">
                <div class="profilebox">
                    <div class="profileicon">
                        <div class="shareicon">
                            <img src="../../../static/images/shareicon.png" alt="프로필수정아이콘" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        </div>
                        <img src="../../../static/images/프로필사진.png" class="profile" alt="" style="width: 182.69px;">
                        <div class="profilename">
                            <p style="font-size: 25px;">카리나</p>
                        </div>
                        <div class="profilemedal">
                            <img src="../../../static/images/새싹레벨.png" alt="">
                        </div>
                        <div class="profilelevev">
                            <p style="font-size: 13px;">lv.1 새싹</p>
                        </div>
                    </div>
                    <div style="margin-top: 20px;">
                        <div class="heartbookmark">
                            <div class="heartpart">
                                <img src="../../../static/images/filledgreenheart.png" alt="">
                                <p style="color: #0DA446; font-size: 20px; margin-bottom: 5px;">3</p>
                                <p>좋아요</p>
                            </div>
                            <div class="bookmarkpart">
                                <img src="../../../static/images/littlefilledbookmarkicon.png" alt="">
                                <p style="color: #0DA446; font-size: 20px; margin-bottom: 5px;">25</p>
                                <p>스크랩북</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="categorybox">
                    <div class="mycontent" style="border-bottom: #B5B5B5 1px solid;"
                         id="mycontentbtn">
                        <div class="mycontenticon">
                            <img src="../../../static/images/내가올린글.png" alt="">
                        </div>
                        <div class="mycontenttxt">
                            내가올린글
                        </div>
                    </div>
                    <div class="snscontent"  style="border-bottom: #B5B5B5 1px solid;"
                         id="snscontentbtn">
                        <div class="snscontenticon">
                            <img src="../../../static/images/자랑%20사진.png" alt="">
                        </div>
                        <div class="snspic">
                            그린톡
                        </div>
                    </div>
                    <div class="myshoppingcontent"
                         id="shopcontentbtn">
                        <div class="iconplace">
                            <div class="myshoppingicon">
                                <img src="../../../static/images/마이%20쇼핑.png" alt="" style="margin-left: -10px;">
                            </div>
                        </div>
                        <div class="myshopping">
                            마이 쇼핑
                        </div>
                    </div>
                </div>
                <div class="radio-group">
                    <input type="radio" id="contype" name="content">
                    <input type="radio" id="snstype" name="content">
                    <input type="radio" id="shoptype" name="content">
                </div>
            </div>
            <div class="contentbox"  id="content-a">
                <div class="titletext">Q&A
                    <table class="defaluttext">
                        <tr class="firstRow">
                            <td>제목</td>
                            <td>작성자</td>
                            <td>작성일</td>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                    </table>
                </div>
                <br><br>
                <div class="titletext">정보글
                    <table class="defaluttext">
                        <tr class="firstRow">
                            <td>제목</td>
                            <td>작성자</td>
                            <td>작성일</td>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                        <tr>
                            <td>Project Name</td>
                            <td>Name</td>
                            <td>2022.00.00</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="contentbox-sns" id="content-b" style="display: none;"> <!--클릭시 자랑글 모달 띄우게 가능할까요?-->
                <!-- <button id="createBragBtn" style="width: 300px; height: 250px; border: none; background-color: #ECECEC;"> -->
                <!-- <img style="margin-top: 30px;" src="images/bx_camera.png" alt="cameraLogo">
                <p style="margin-top: 10px;">올린 자랑글이 없습니다.</p> -->
                <div>
                    <img src="../../../static/images/자랑글/rank1main.png" alt="" style="width: 300px; height: 250px; border: none;">
                </div>
                </button>
                <button id="moveBragBtn" onclick="window.location.href='board_list.html?tab=4'"
                        style="margin-top: 30px; width: 800px; height: 70px; background-color: #d1eada; border: #B8E2C8 solid 2px;">
                    <p style="margin-top: 20px; font-weight: bold; font-size: large; color: #27AF5A;">그린톡 바로가기</p>
                </button>
            </div>
            <div class="contentbox--shopping" id="content-c" style="display: none;">
                <div id="purchaseProcess">
                    <ul style="list-style: none; display: flex; margin-top: 20px;">
                        <li>입금대기
                            <br>
                            <span>0</span>
                        </li>
                        <img src="../../../static/images/fluent_ios-arrow-24-filled.svg" alt="arrowImg">
                        <li>결제완료
                            <br>
                            <span>0</span>
                        </li>
                        <img src="../../../static/images/fluent_ios-arrow-24-filled.svg" alt="arrowImg">
                        <li>배송준비
                            <br>
                            <span>0</span>
                        </li>
                        <img src="../../../static/images/fluent_ios-arrow-24-filled.svg" alt="arrowImg">
                        <li>배송중
                            <br>
                            <span>0</span>
                        </li>
                        <img src="../../../static/images/fluent_ios-arrow-24-filled.svg" alt="arrowImg">
                        <li>배송완료
                            <br>
                            <span>0</span>
                        </li>
                        <img src="../../../static/images/fluent_ios-arrow-24-filled.svg" alt="arrowImg">
                        <li style="color: #27AF5A; font-weight: bold;">구매확정
                            <br>
                            <span>2</span>
                        </li>
                    </ul>
                </div>
                <div class="shoppingmenu">
                    <span style="font-size: 18px;">구매확정 목록</span>
                    <span>
                        <div class="shoppingdrop">
                            <select name="purchaseTime" id="purchaseTime" style="width: 100px; margin-top: -15px;">
                                <option value="1개월 전">1개월 전</option>
                                <option value="3개월 전" selected>3개월 전</option>
                                <option value="6개월 전">6개월 전</option>
                                <option value="1년 전">1년 전</option>
                                <option value="2년 전">2년 전</option>
                                <option value="3년 전">3년 전</option>
                            </select>
                        </div>
                    </span>
                </div>
                <div style="margin-top: 5px; width: 750px; height: 510px; background-color: #F5F7F6; border: solid #B5B5B5 1px;">
                    <!-- 1번 -->
                    <div style="margin-top: 20px; margin-left: 30px; display: flex; justify-content: space-between;">
                        <div>
                            <span style="font-weight: bold; font-size: 15px; margin: 5px;">구매확정
                            </span>
                            <img src="../../../static/images/Ellipse%2016.svg" alt="EllipseImg">
                            <span style="font-size: 15px; margin: 5px; ">6/13(목) 도착완료</span>
                        </div>
                        <button type="button" style="margin-right: 20px; color: #23C961;">배송 조회 ></button>
                    </div>
                    <div style="margin: 20px; display: flex; flex-direction: row; border-bottom: solid 1px gray;">
                        <span style="margin: 10px; margin-top: 0px;">
                            <button type="button" style="width: 170px; height: 130px; background-color: rgb(164, 161, 161); padding: 0%; border: none; border-radius: 7px;">
                                <!-- 나중에 쇼핑목록 이미지를 연결하기 -->
                                <img style="width: 100%; height: auto; object-fit: cover; border-radius: 7px;" src="../../../static/images/purchaseEX01.svg" alt="purchaseEXImg">
                            </button>
                        </span>
                        <div style="width: 100%; height: 100%;">
                            <p style="font-weight: bold;">진한 꽃향기 오렌지 자스민 실내공기정화 식물 인테리어식물<br>플랜테리어 화분</p>
                            <p style="margin-bottom: 0px;">1차옵션:오렌지 자스민 소 / 2차옵션: 없음</p>
                            <p>8,900원</p>
                            <div style="display: flex; justify-content: end; margin-bottom: 15px;">
                                <button type="button" class="purbtn1" style="width: 130px; height: 40px; margin-right: 10px; border: 1px solid #23C961; border-radius: 5px;">문의</button>
                                <button type="button" class="purbtn2" style="width: 130px; height: 40px; margin-left: 10px; border: 1px solid #23C961; border-radius: 5px;">리뷰작성</button>
                            </div>
                        </div>
                    </div>
                    <!-- 2번 -->
                    <div style="margin-top: 20px; margin-left: 30px; display: flex; justify-content: space-between;">
                        <div>
                            <span id="purchaseConfirm" style="font-weight: bold; font-size: 15px; margin: 5px;">구매확정
                            </span>
                            <img src="../../../static/images/Ellipse%2016.svg" alt="EllipseImg">
                            <span style="font-size: 15px; margin: 5px; ">6/13(목) 도착완료</span>
                        </div>
                        <button type="button" style="margin-right: 20px; color: #23C961;">배송 조회 ></button>
                    </div>
                    <div style="margin: 20px; display: flex; flex-direction: row;">
                        <span style="margin: 10px; margin-top: 0px;">
                            <button type="button" style="width: 170px; height: 130px; background-color: rgb(164, 161, 161); padding: 0%; border: none; border-radius: 7px;">
                                <!-- 나중에 쇼핑목록 이미지를 연결하기 -->
                                <img style="width: 100%; height: auto; object-fit: cover; border-radius: 7px;" src="../../../static/images/purchaseEX02.svg" alt="purchaseEXImg">
                            </button>
                        </span>
                        <div style="width: 100%; height: 100%;">
                            <p style="font-weight: bold;">진한 꽃향기 오렌지 자스민 실내공기정화 식물 인테리어식물<br>플랜테리어 화분</p>
                            <p style="margin-bottom: 0px;">1차옵션:오렌지 자스민 대 / 2차옵션: 없음</p>
                            <p class="price">28,900원</p>
                            <div style="display: flex; justify-content: end; margin-bottom: 15px;">
                                <button type="button" class="purbtn1" style="width: 130px; height: 40px; margin-right: 10px; border: 1px solid #23C961; border-radius: 5px;">문의</button>
                                <button type="button" class="purbtn2" style="width: 130px; height: 40px; margin-left: 10px; border: 1px solid #23C961; border-radius: 5px;">리뷰작성</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="popup-icon1">
            <img src="../../../static/images/챗봇아이콘.png" alt="Popup Icon" style="width: 60px; height: 60px;">
        </div>
        <div id="popup-content1" class="hidden">
            <p>안녕하세요! 플랜트 봇 입니다!<br>궁금한 것은 모두 플랜트 봇에게 물어보세요!</p>
        </div>
        <div id="popup-icon2">
            <img src="../../../static/images/top아이콘.png" alt="Popup Icon" style="width: 60px; height: 60px;">
        </div>
        <div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div id="modal-close-btn">
                        <button type="button" class="btn-close" id="modal-close-btn-detail" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="profilebox-header">
                        <div style="margin-top: 7vh">
                            <div id="modify-profile-image" style="position: relative; display: inline-block;">
                                <img src="../../../static/images/프로필사진.png" class="profile" alt="프로필사진" style="width: 8vw; height: auto">
                                <button type="button" style="position: absolute; bottom: 0; right: 0;"><img src="../../../static/images/modify_profile.svg"></button>
                            </div>
                        </div>
                    </div>
                    <button type="button" style="align-items: center; font-size: 0.8rem; color: #CCCCCC; margin-top: 1vh">이미지 삭제</button>
                    <div class="profilebox-body">
                        <form action="/member/join.do" method="post">
                            <div>
                                <p class="profile-modal-p">닉네임</p>
                                <input id="profile-nickname" name="memName" placeholder="안녕하세요">
                                <p class="profile-message" id="nickname-message">default</p>
                            </div>
                            <div style="margin-top: 1vh;">
                                <p class="profile-modal-p">현재 비밀번호</p>
                                <input id="origin-password" name="password" type="password" placeholder="사용 중인 비밀번호를 입력해주세요.">
                                <p class="profile-message" id="password-message">default</p>
                            </div>
                            <div style="margin-top: 1vh;">
                                <p class="profile-modal-p">새 비밀번호</p>
                                <input id="newpassword" type="password" placeholder="새로운 비밀번호를 입력해주세요.">
                                <p class="profile-message" id="newpassword-message">default</p>
                            </div>
                            <div style="margin-top: 1vh;">
                                <p class="profile-modal-p">새 비밀번호 확인</p>
                                <input id="newpassword-check" type="password" placeholder="한 번 더 입력해주세요.">
                                <p class="profile-message" id="newpassword-check-message">default</p>
                            </div>
                            <div style="margin-top: 2vh; background: #23C961; width: 20vw; height: 7vh; border-radius: 5px; display: flex; justify-content: center">
                                <button type="submit" id="save-modify-btn" style="color: white; font-size: 1.3em">변경사항 저장</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../../../footer.jsp"/>
        <script>
            let originNickname = "카리나";
            let nickname = "";
            let originPassword = "";
            let newPassword = "";
            let newPasswordCheck = "";
            // 정규표현식
            const regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{8,15}$/;


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

            $(() => {
                $("#mycontentbtn").addClass("active");
                $(".mycontenttxt").css("color", "white");
                $("#mycontentbtn").click((e) => {
                    $("#mycontentbtn").addClass("active");
                    $("#snscontentbtn").removeClass("active");
                    $("#shopcontentbtn").removeClass("active");
                    $("#contype").trigger("click");
                    $(".mycontenttxt").css("color", "white");
                    $(".snspic").css("color", "#27AF5A");
                    $(".myshopping").css("color", "#27AF5A");
                    $("#content-a").show();
                    $("#content-b").hide();
                    $("#content-c").hide();
                });

                $("#snscontentbtn").click((e) => {
                    $("#mycontentbtn").removeClass("active");
                    $("#snscontentbtn").addClass("active");
                    $("#shopcontentbtn").removeClass("active");
                    $("#snstype").trigger("click");
                    $(".mycontenttxt").css("color", "#27AF5A");
                    $(".snspic").css("color", "white");
                    $(".myshopping").css("color", "#27AF5A");
                    $("#content-a").hide();
                    $("#content-b").show();
                    $("#content-c").hide();
                });

                $("#shopcontentbtn").click((e) => {
                    $("#mycontentbtn").removeClass("active");
                    $("#snscontentbtn").removeClass("active");
                    $("#shopcontentbtn").addClass("active");
                    $("#shoptype").trigger("click");
                    $(".mycontenttxt").css("color", "#27AF5A");
                    $(".snspic").css("color", "#27AF5A");
                    $(".myshopping").css("color", "white");
                    $("#content-a").hide();
                    $("#content-b").hide();
                    $("#content-c").show();
                });

                $("#profile-nickname").on("change", (e) => {
                    nickname = e.target.value;
                });

                $("#profile-nickname").on("blur", (e) => {
                    if(nickname !== ""){
                        if(nickname === originNickname) {
                            $("#nickname-message").css({
                                "visibility": "visible", "color": "red"
                            }).text("중복된 닉네임입니다.");
                        } else {
                            $("#nickname-message").css({
                                "visibility": "visible", "color": "green"
                            }).text("사용 가능한 닉네임입니다.");
                        }
                    } else {
                        $("#nickname-message").css({"visibility": "hidden"});
                    }
                });

                $("#origin-password").on("change", (e) => {
                    originPassword = e.target.value;
                });

                $("#origin-password").on("blur", (e) => {
                    if(originPassword === "") {
                        $("#password-message").css({"visibility": "hidden"});
                    } else {
                        if(originPassword !== "12345678"){
                            $("#password-message").css({
                                "visibility": "visible", "color": "red"
                            }).text("이전 비밀번호와 일치하지 않습니다.");
                        } else {
                            $("#password-message").css({
                                "visibility": "visible", "color": "green"
                            }).text("이전 비밀번호와 일치합니다.");
                        }
                    }
                });

                $("#newpassword").on("change", (e) => {
                    newPassword = e.target.value;
                });

                $("#newpassword").on("blur", (e) => {
                    if(newPassword === "") {
                        $("#newpassword-message").css({"visibility": "hidden"});
                    } else {
                        if(!regex.test(newPassword)) {
                            $("#newpassword-message").css({
                                "visibility": "visible", "color": "red"
                            }).text("비밀번호는 영문 숫자 특수기호 포함 8자리 이상으로 지정해주세요.");
                        } else {
                            $("#newpassword-message").css({
                                "visibility": "hidden"});
                        }
                    }
                });

                $("#newpassword-check").on("change", (e) => {
                    newPasswordCheck = e.target.value;
                });

                $("#newpassword-check").on("blur", (e) => {
                    if(newPasswordCheck === "") {
                        $("#newpassword-check-message").css({"visibility": "hidden"});
                    } else {
                        if(newPassword !== newPasswordCheck) {
                            $("#newpassword-check-message").css({
                                "visibility": "visible", "color": "red"
                            }).text("입력한 비밀번호와 다릅니다.");
                        } else {
                            $("#newpassword-check-message").css({
                                "visibility": "hidden"});
                        }
                    }
                });
                $("#save-modify-btn").click((e) => {
                    if(nickname !== originNickname && originPassword === "12345678" &&
                        regex.test(newPassword) === true && newPassword === newPasswordCheck) {
                        alert("전송 성공");
                    } else {
                        alert("전송 실패");
                    }
                });
            });
        </script>
    </body>
</html>