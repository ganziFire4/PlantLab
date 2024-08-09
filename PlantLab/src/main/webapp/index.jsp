<<<<<<< HEAD
<html>
<body>
<h2>Hello World!</h2>
=======
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
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mainpage.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mainpage.css?v=20240809">
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/nav.jsp"/>
<form id="weather-form" action="${pageContext.request.contextPath}/post-weather.do" method="post">
    <input id="temperature" type="hidden" name="temperature" value="">
    <input id="percentage" type="hidden" name="percentage" value="">
    <input id="quantity" type="hidden" name="quantity" value="">
</form>
<script>
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

    if(<%=session.getAttribute("weather") == null%>){
        $.ajax({
            url: url, // 요청을 보낼 URL
            method: 'GET', // 요청 방법
            dataType: 'json', // 서버로부터 받을 데이터 타입
            success: function(data) {
                // 성공적으로 데이터가 받아졌을 때 실행할 콜백 함수
                temperature = data.response.body.items.item[tempNum].fcstValue;
                quantity = data.response.body.items.item[quantityNum].fcstValue;
                percentage = data.response.body.items.item[percentageNum].fcstValue;

                document.getElementById('temperature').value = temperature;
                document.getElementById('percentage').value = percentage;
                document.getElementById('quantity').value = quantity;

                $("#weather-form").submit(); // 폼 제출
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // 오류가 발생했을 때 실행할 콜백 함수
                console.error("Error fetching data: " + textStatus, errorThrown);
            }
        });
    }
</script>
<header id="header">
    <img src="/static/images/Header%20with%20image_메인페이지.svg" alt="메인 헤더">
</header>
<main>
    <!--modal 팝업-->
    <div class="modal fade" id="rank1modal">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modalbox">
                    <div class="modal-body">
                        <%--                            <img src="/static/images/storage/${greentalk.file.filename}" alt="" class="modalmain">--%>
                        <img src="${pageContext.request.contextPath}/static/images/storage/network_error.png" alt="" class="modalmain">
                        <div class="modal-right">
                            <%--                                <div class="modalthumb">--%>
                            <%--                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/thumbnail1.png" alt="" class="modalthumbnail" id="modalthumb1_1">--%>
                            <%--                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/thumbnail2.png" alt="" class="modalthumbnail" id="modalthumb1_2">--%>
                            <%--                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/thumbnail3.png" alt="" class="modalthumbnail" id="modalthumb1_3">--%>
                            <%--                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/thumbnail4.png" alt="" class="modalthumbnail" id="modalthumb1_4" style="height: 96.27px;">--%>
                            <%--                                </div>--%>
                            <div class="modalcontentbox">
                                <div class="modalcontents">
                                    <div class="writerpic">
                                        <img src="${pageContext.request.contextPath}/static/images/storage/network_error.png" alt="" style="width: 30px; height: 30px;">
                                    </div>
                                    <div class="modalmaincon">
                                        서버 상태를 확인해주세요.
                                    </div>
                                    <div class="modalmaindate">
                                        서버 상태를 확인해주세요.
                                    </div>
                                    <div class="modalreport">
                                        <img src="${pageContext.request.contextPath}/static/images/storage/network_error.png" alt="" style="width: 15px;">
                                    </div>
                                </div>
                                <div class="modalmaincontent">
                                    <p>서버 상태를 확인해주세요.</p>
                                </div>
                            </div>
                        </div>
                        <div class="title">
                            <p class="titlename">#서버 상태를 확인해주세요.</p>
                            <div class="btnicon">
                                <img src="${pageContext.request.contextPath}/static/images/storage/network_error.png" class="bookmarkicon" alt="북마크" style="display: inline;">
                                <img src="${pageContext.request.contextPath}/static/images/storage/network_error.png" class="filledbookmarkicon" alt="북마크" style="display: none;">
                                <img src="${pageContext.request.contextPath}/static/images/storage/network_error.png" class="hearticon" alt="하트" style="display: inline;">
                                <img src="${pageContext.request.contextPath}/static/images/storage/network_error.png" class="filledhearticon" alt="채워진 하트" style="display: none;">
                            </div>
                        </div>
                        <div class="comment">
                            <input action="text" class="commentbox" placeholder="댓글을 입력하세요."
                                   onfocus="placeholder=''" onblur="placeholder='댓글을 입력하세요.'"></input>
                            <div type="submit" class="confirmbox">게시</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


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
                        <img src="/static/images/storage/${pop_green.green_pic}" alt="grid_item" style= "width:355px; height: 200px; border-radius: 10px;" onclick="openModal(${pop_green.green_id})">
                        <h5 class="contents" id="green_title">${pop_green.green_content}</h5>
                        <p><img src="/static/images/storage/${pop_green.mem_pic}" alt="mem_pic" style= "outline: 2px solid #23C961; border-radius: 100px; width:30px; height: 30px;">${pop_green.mem_nickname}  | <javatime:format value="${pop_green.green_reg}" pattern="yyyy.MM.dd"/></p>
                    </div>
                </c:forEach>
                    <script>
                        // 메인 그린톡 제목 글자수 노출
                        // $(document).ready(function() {
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
                        // })

                        // 30 글자로 제한
                        truncateText('#green_title', 25);
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

<script>
    const openModal = (greenId) => {
        console.log(greenId);
        //greenId로 ajax를 보내서
        // modal 구성 후 modal 표출

        let htmlStr = '';

        $.ajax({
            url: '/board/modal-ajax.do',
            type: 'POST',
            data: {"green_id": greenId},
            success: (obj) => {


                console.log(obj);

                const formatDate = (dateString) => {

                    let year = `\${dateString[0]}`;
                    if (year > 1) {
                        year = year.slice(-2);
                    }

                    let month = `\${dateString[1]}`;
                    if (month < 10) {
                        month = '0' + month;
                    }

                    let date = `\${dateString[2]}`;
                    if (date < 10) {
                        date = '0' + date;
                    }

                    return `\${year}-\${month}-\${date}`; // 배열에 저장된 날짜
                };

                const formattedDate = formatDate(obj.greentalk.green_mod); // 날짜 변환

                // let htmlStr = "";
                htmlStr += `
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modalbox">
                        <div class="modal-body">
                            <img src="/static/images/storage/\${obj.greentalk.green_pic}" alt="" class="modalmain">
                            <div class="modal-right">
                                <div class="modalcontentbox">
                                    <div class="modalcontents">
                                        <div class="writerpic">
                                            <img src="/static/images/storage/\${obj.greentalk.mem_pic}" alt="" style="width: 30px; height: 30px; border-radius: 50%; outline: solid 1px #ccc;">
                                        </div>
                                        <div class="modalmaincon">
                                            \${obj.greentalk.mem_nickname}
                                        </div>
                                        <div class="modalmaindate">
                                            \${formattedDate}
                                        </div>
                                        <div class="modalreport">
                                            <img src="${pageContext.request.contextPath}/static/images/그린톡/menu.png.png" alt="" style="width: 15px;">
                                        </div>
                                    </div>
                                    <div class="modalmaincontent">
                                        <p>\${obj.greentalk.green_content}</p>
                                    </div>
                                </div>

                                         <%--여쭤보기--%>
                                         <div class="modalcon" style="margin-top:5px; max-height:450px; overflow-y:scroll; -ms-overflow-style: none; scrollbar-width: none;">`;
                for(let i = 0; i < obj.greenComment.length; i++) {
                    console.log(obj.greenComment.length);
                    const commentFormattedDate = formatDate(obj.greenComment[i].comment_mod);
                    htmlStr += `<div class="modalcommentbox" style="display:flex; text-align:center;">
                                                <div class="writerpic">
                                                    <img src="/static/images/storage/\${obj.greenComment[i].mem_pic}" alt="" style="width: 30px; height: 30px; border-radius: 50%; outline: solid 1px #ccc;">
                                                </div>
                                                <div class="modalmaincon">
                                                    \${obj.greenComment[i].mem_nickname}
                                                </div>
                                                <div class="modalmaindate">
                                                    \${commentFormattedDate}
                                                </div>
                                                <div class="modalreport" onclick="commentModifyClick(\${obj.greenComment[i].green_comment_id})">
                                                    <p style="color:gray; font-size: 10px; cursor:pointer; margint-top:5px;" >수정</p>
                                                </div>
                                            </div>
                                            <div class="modalmaincontent" id="modalmaincontent\${obj.greenComment[i].green_comment_id}">
                                                <p>\${obj.greenComment[i].comment_content}</p>
                                            </div>
                                                <div class="modifybox" id="modifybox\${obj.greenComment[i].green_comment_id}" style="display:none;">
                                                    <form onsubmit="modifyComment(event)">
                                                        <input type="hidden" name="green_id" value="\${obj.greenComment[i].green_id}">
                                                        <input type="hidden" name="green_comment_id" value="\${obj.greenComment[i].green_comment_id}">
                                                        <input type="hidden" name="mem_id" value="\${obj.greentalk.mem_id}">
                                                        <input type="text" name="comment_content" value="\${obj.greenComment[i].comment_content}" style="width: 100%; margin-top:15px;">
                                                        <div style="text-align: right;">
                                                            <button type="submit" class="confirmbox" style="border:none;">저장</button>
                                                        </div>
                                                    </form>
                                                </div>`;
                }
                htmlStr += `</div>
                            </div>
                            <div class="title">
                                <p class="titlename"># \${obj.greentalk.green_tag}</p>
                                <div class="btnicon">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/bookmark_black.png" class="bookmarkicon" alt="북마크" style="display: inline;">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/filledbookmarkicon.png" class="filledbookmarkicon" alt="북마크" style="display: none;">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/hearticon.png" class="hearticon" alt="하트" style="display: inline;">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/filledhearticon.png" class="filledhearticon" alt="채워진 하트" style="display: none;">
                                </div>
                            </div>
                            <div class="comment">
                                <form id="comment-form" onsubmit="submitComment(event)">
                                <input type="hidden" name="green_id" value="\${obj.greentalk.green_id}">
                                <input type="hidden" name="mem_id" value="\${obj.greentalk.mem_id}">
                                <div class="commenttab">
                                <input type="text" name="comment_content" class="commentbox" placeholder="댓글을 입력하세요."
                                       onfocus="placeholder=''" onblur="placeholder='댓글을 입력하세요.'" style="margin-top:15px;">
                                </input>
                                    <div style="text-align: right;">
                                        <button type="submit" class="confirmbox" style="border:none;">게시</button>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                                            `;
                $('#rank1modal').html(htmlStr);
                $("#rank1modal").modal('show');

                // $("#rank1modal").modal('show');

            },
            error: (err) => {
                console.log(err);
            }
        });
    }

    function submitComment(event) {
        event.preventDefault(); // 폼의 기본 제출 동작을 막습니다.

        const form = document.getElementById('comment-form');
        const formData = new FormData(form);

        $.ajax({
            url: '/board/green_comment.do',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: (response) => {
                // 댓글 추가 성공 후 처리
                console.log('댓글이 저장되었습니다:', response);

                // 모달 내용 갱신 (댓글을 새로 불러오거나 추가할 수 있습니다)
                openModal(response.green_id); // 댓글이 저장된 green_id를 사용하여 모달을 다시 열어 최신 상태로 업데이트
            },
            error: (err) => {
                console.error('댓글 저장 중 오류 발생:', err);
            }
        });
    }

    function modifyComment(event) {
        event.preventDefault();

        const form = event.target;
        const formData = new FormData(form);

        $.ajax({
            url: '/board/modify_comment.do',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: (response) => {
                console.log('댓글이 수정되었습니다:', response);

                openModal(response.green_id);
            },
            error: (err) => {
                console.error('댓글 수정 중 오류 발생:', err);
            }
        });
    }

    function commentModifyClick(commentId) {
        $("#modifybox" + commentId).show();
        $("#modalmaincontent" + commentId).hide();
    }
</script>
>>>>>>> submain
</body>
</html>
