<%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-07-25
  Time: 오전 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/board-list.css">
</head>
<body>
    <!--게시판 내용-->
    <div id="title_table_area">
        <div class="table_popular">
            <div class="t_headerbar">
                <img src="${pageContext.request.contextPath}/static/images/인기글 별.svg" alt="별" style="margin-right: 7px;">
                인기글
                <select name="pop_condition" id="pop_condition">
                    <option value="조회수">조회수</option>
                    <option value="공감순">공감순</option>
                    <option value="스크랩">스크랩</option>
                </select>
            </div>
            <div class="table_content">
                <table class="table table-hover" style="margin: 0;">
                    <colgroup>
                        <col width="5%">
                        <col width="45%">
                        <col width="10%">
                        <col width="15%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                    <tr class="table-success">
                        <th scope="col">#</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">작성일</th>
                        <th scope="col">조회수</th>
                        <th scope="col">좋아요</th>
                        <th scope="col">스크랩</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${popList}" var="popBoard">
                        <tr>
                            <th scope="row">1</th>
                            <td>${popBoard.board_title}</td>
                            <td>${popBoard.writer_nickname}</td>
                            <td>
                                <javatime:format value="${popBoard.board_reg}" pattern="yyyy-MM-dd"/>
                            </td>
                            <td>${popBoard.board_view_cnt}</td>
                            <td>000</td>
                            <td>000</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="table_recent">
            <div class="t_headerbar">
                0000개
                <div id="t_dropdown">
                    <select name="rows-num" id="rows-num">
                        <option value="10">10</option>
                        <option value="15">15</option>
                        <option value="20">20</option>
                    </select>
                    <select name="rec_condition" id=rec_condition">
                        <option value="최신순">최신순</option>
                        <option value="조회수">조회수</option>
                        <option value="공감순">공감순</option>
                        <option value="스크랩">스크랩</option>
                    </select>
                </div>
            </div>
            <div class="table_content">
                <table class="table table-hover" style="margin: 0;">
                    <colgroup>
                        <col width="5%">
                        <col width="45%">
                        <col width="10%">
                        <col width="15%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                    <tr class="table-success">
                        <th scope="col">#</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">작성일</th>
                        <th scope="col">조회수</th>
                        <th scope="col">스크랩</th>
                        <th scope="col">공감</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${popList}" var="popBoard">
                        <tr>
                            <th scope="row">1</th>
                            <td>${popBoard.board_title}</td>
                            <td>${popBoard.writer_nickname}</td>
                            <td>
                                <javatime:format value="${popBoard.board_reg}" pattern="yyyy-MM-dd"/>
                            </td>
                            <td>${popBoard.board_view_cnt}</td>
                            <td>000</td>
                            <td>000</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <button type="button" id="button">글쓰기</button>
    </div>
</body>
</html>
