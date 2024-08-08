<%@ page import="com.bit.springboard.dto.BoardDto" %>
<%@ page import="java.util.List" %><%--
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
    <c:choose>
        <c:when test="${tab == 2 and loggedInMember == null}">
            <script>
                alert("잡담게시판은 로그인 후 이용가능합니다.");
            </script>
            <div id="blanck" style="height: 500px"></div>
        </c:when>
        <c:otherwise>
            <!--게시판 내용-->
            <div id="title_table_area">
                <div class="search_bar">
                    <form id="search_form" action="/board/board-main.do?tab=${tab}" method="post">
                        <select name="search_condition" id="search_condition">
                            <option value="all"
                                    <c:if test="${search == null || search.search_condition == 'all'}">
                                        selected
                                    </c:if>>전체</option>
                            <option value="title"
                                    <c:if test="${search.search_condition == 'title'}">
                                        selected
                                    </c:if>>제목</option>
                            <option value="writer"
                                    <c:if test="${search.search_condition == 'writer'}">
                                        selected
                                    </c:if>>작성자</option>
                        </select>
                        <input type="text" id="search_keyword" name="search_keyword" value="${search.search_keyword}">
                        <button type="submit" id="search_btn">검색</button>
                    </form>
                </div>
                <div class="table_popular">
                    <div class="t_headerbar">
                        <div>
                            <img src="${pageContext.request.contextPath}/static/images/인기글 별.svg" alt="별" style="margin-right: 7px;">
                            인기글
                        </div>
                        <form id="popTableForm" action="/board/board-main.do?tab=${tab}" method="post">
                            <select name="pop_condition" id="pop_condition">
                                <option value="view"
                                        <c:if test="${pop_condition == null || pop_condition == 'view'}">
                                            selected
                                        </c:if>>조회수</option>
                                <option value="like"
                                        <c:if test="${pop_condition == 'like'}">
                                            selected
                                        </c:if>>좋아요</option>
                                <option value="bookmark"
                                        <c:if test="${pop_condition == 'bookmark'}">
                                            selected
                                        </c:if>>스크랩</option>
                            </select>
                        </form>
                    </div>
                    <div class="table_content">
                        <table class="table table-hover" style="margin: 0;">
                            <colgroup>
                                <col width="5%">
                                <col width="42%">
                                <col width="10%">
                                <col width="15%">
                                <col width="10%">
                                <col width="10%">
                                <col width="13%">
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
                                <tr onclick="location.href='/board/update-cnt.do?id=${popBoard.board_id}'">
                                    <td scope="row">${popBoard.row_num}</td>
                                    <td>${popBoard.board_title}</td>
                                    <td>${popBoard.mem_nickname}</td>
                                    <td>
                                        <javatime:format value="${popBoard.board_reg}" pattern="yyyy-MM-dd"/>
                                    </td>
                                    <td>${popBoard.board_view_cnt}</td>
                                    <td>${popBoard.board_like_cnt}</td>
                                    <td>${popBoard.board_bookmark_cnt}0</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="table_recent">
                    <div class="t_headerbar">
                            ${total}개
                        <div id="t_dropdown">
                            <form id="tableForm" action="/board/board-main.do?tab=${tab}" method="post">
                                <input type="hidden" name="pageNum" value="${page.cri.pageNum}">
                                <input type="hidden" name="amount" value="${page.cri.amount}">
                                <select name="rowsNum" id="rows-num">
                                    <option value="10"
                                            <c:if test="${table.rowsNum == null || table.rowsNum == '10'}">
                                                selected
                                            </c:if>>10</option>
                                    <option value="15"
                                            <c:if test="${table.rowsNum == '15'}">
                                                selected
                                            </c:if>>15</option>
                                    <option value="20"
                                            <c:if test="${table.rowsNum == '20'}">
                                                selected
                                            </c:if>>20</option>
                                </select>
                                <select name="rec_condition" id="rec_condition">
                                    <option value="rec"
                                            <c:if test="${table == null || table.rec_condition == null || table.rec_condition == 'rec'}">
                                                selected
                                            </c:if>>최신순</option>
                                    <option value="view"
                                            <c:if test="${table.rec_condition == 'view'}">
                                                selected
                                            </c:if>>조회수</option>
                                    <option value="like"
                                            <c:if test="${table.rec_condition == 'like'}">
                                                selected
                                            </c:if>>좋아요</option>
                                    <option value="bookmark"
                                            <c:if test="${table.rec_condition == 'bookmark'}">
                                                selected
                                            </c:if>>스크랩</option>
                                </select>
                            </form>
                        </div>
                    </div>
                    <div class="table_content">
                        <table class="table table-hover" style="margin: 0;">
                            <colgroup>
                                <col width="5%">
                                <col width="42%">
                                <col width="10%">
                                <col width="15%">
                                <col width="10%">
                                <col width="10%">
                                <col width="13%">
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
                            <c:forEach items="${boardList}" var="board">
                                <tr onclick="location.href='/board/update-cnt.do?id=${board.board_id}'">
                                    <td scope="row">${board.row_num}</td>
                                    <td>${board.board_title}</td>
                                    <td>${board.mem_nickname}</td>
                                    <td>
                                        <javatime:format value="${board.board_reg}" pattern="yyyy-MM-dd"/>
                                    </td>
                                    <td>${board.board_view_cnt}</td>
                                    <td>${board.board_like_cnt}</td>
                                    <td>${board.board_bookmark_cnt}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="under_bar">
                    <ul class="t_pagination">
                        <c:if test="${page.prev}">
                            <li class="page-item">
                                <a class="pageBtn" aria-label="Previous" href="${page.cri.pageNum - 1}">
                                    &lt;
                                </a>
                            </li>
                        </c:if>
                        <c:forEach begin="${page.startPage}" end="${page.endPage}" var="number">
                            <li class="page-item">
                                <a class="pageBtn" href="${number}">${number}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${page.next}">
                            <li class="page-item">
                                <a class="pageBtn" aria-label="Next" href="${page.cri.pageNum + 1}">
                                    &gt;
                                </a>
                            </li>
                        </c:if>
                    </ul>
                    <c:if test="${loggedInMember ne null}">
                        <button type="button" id="button" onclick="location.href='/board/post.do?tab=${tab}'">글쓰기</button>
                    </c:if>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
    <script>

        $("#pop_condition").on("change",() => {
            $("#popTableForm").submit();
        });

        $("#rows-num").on("change",() => {
            $("#tableForm").submit();
        });

        $("#rec_condition").on("change",() => {
            console.log($("#rec_condition").val());
            $("#tableForm").submit();
        });

        $(".t_pagination a").on("click", (e) => {
            e.preventDefault();

            $("input[name='pageNum']").val($(e.target).attr("href"));

            $("#tableForm").submit();
        });
    </script>
</body>

</html>
