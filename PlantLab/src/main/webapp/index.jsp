<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-07-24
  Time: 오전 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html>
<head>
    <title>플랜트랩</title>
    <link rel="icon" type="img/png" href="/static/images/round_logo_whiteBack.svg">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mainpage.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/nav.jsp"/>
    <header id="header">
        <img src="/static/images/Header%20with%20image_메인페이지.svg" alt="메인 헤더">
    </header>
    <main>
        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="3000">
                    <img src="/static/images/캐러셀03.svg" class="d-block w-100" alt="carousel01">
                </div>
                <div class="carousel-item"  data-bs-interval="3000">
                    <img src="/static/images/캐러셀02.svg" class="d-block w-100" alt="carousel02">
                </div>
                <div class="carousel-item"  data-bs-interval="3000">
                    <img src="/static/images/캐러셀01.svg" class="d-block w-100" alt="carousel03">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <section class="content">
            <div class="table-section">
                <div class="table1">
                    <div class="tablecaption-container">
                        <h2>정보글</h2>
                        <!-- <caption align="top">Q&A</caption> -->
                        <button type="button" class="morebtn" onclick="window.location.href='/board/board-main.do?tab=1'">더 보기</button>
                    </div>
                    <table>
                        <tr>
                            <th class="table-title">제목</th>
                            <th class="table-title">작성자</th>
                            <th class="table-title">작성일</th>
                        </tr>
                        <c:forEach var="post" items="${infoPosts}">
                        <tr>
                            <td>${post.board_title}</td>
                            <td>${post.mem_nickname}</td>
                            <td><javatime:format value="${post.board_reg}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                        </c:forEach>
<%--                        <tr>--%>
<%--                            <td>Project Name</td>--%>
<%--                            <td>Name</td>--%>
<%--                            <td>2022.00.00</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>Project Name</td>--%>
<%--                            <td>Name</td>--%>
<%--                            <td>2022.00.00</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>Project Name</td>--%>
<%--                            <td>Name</td>--%>
<%--                            <td>2022.00.00</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>Project Name</td>--%>
<%--                            <td>Name</td>--%>
<%--                            <td>2022.00.00</td>--%>
<%--                        </tr>--%>
                    </table>
                </div>
                <div class="table2">
                    <table>
                        <div class="tablecaption-container">
                            <h2>Q&A</h2>
                            <button type="button" class="morebtn" onclick="window.location.href='/board/board-main.do?tab=3'">더 보기</button>
                        </div>
                        <tr>
                            <th class="table-title">제목</th>
                            <th class="table-title">작성자</th>
                            <th class="table-title">작성일</th>
                        </tr>
                        <c:forEach var="post" items="${qaPosts}">
                        <tr>
                            <td>${post.board_title}</td>
                            <td>${post.mem_nickname}</td>
                            <td><javatime:format value="${post.board_reg}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                        </c:forEach>
<%--                        <tr>--%>
<%--                            <td>Project Name</td>--%>
<%--                            <td>Name</td>--%>
<%--                            <td>2022.00.00</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>Project Name</td>--%>
<%--                            <td>Name</td>--%>
<%--                            <td>2022.00.00</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>Project Name</td>--%>
<%--                            <td>Name</td>--%>
<%--                            <td>2022.00.00</td>--%>
<%--                        </tr>--%>
<%--                        <tr>--%>
<%--                            <td>Project Name</td>--%>
<%--                            <td>Name</td>--%>
<%--                            <td>2022.00.00</td>--%>
<%--                        </tr>--%>
                    </table>
                </div>
            </div>
            <div class="section-title">
                <h2>인기 친구들</h2>
                <p>다른 유저들의 반려식물들을 구경하세요.</p>
                <button type="button" class="morebtn" onclick="window.location.href='board/greentalk.do'">더 보기</button>
            </div>
            <div class="popular-container">
                <c:forEach items="${greentalkPopLists}" var="pop_green">
                    <div class="popular-post">
                        <img src="/static/images/storage/${pop_green.green_pic}" alt="grid_item" style= "width:355px; height: 200px; border-radius: 10px;">
                        <h5 class="contents" id="green_title">${pop_green.green_content}</h5>
                        <p><img src="/static/images/storage/${pop_green.mem_pic}" alt="mem_pic" style= "outline: 2px solid #23C961; border-radius: 100px; width:30px; height: 30px;">${pop_green.mem_nickname}  | <javatime:format value="${pop_green.green_reg}" pattern="yyyy.MM.dd"/></p>
                    </div>
                </c:forEach>
                    <script>
                        // 메인 그린톡 제목 글자수 노출
                        $(document).ready(function() {
                            // 메인 그린톡 제목 글자수 노출
                            function truncateText(selector, maxLength) {
                                const elements = document.querySelectorAll(selector);
                                elements.forEach(element => {
                                    const originalText = element.textContent;
                                    if (originalText.length > maxLength) {
                                        const truncatedText = originalText.substring(0, maxLength) + '..';
                                        element.textContent = truncatedText;
                                    }
                                });
                            }
                        })

                        // 30 글자로 제한
                        truncateText('#green_title', 25);


                        $(() => {
                            // 날씨 데이터
                            const now = new Date();
                            let nowMonth = now.getMonth() + 1;
                            let zeroMonth = '0' + nowMonth;
                            let zeroDate = '0' + now.getDate();
                            let defaultHour = now.getHours();

                            if (defaultHour < 5) {
                                defaultHour = 2;
                            } else if (defaultHour < 8) {
                                defaultHour = 5;
                            } else if (defaultHour < 11) {
                                defaultHour = 8;
                            } else if (defaultHour < 14) {
                                defaultHour = 11;
                            } else if (defaultHour < 17) {
                                defaultHour = 14;
                            } else if (defaultHour < 20) {
                                defaultHour = 17;
                            } else if (defaultHour < 23) {
                                defaultHour = 20;
                            } else if (defaultHour < 2) {
                                defaultHour = 21;
                            }
                            let zeroHour = '0' + defaultHour;

                            let year = now.getFullYear();
                            let month = zeroMonth.slice(-2);
                            let date = zeroDate.slice(-2);
                            let hour = zeroHour.slice(-2);
                            let fulldate = year + month + date;
                            let url = `https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=gIQrlKBkoGwsDw%2BrhZZZ47LwsVb%2BsbXkagAhe20dhc5nBBIQUxXsw7PB38hiMm8JNRN%2FnVI23Kv6glqRx3C94Q%3D%3D&pageNo=1&numOfRows=1000&dataType=JSON&base_date=\${fulldate}&base_time=\${hour}00&nx=61&ny=126`;
                            let temperature;
                            let quantity;
                            let percentage;
                            let tempNum = 0; // 온도
                            let quantityNum = 9; // 강수량
                            let percentageNum = 7; // 강수확률

                            $.getJSON(url, function (data) {
                                temperature = data.response.body.items.item[tempNum].fcstValue;
                                quantity = data.response.body.items.item[quantityNum].fcstValue;
                                percentage = data.response.body.items.item[percentageNum].fcstValue;
                                // console.log(url);

                                document.getElementById('temperature').value = temperature;
                                document.getElementById('percentage').value = percentage;
                                document.getElementById('quantity').value = quantity;

                                $("#weather-form").submit();
                            });
                        })
                    </script>


            </div>
            <div class="section-title2">
                <h2>할인전</h2>
                <p>할인된 인기상품을 만나보세요.</p>
                <button type="button" class="morebtn" onclick="window.location.href='shopping_main.html?sale=1'">더 보기</button>
            </div>
            <div class="discount-container">
                <div class="products">
                    <img src="/static/images/mainpage/mainpage_sale_img01.svg" alt="Featured Product">
                    <div class="textbox">
                        <h5 class="discount-title">1+1 독일토분 공기정화식물 마오리소포라 율마 몬스테라 유칼립투스</h5>
                        <p class="shop">필플랜트</p>
                    </div>
                    <div class="price-container">
                        <p class="discount-price"> <span  class="origin-price">36,000원</span></p>
                        <p class="price">50% <span class="final-price">18,000</span><span style="font-weight: lighter; color:black;"> 원</span></p>
                    </div>
                </div>
                <div class="products">
                    <img src="/static/images/mainpage/mainpage_sale_img02.svg" alt="Featured Product">
                    <h5 class="discount-title">프렌치 장미 조화_4colors</h5>
                    <p class="shop">언제나 무드</p>
                    <div class="price-container">
                        <p class="discount-price"> <span class="origin-price">10,000원</span></p>
                        <p class="price">33% <span class="final-price">10,800</span><span style="font-weight: lighter; color:black;"> 원</span></p>
                    </div>
                </div>
                <div class="products">
                </div>
                <div class="products">
                    <img src="/static/images/mainpage/mainpage_sale_img03.svg" alt="Featured Product">
                    <h5 class="discount-title">은은한 꽃 향기 오렌지자스민 + 독일토분</h5>
                    <p class="shop">미플린</p>
                    <div class="price-container">
                        <p class="discount-price"> <span  class="origin-price">18,000원</span></p>
                        <p class="price">40% <span class="final-price">10,800</span><span style="font-weight: lighter; color:black;"> 원</span></p>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <jsp:include page="${pageContext.request.contextPath}/chatbot.jsp"/>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"/>
</body>
</html>
