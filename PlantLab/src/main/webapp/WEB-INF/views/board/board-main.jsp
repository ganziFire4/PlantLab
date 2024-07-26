<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-07-24
  Time: 오전 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<html>
<head>
    <c:choose>
        <c:when test="${tab eq 1}">
            <title>플랜트랩: 정보게시판</title>
        </c:when>
        <c:when test="${tab eq 2}">
            <title>플랜트랩: 잡담게시판</title>
        </c:when>
        <c:when test="${tab eq 3}">
            <title>플랜트랩: 질문게시판</title>
        </c:when>
        <c:when test="${tab eq 4}">
            <title>플랜트랩: 그린톡</title>
        </c:when>
    </c:choose>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/board-main.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/nav.jsp"/>
    <header id="header">
        <c:choose>
            <c:when test="${tab eq 1}">
                <img src="${pageContext.request.contextPath}/static/images/header_정보.png" alt="정보게시판 헤더">
            </c:when>
            <c:when test="${tab eq 2}">
                <img src="${pageContext.request.contextPath}/static/images/header_잡담.png" alt="잡담게시판 헤더">
            </c:when>
            <c:when test="${tab eq 3}">
                <img src="${pageContext.request.contextPath}/static/images/header_질문.png" alt="질문게시판 헤더">
            </c:when>
            <c:when test="${tab eq 4}">
                <img src="${pageContext.request.contextPath}/static/images/header_그린톡.png" alt="그린톡 헤더">
            </c:when>
        </c:choose>
    </header>
    <main>
        <!--게시판 이동 탭-->
        <div class="board_button_area">
            <ul>
                <li class="label_underline activeBlock">
                    <label for="info">
                        <input type="checkbox" id="info">
                        <span>정보공유</span>
                    </label>
                </li>
                <li class="label_underline">
                    <label for="free">
                        <input type="checkbox" id="free">
                        <span>잡담</span>
                    </label>
                </li>
                <li class="label_underline">
                    <label for="QnA">
                        <input type="checkbox" id="QnA">
                        <span>Q&A</span>
                    </label>
                </li>
                <li class="label_underline">
                    <label for="greenTalk">
                        <input type="checkbox" id="greenTalk">
                        <span>그린톡</span>
                    </label>
                </li>
            </ul>
        </div>
        <c:if test="${tab == 1 || tab == 2 || tab == 3}">
            <jsp:include page="board-list.jsp"/>
        </c:if>
        <c:if test="${tab == 4}">
            <jsp:include page="greentalk.jsp"/>
        </c:if>
    </main>
    <jsp:include page="${pageContext.request.contextPath}/chatboot.jsp"/>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"/>
    <script>
        const underline = document.getElementsByClassName("label_underline");

        const info_button = document.querySelector("#info");
        const free_button = document.querySelector("#free");
        const QnA_button = document.querySelector("#QnA");
        const greenTalk_button = document.querySelector("#greenTalk");

        info_button.addEventListener("click", () => {
            changeTab(1);
        });

        free_button.addEventListener("click", () => {
            changeTab(2);
        });

        QnA_button.addEventListener("click", () => {
            changeTab(3);
        });

        greenTalk_button.addEventListener("click", () => {
            changeTab(4);
        });

        const changeTab = (tab) => {

            // 탭 눌렀을 때 색상 변경
            for(let i = 0; i < 4; i++){
                if(i === tab - 1){
                    underline[i].classList.add("activeBlock");
                } else {
                    underline[i].classList.remove("activeBlock");
                }
            }

            // model에 있는 tab값 변경
            $.ajax({
                url: "/board/changeTab.do",
                type: "get",
                contentType: "x-www-form-urlencoded",
                data: {"tab": tab},
                success: (obj) => {

                },
                error: (err) => {
                    alert("잘못된 접근입니다.");
                }
            })
        }

    </script>
</body>
</html>
