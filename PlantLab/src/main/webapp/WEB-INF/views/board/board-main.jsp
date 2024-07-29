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

<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="com.bit.springboard.service.BoardService" %>

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
<%--        <c:if test="${tab == 1 || tab == 2 || tab == 3}">--%>
<%--            <jsp:include page="board-list.jsp"/>--%>
<%--        </c:if>--%>
<%--        <c:if test="${tab == 4}">--%>
<%--            <jsp:include page="greentalk.jsp"/>--%>
<%--        </c:if>--%>
        <div class="tabContent">
            <%
                // Spring 애플리케이션 컨텍스트 가져오기
                org.springframework.web.context.WebApplicationContext context =
                        WebApplicationContextUtils.getWebApplicationContext(application);

                // BoardService 빈 가져오기
                BoardService boardService = context.getBean("boardServiceImpl", BoardService.class);
            %>
            <%
                request.setAttribute("popList", boardService.view_popular(1));
                request.setAttribute("boardList", boardService.view_all(1));
            %>
            <jsp:include page="board-list.jsp"/>
        </div>
        <div class="tabContent">
            <%
                request.setAttribute("popList", boardService.view_popular(2));
                request.setAttribute("boardList", boardService.view_all(2));
            %>
            <jsp:include page="board-list.jsp"/>
        </div>
        <div class="tabContent">
            <%
                request.setAttribute("popList", boardService.view_popular(3));
                request.setAttribute("boardList", boardService.view_all(3));;
            %>
            <jsp:include page="board-list.jsp"/>
        </div>
        <div class="tabContent">
            <jsp:include page="greentalk.jsp"/>
        </div>
    </main>
    <jsp:include page="${pageContext.request.contextPath}/chatboot.jsp"/>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"/>
    <script>

        const changeTab = (tab) => {
            // 탭 눌렀을 때 색상 변경
            for(let i = 0; i < 4; i++){
                if(i === tab - 1){
                    underline[i].classList.add("activeBlock");
                    tabContent[i].style.display = "block";
                } else {
                    underline[i].classList.remove("activeBlock");
                    tabContent[i].style.display = "none";
                }
            }
        }

        // const colorOfTab = (tab) => {
        //     // 탭 눌렀을 때 색상 변경
        //     for(let i = 0; i < 4; i++){
        //         if(i === tab - 1){
        //             underline[i].classList.add("activeBlock");
        //         } else {
        //             underline[i].classList.remove("activeBlock");
        //         }
        //     }
        // }
        //
        // const changeTab = (tab) => {
        //
        //     // model에 있는 tab값 변경
        //     $.ajax({
        //         url: "/board/changeTab.do",
        //         type: "get",
        //         contentType: "x-www-form-urlencoded",
        //         data: {"tab": tab},
        //         success: (obj) => {
        //             colorOfTab(obj.tab);
        //             // 페이지 내용 업데이트
        //             $('#header').html(obj.header);
        //             $('#content').html(obj.boardContent);
        //         },
        //         error: (err) => {
        //             alert("잘못된 접근입니다.");
        //             console.log(err);
        //         }
        //     })
        // }

        const underline = document.getElementsByClassName("label_underline");
        const tabContent = document.getElementsByClassName("tabContent");

        const info_button = document.querySelector("#info");
        const free_button = document.querySelector("#free");
        const QnA_button = document.querySelector("#QnA");
        const greenTalk_button = document.querySelector("#greenTalk");

        changeTab(${tab});

        info_button.addEventListener("click", () => {
            // colorOfTab(1);
            changeTab(1);
        });

        free_button.addEventListener("click", () => {
            // colorOfTab(2);
            changeTab(2);
        });

        QnA_button.addEventListener("click", () => {
            // colorOfTab(3);
            changeTab(3);
        });

        greenTalk_button.addEventListener("click", () => {
            // colorOfTab(4);
            changeTab(4);
        });



    </script>
</body>
</html>
