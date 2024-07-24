<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-07-24
  Time: 오전 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/nav.jsp"/>
    <header>

    </header>
    <main>
        <a href="WEB-INF/views/member/mypage.jsp">a</a>
    </main>
    <jsp:include page="${pageContext.request.contextPath}/chatboot.jsp"/>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"/>
</body>
</html>
