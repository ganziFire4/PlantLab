<%@ page import="com.bit.springboard.dto.MemberDto" %><%--
  Created by IntelliJ IDEA.
  User: bitcamp
  Date: 2024-07-24
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>

<html>
<head>
    <title>플랜트랩: ${board.board_title}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/board-detail.css">
</head>
<body>
    <jsp:include page="${pageContext.request.contextPath}/nav.jsp"/>
    <header id="header">
        <c:choose>
            <c:when test="${board.board_type eq 1}">
                <img src="${pageContext.request.contextPath}/static/images/header_정보.png" alt="정보게시판 헤더">
            </c:when>
            <c:when test="${board.board_type eq 2}">
                <img src="${pageContext.request.contextPath}/static/images/header_잡담.png" alt="잡담게시판 헤더">
            </c:when>
            <c:when test="${board.board_type eq 3}">
                <img src="${pageContext.request.contextPath}/static/images/header_질문.png" alt="질문게시판 헤더">
            </c:when>
            <c:otherwise>
                <img src="${pageContext.request.contextPath}/static/images/header_그린톡.png" alt="그린톡 헤더">
            </c:otherwise>
        </c:choose>
    </header>
    <main>
        <!--게시판 이동 탭-->
        <div class="board_button_area">
            <ul>
                <li class="label_underline">
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
        <script>
            const underline = document.getElementsByClassName("label_underline");

            for(let i = 0; i < 4; i++){
                if(i === ${board.board_type} - 1){
                    underline[i].classList.add("activeBlock");
                } else {
                    underline[i].classList.remove("activeBlock");
                }
            }
        </script>
        <!--글 내용-->
        <div class="page_container">
            <h5>${board.board_title}</h5>
            <div class="userInfo">
                <img src="/static/images/storage/${board.mem_pic}" alt="프로필사진" width="30px" height="30px" style="outline: solid 3px #23C961; border-radius: 50%;">
                ${board.mem_nickname}
                <p>
                    작성일: <javatime:format value="${board.board_reg}" pattern="yyyy-MM-dd"/>
                </p>
                <p>
                    수정일: <javatime:format value="${board.board_reg}" pattern="yyyy-MM-dd"/>
                </p>
                <button type="button" id="likeBtn">
                    <img src="${pageContext.request.contextPath}/static/images/heart_empty.svg" alt="heart" id="heart">
                    <p>${board.board_like_cnt}</p>
                </button>
                <button type="button" id="bookmarkBtn">
                    <img src="${pageContext.request.contextPath}/static/images/bookmark_empty.svg" alt="bookmark" id="bookmark">
                    <p>${board.board_bookmark_cnt}</p>
                </button>
            </div>
            <div class="q-contents">
                <c:out value="${board.board_content}" escapeXml="false"/>
            </div>
            <div class="comments">
                <h5>댓글</h5>
                <div class="comment-list" id="comment-list">
                    <!-- Comments will appear here -->
                    <c:if test="${commentList == null || commentList.isEmpty()}">
                        <p style="color:grey">댓글이 없습니다.</p>
                    </c:if>
                    <c:forEach items="${commentList}" var="comment">
                        <div class="comment">
                            <div class="author-date">
                                <div>
                                    <c:if test="${comment.is_checked == 1}">
                                        <img src="/static/images/crown%201.png" alt="채택사진" width="20px" height="20px" >
                                    </c:if>
                                    <img src="/static/images/storage/${comment.mem_pic}" alt="프로필사진" width="20px" height="20px" style="outline: solid 2px #23C961; border-radius: 50%;" class="profile-image">
                                    <span class="author">${comment.mem_nickname}</span>
                                    <c:if test="${board.board_checked == 0 and board.board_type == 3}">
                                        <div id="checkBtn">
                                            <a href="" onclick="checked(event, ${board.mem_id})">채택</a>
                                            <script>
                                                function checked(event, mem_id){
                                                    event.preventDefault();

                                                    if("<%=((MemberDto)session.getAttribute("loggedInMember")).getMem_id()%>" == mem_id){
                                                        location.href="board/board_checked.do?board=${board}&comment=${comment}";
                                                        return;
                                                    }

                                                    alert("게시글 작성자만 채택할 수 있습니다.");
                                                    return;
                                                }
                                            </script>
                                        </div>
                                    </c:if>
                                </div>
                                <span class="date">
                                    <javatime:format value="${comment.comment_reg}" pattern="yyyy-MM-dd"/>
                                    <c:if test="${comment.mem_id == loggedInMember.mem_id}">
                                        <span style="color: #9F9F9F; font-size: small; margin-left:3px;" id="deleteBtn"
                                              onclick="location.href='/board/delete-comment.do?id=${comment.comment_id}&board_id=${comment.board_id}'">삭제</span>
                                    </c:if>
                                </span>
                            </div>
                            <div class="comment-content">
                                <c:out value="${comment.comment_content}" escapeXml="false"/>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <hr>
                <div class="comment-input">
                    <form class="input-container" action="/board/post_comment.do" method="post">
                        <input type="hidden" name="board_id" value="${board.board_id}"/>
                        <input type="hidden" name="mem_id" value="${loggedInMember.mem_id}"/>
                          <c:choose>
                              <c:when test="${loggedInMember == null}">
                                  <textarea type="text" name="comment-input" placeholder="로그인 후 이용하실 수 있습니다." readonly></textarea>
                              </c:when>
                              <c:otherwise>
                                  <textarea type="text" name="comment_content" placeholder="댓글을 입력하세요."></textarea>
                              </c:otherwise>
                          </c:choose>
                        <button type="submit" id="commentBtn">댓글 쓰기</button>
                    </form>
                </div>
                <hr>
                <div id="button_bar">
                    <div id="list" class="button">
                        <a href="/board/board-main.do?tab=${board.board_type}">목록</a>
                    </div>
                    <c:if test="${board.mem_id == loggedInMember.mem_id}">
                        <div style="display:flex">
                            <div id="modify" class="button">
                                <a href="/board/board-modify.do?id=${board.board_id}">수정</a>
                            </div>
                            <div id="delete" class="button">
                                <a href="/board/board-delete.do?id=${board.board_id}&tab=${board.board_type}">삭제</a>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="${pageContext.request.contextPath}/chatbot.jsp"/>
    <jsp:include page="${pageContext.request.contextPath}/footer.jsp"/>
    <script>
        $(document).ready(function() {
            const isLogin = <%=session.getAttribute("loggedInMember") != null%>;
            let clickCheck = false;
            $("#likeBtn").on("click", (e) => {
                clickCheck = !clickCheck;
                if(!isLogin){
                    alert("회원만 이용가능합니다.");
                    return;
                }

                // 이미지 경로를 가져옴
                let src = document.getElementById('heart').src;
                let num;

                if(!clickCheck){
                    $("#heart").attr('src', '${pageContext.request.contextPath}/static/images/heart_empty.svg');
                } else {
                    $("#heart").attr('src', '${pageContext.request.contextPath}/static/images/heart_green.svg');
                }
                // 이미지 경로에 따라 상태를 토글
                <%--if ($("#heart").attr('src') === '${pageContext.request.contextPath}/static/images/heart_empty.svg') {--%>
                <%--    num = 1;--%>
                <%--} else {--%>
                <%--    num = -1;--%>
                <%--}--%>
                if(src === 'http://localhost:8090/static/images/heart_empty.svg'){
                    num = 1;
                    console.log(src);
                } else {
                    num = -1;
                    console.log(src);
                }
                console.log(num);

                $.ajax({
                    url: "/board/board_like_cnt.do",
                    type: "post",
                    data: {"num": num,
                        "board_id": "${board.board_id}",
                        "mem_id": "${loggedInMember.mem_id}"},
                    success: (obj) => {
                        if(obj === 0){
                            alert("버튼 인식이 제대로 되지 않았습니다. 다시 시도해주세요.");
                            return;
                        }

                        if(obj === 1){
                            $("#heart").attr('src', '${pageContext.request.contextPath}/static/images/heart_green.svg');
                            return;
                        }

                        if(obj === -1){
                            $("#heart").attr('src', '${pageContext.request.contextPath}/static/images/heart_empty.svg');
                            return;
                        }

                    },
                    error: (err) => {
                        console.log(err);
                    }
                });
            });

            $("#bookmarkBtn").on("click", (e) => {
                if(!isLogin){
                    alert("회원만 이용가능합니다.");
                    return;
                }

                // // bookmarkImg가 이미지 요소인지 확인
                // if (!(bookmarkImg instanceof HTMLImageElement)) {
                //     console.error("bookmarkImg is not an image element:", bookmarkImg);
                //     return;
                // }

                // 이미지 경로를 가져옴
                // let src = bookmarkImg.getAttribute('src');
                let num;

                // 이미지 경로에 따라 상태를 토글
                if ($("#bookmark").attr('src') === '${pageContext.request.contextPath}/static/images/bookmark_empty.svg') {
                    num = 1;
                } else {
                    num = -1;
                }

                $.ajax({
                    url: "/board/board_bookmark_cnt.do",
                    type: "post",
                    data: {"num": num,
                        "board_id": "${board.board_id}",
                        "mem_id": "${loggedInMember.mem_id}"},
                    success: (obj) => {
                        if(obj === 0){
                            alert("버튼 인식이 제대로 되지 않았습니다. 다시 시도해주세요.");
                            return;
                        }

                        if(obj === 1){
                            $("#bookmark").attr('src', '${pageContext.request.contextPath}/static/images/bookmark_green.svg');
                            return;
                        }

                        if(obj === -1){
                            $("#bookmark").attr('src', '${pageContext.request.contextPath}/static/images/bookmark_empty.svg');
                            return;
                        }

                    },
                    error: (err) => {
                        console.log(err);
                    }
                });
            });
        });
    </script>
</body>
</html>
