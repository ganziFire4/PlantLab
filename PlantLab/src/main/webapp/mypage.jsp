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
        <link rel="stylesheet" href="static/css/mypage.css">
        <script src="static/js/jquery-3.7.1.min.js"></script>
    </head>
    <body class="noto-sans-kr">
        <jsp:include page="nav.jsp"/>
        <header>
            <img src="static/images/Header with image_마이페이지.png" alt="마이페이지 헤더">
        </header>
        <div class="container">
            <div class="container-flex">
                <div class="profilebox">
                    <div class="profileicon">
                        <div class="shareicon">
                            <img src="static/images/shareicon.png" alt="">
                        </div>
                        <img src="static/images/프로필사진.png" class="profile" alt="" style="width: 182.69px;">
                        <div class="profilename">
                            <p style="font-size: 25px;">카리나</p>
                        </div>
                        <div class="profilemedal">
                            <img src="static/images/새싹레벨.png" alt="">
                        </div>
                        <div class="profilelevev">
                            <p style="font-size: 13px;">lv.1 새싹</p>
                        </div>
                    </div>
                    <div style="margin-top: 20px;">
                        <div class="heartbookmark">
                            <div class="heartpart">
                                <img src="static/images/filledgreenheart.png" alt="">
                                <p style="color: #0DA446; font-size: 20px; margin-bottom: 5px;">3</p>
                                <p>좋아요</p>
                            </div>
                            <div class="bookmarkpart">
                                <img src="static/images/littlefilledbookmarkicon.png" alt="">
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
                            <img src="static/images/내가올린글.png" alt="">
                        </div>
                        <div class="mycontenttxt">
                            내가올린글
                        </div>
                    </div>
                    <div class="snscontent"  style="border-bottom: #B5B5B5 1px solid;"
                         id="snscontentbtn">
                        <div class="snscontenticon">
                            <img src="static/images/자랑 사진.png" alt="">
                        </div>
                        <div class="snspic">
                            그린톡
                        </div>
                    </div>
                    <div class="myshoppingcontent"
                         id="shopcontentbtn">
                        <div class="iconplace">
                            <div class="myshoppingicon">
                                <img src="static/images/마이 쇼핑.png" alt="" style="margin-left: -10px;">
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
                    <img src="static/images/자랑글/rank1main.png" alt="" style="width: 300px; height: 250px; border: none;">
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
                        <img src="static/images/fluent_ios-arrow-24-filled.svg" alt="arrowImg">
                        <li>결제완료
                            <br>
                            <span>0</span>
                        </li>
                        <img src="static/images/fluent_ios-arrow-24-filled.svg" alt="arrowImg">
                        <li>배송준비
                            <br>
                            <span>0</span>
                        </li>
                        <img src="static/images/fluent_ios-arrow-24-filled.svg" alt="arrowImg">
                        <li>배송중
                            <br>
                            <span>0</span>
                        </li>
                        <img src="static/images/fluent_ios-arrow-24-filled.svg" alt="arrowImg">
                        <li>배송완료
                            <br>
                            <span>0</span>
                        </li>
                        <img src="static/images/fluent_ios-arrow-24-filled.svg" alt="arrowImg">
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
                            <img src="static/images/Ellipse 16.svg" alt="EllipseImg">
                            <span style="font-size: 15px; margin: 5px; ">6/13(목) 도착완료</span>
                        </div>
                        <button type="button" style="margin-right: 20px; color: #23C961;">배송 조회 ></button>
                    </div>
                    <div style="margin: 20px; display: flex; flex-direction: row; border-bottom: solid 1px gray;">
                        <span style="margin: 10px; margin-top: 0px;">
                            <button type="button" style="width: 170px; height: 130px; background-color: rgb(164, 161, 161); padding: 0%; border: none; border-radius: 7px;">
                                <!-- 나중에 쇼핑목록 이미지를 연결하기 -->
                                <img style="width: 100%; height: auto; object-fit: cover; border-radius: 7px;" src="static/images/purchaseEX01.svg" alt="purchaseEXImg">
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
                            <img src="static/images/Ellipse 16.svg" alt="EllipseImg">
                            <span style="font-size: 15px; margin: 5px; ">6/13(목) 도착완료</span>
                        </div>
                        <button type="button" style="margin-right: 20px; color: #23C961;">배송 조회 ></button>
                    </div>
                    <div style="margin: 20px; display: flex; flex-direction: row;">
                        <span style="margin: 10px; margin-top: 0px;">
                            <button type="button" style="width: 170px; height: 130px; background-color: rgb(164, 161, 161); padding: 0%; border: none; border-radius: 7px;">
                                <!-- 나중에 쇼핑목록 이미지를 연결하기 -->
                                <img style="width: 100%; height: auto; object-fit: cover; border-radius: 7px;" src="static/images/purchaseEX02.svg" alt="purchaseEXImg">
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
            <img src="static/images/챗봇아이콘.png" alt="Popup Icon" style="width: 60px; height: 60px;">
        </div>
        <div id="popup-content1" class="hidden">
            <p>안녕하세요! 플랜트 봇 입니다!<br>궁금한 것은 모두 플랜트 봇에게 물어보세요!</p>
        </div>
        <div id="popup-icon2">
            <img src="static/images/top아이콘.png" alt="Popup Icon" style="width: 60px; height: 60px;">
        </div>
        <jsp:include page="footer.jsp"/>
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
            });
        </script>
    </body>
</html>
