<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-07-24
  Time: 오후 2:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>플랜트랩:글쓰기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/post.css">
    <script src="${pageContext.request.contextPath}/static/js/boardRlue.js"></script>
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/nav.jsp"/>
    <header>
        <img src="${pageContext.request.contextPath}/static/images/header_글쓰기.png" alt="글쓰기 헤더 이미지">
    </header>
    <main>
        <div class="w_container">
            <form action="/board/post.do" method="post" style="margin:0;">
                <input type="hidden" name="mem_id" value="${loggedInMember.mem_id}">
                <div class="w_header">
                    <select name="board_type" id="boardtype">
                        <option value="1"
                            <c:if test="${tab == 1}">
                                selected
                            </c:if>>정보게시판</option>
                        <option value="2"
                            <c:if test="${tab == 2}">
                                selected
                            </c:if>>잡담게시판</option>
                        <option value="3"
                            <c:if test="${tab == 3}">
                                selected
                            </c:if>>질문게시판</option>
                    </select>
                    <input type="submit" value="저장" id="save_btn">
                </div>
                <div class="writingbox">
                    <div id="w_title">
                        <input name="board_title" type="text" placeholder="제목을 입력하세요.">
                    </div>
                    <div id="w_rule"></div>
                    <div id="w_body">
                        <textarea name="board_content" id="w_content" cols="147" rows="20"></textarea>
                    </div>
                </div>
                <div class="w_file">
                    <div class="btn_line">
                        <input type="file" name="" id="" multiple>
                    </div>
                    <div class="f_list"></div>
                </div>
            </form>
        </div>
    </main>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"/>
    <script>
        const board_name = document.getElementById("boardtype");
        const text = document.getElementById("w_rule");

        text.innerHTML = insertRule(board_name.value);

        board_name.addEventListener("change", () => {
            console.log(board_name.value);
            text.innerHTML = insertRule(board_name.value);
        });

    </script>
</body>
</html>
