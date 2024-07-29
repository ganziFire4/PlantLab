<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-07-24
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>플랜트랩: ${board.board_title}</title>
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
    </header><main>
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

    </main>
    <jsp:include page="${pageContext.request.contextPath}/chatboot.jsp"/>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"/>
</body>
</html>
