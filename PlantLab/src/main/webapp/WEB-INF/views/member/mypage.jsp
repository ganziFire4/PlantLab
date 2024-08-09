<%--
  Created by IntelliJ IDEA.
  User: publi
  Date: 2024-07-24
  Time: 오전 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
    <head>
        <title>마이페이지</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/mypage.css">
    </head>
    <body class="noto-sans-kr">
        <jsp:include page="/nav.jsp"/>
        <header>
            <img src="../../../static/images/Header%20with%20image_마이페이지.png" alt="마이페이지 헤더">
        </header>
        <div class="container">
            <div class="container-flex">
                <div class="profilebox">
                    <div class="profileicon">
                        <div class="shareicon">
                            <img src="../../../static/images/shareicon.png" alt="프로필수정아이콘" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        </div>
                        <img src="${pageContext.request.contextPath}/static/images/storage/${loggedInMember.mem_pic}" class="profile" alt="" style="width: 20vh; height: 20vh; border-radius: 50%; border: solid 3px #23C961;">
                        <div class="profilename">
                            <p style="font-size: 25px;">${loggedInMember.mem_nickname}</p>
                        </div>
                        <div class="profilemedal">
                            <img src="../../../static/images/새싹레벨.png" alt="메달이미지">
                        </div>
                        <div class="profilelevev">
                            <p style="font-size: 13px;">lv.1 새싹</p>
                        </div>
                    </div>
                    <div style="margin-top: 20px;">
                        <div class="heartbookmark">
                            <div class="heartpart">
                                <img src="../../../static/images/filledgreenheart.png" alt="좋아요이미지">
                                <%-- 리스트의 각 항목을 반복하면서 합산합니다 --%>
                                <c:set var="likeCount" value="0"/>
                                <c:forEach items="${greenLikeBookmarkCnt}" var="greenLikeCnt">
                                    <c:set var="likeCount" value="${likeCount + greenLikeCnt.green_like_cnt}"/>
                                </c:forEach>
                                <c:forEach items="${boardLikeBookmarkCnt}" var="boardLikeCnt">
                                    <c:set var="likeCount" value="${likeCount + boardLikeCnt.board_like_cnt}"/>
                                </c:forEach>
                                <p style="color: #0DA446; font-size: 20px; margin-bottom: 5px;">${likeCount}</p>
                                <p>좋아요</p>
                            </div>
                            <div class="bookmarkpart">
                                <img src="../../../static/images/littlefilledbookmarkicon.png" alt="북마크이미지">
                                <c:set var="bookCount" value="0"/>
                                <c:forEach items="${greenLikeBookmarkCnt}" var="greenBookCnt">
                                    <c:set var="bookCount" value="${bookCount + greenBookCnt.green_bookmark_cnt}"/>
                                </c:forEach>
                                <c:forEach items="${boardLikeBookmarkCnt}" var="boardBookCnt">
                                    <c:set var="bookCount" value="${bookCount + boardBookCnt.board_bookmark_cnt}"/>
                                </c:forEach>
                                <p style="color: #0DA446; font-size: 20px; margin-bottom: 5px;">${bookCount}</p>
                                <p>스크랩북</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="categorybox">
                    <div class="mycontent" style="border-bottom: #B5B5B5 1px solid;" id="mycontentbtn">
                        <div class="mycontenticon">
                            <img src="../../../static/images/내가올린글.png" alt="내가올린글image">
                        </div>
                        <div class="mycontenttxt">
                            내가올린글
                        </div>
                    </div>
                    <div class="snscontent" style="border-bottom: #B5B5B5 1px solid;"
                         id="snscontentbtn">
                        <div class="snscontenticon">
                            <img src="../../../static/images/자랑%20사진.png" alt="">
                        </div>
                        <div class="snspic">
                            그린톡
                        </div>
                    </div>
                    <div class="myshoppingcontent"
                         id="shopcontentbtn">
                        <div class="iconplace">
                            <div class="myshoppingicon">
                                <img src="../../../static/images/마이%20쇼핑.png" alt="" style="margin-left: -10px;">
                            </div>
                        </div>
                        <div class="myshopping">
                            마이 쇼핑
                        </div>
                    </div>
                </div>
                <div class="radio-group">
                    <input type="radio" id="contype" name="content">
                    <input type="radio" id="snstype" name="content">
                    <input type="radio" id="shoptype" name="content">
                </div>
            </div>
            <div class="contentbox-board" id="content-a">
                <c:choose>
                    <c:when test="${empty myWrite}">
                        <tr>
                            <td colspan="3">데이터가 없습니다.</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <div class="cover-table">
                            <div class="table-cover-div" style="margin-top: 0">
                                <div class="board-name-div">
                                    <p style="align-self: start; margin-bottom: 0">정보글</p>
                                    <button style="align-self: end; font-size: 1rem;" onclick="window.location.href='${pageContext.request.contextPath}/board/board-main.do?tab=1'">더보기</button>
                                </div>
                                <table style="margin-top: 1vh">
                                    <tr class="firstRow">
                                        <td>제목</td>
                                        <td>작성자</td>
                                        <td>작성일</td>
                                    </tr>
                                    <c:set var="hasInfo" value="false"/>
                                    <c:forEach items="${myWrite}" var="writeList">
                                        <c:if test="${fn:startsWith(writeList.board_title, '정보')}">
                                            <c:set var="hasInfo" value="true"/>
                                            <tr class="nextRow">
                                                <td>
                                                    <button onclick="window.location.href = `${pageContext.request.contextPath}/board/board-detail.do?id=${writeList.board_id}`">${writeList.board_title}</button>
                                                </td>
                                                <td>
                                                    <button onclick="window.location.href = `${pageContext.request.contextPath}/board/board-detail.do?id=${writeList.board_id}`">${writeList.mem_nickname}</button>
                                                </td>
                                                <td>
                                                    <button onclick="window.location.href = `${pageContext.request.contextPath}/board/board-detail.do?id=${writeList.board_id}`">
                                                        <javatime:format value="${writeList.board_reg}" pattern="yyyy-MM-dd"/>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${not hasInfo}">
                                        <tr>
                                            <td colspan="3">게시글이 없습니다.</td>
                                        </tr>
                                    </c:if>
                                </table>
                            </div>
                            <div class="table-cover-div" style="margin-top: 5vh">
                                <div class="board-name-div">
                                    <p style="align-self: start; margin-bottom: 0">잡담</p>
                                    <button style="align-self: end; font-size: 1rem;" onclick="window.location.href='${pageContext.request.contextPath}/board/board-main.do?tab=2'">더보기</button>
                                </div>
                                <table style="margin-top: 1vh">
                                    <tr class="firstRow">
                                        <td>제목</td>
                                        <td>작성자</td>
                                        <td>작성일</td>
                                    </tr>
                                    <c:set var="hasInfo" value="false"/>
                                    <c:forEach items="${myWrite}" var="writeList">
                                        <c:if test="${fn:startsWith(writeList.board_title, '잡담')}">
                                            <c:set var="hasInfo" value="true"/>
                                            <tr class="nextRow">
                                                <td>
                                                    <button onclick="window.location.href = `${pageContext.request.contextPath}/board/board-detail.do?id=${writeList.board_id}`">${writeList.board_title}</button>
                                                </td>
                                                <td>
                                                    <button onclick="window.location.href = `${pageContext.request.contextPath}/board/board-detail.do?id=${writeList.board_id}`">${writeList.mem_nickname}</button>
                                                </td>
                                                <td>
                                                    <button onclick="window.location.href = `${pageContext.request.contextPath}/board/board-detail.do?id=${writeList.board_id}`">
                                                        <javatime:format value="${writeList.board_reg}" pattern="yyyy-MM-dd"/>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${not hasInfo}">
                                        <tr>
                                            <td colspan="3">게시글이 없습니다.</td>
                                        </tr>
                                    </c:if>
                                </table>
                            </div>
                            <div class="table-cover-div" style="margin-top: 5vh">
                                <div class="board-name-div">
                                    <p style="align-self: start; margin-bottom: 0">Q&A</p>
                                    <button style="align-self: end; font-size: 1rem;" onclick="window.location.href='${pageContext.request.contextPath}/board/board-main.do?tab=3'">더보기</button>
                                </div>
                                <table style="margin-top: 1vh">
                                    <tr class="firstRow">
                                        <td>제목</td>
                                        <td>작성자</td>
                                        <td>작성일</td>
                                    </tr>
                                    <c:set var="hasInfo" value="false"/>
                                    <c:forEach items="${myWrite}" var="writeList">
                                        <c:if test="${fn:startsWith(writeList.board_title, '질문')}">
                                            <c:set var="hasInfo" value="true"/>
                                            <tr class="nextRow">
                                                <td>
                                                    <button onclick="window.location.href = `${pageContext.request.contextPath}/board/board-detail.do?id=${writeList.board_id}`">${writeList.board_title}</button>
                                                </td>
                                                <td>
                                                    <button onclick="window.location.href = `${pageContext.request.contextPath}/board/board-detail.do?id=${writeList.board_id}`">${writeList.mem_nickname}</button>
                                                </td>
                                                <td>
                                                    <button onclick="window.location.href = `${pageContext.request.contextPath}/board/board-detail.do?id=${writeList.board_id}`">
                                                        <javatime:format value="${writeList.board_reg}" pattern="yyyy-MM-dd"/>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${not hasInfo}">
                                        <tr>
                                            <td colspan="3">게시글이 없습니다.</td>
                                        </tr>
                                    </c:if>
                                </table>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="contentbox-sns" id="content-b" style="display: none;"> <!--클릭시 자랑글 모달 띄우게 가능할까요?-->
                <div class="flex-center">
                    <div id="grid-div">
                        <c:choose>
                            <c:when test="${empty myGreentalk}">
                                <div>
                                    <button class="grid-item" id="createBragBtn" style="border: none; background-color: #ECECEC;">
                                        <img src="/static/images/camera_Icon.svg" alt="cameraIcon">
                                        <p style="margin-top: 10px;">올린 자랑글이 없습니다.</p>
                                    </button>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${myGreentalk}" var="greentalkList">
                                    <div class="grid-div">
                                        <%--OPEN MODAL--%>
                                        <button type="button" id="modal-open-btn" onclick="openModal(${greentalkList.green_id});">
                                            <img src="/static/images/storage/${greentalkList.green_pic}" alt="previewImg" class="grid-item">
                                        </button>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div id="move-green-div">
                    <button id="move-green-btn" onclick="window.location.href='${pageContext.request.contextPath}/board/greentalk.do'">
                        <p style="margin-top: 20px; font-weight: bold; font-size: large; color: #27AF5A;">그린톡 바로가기</p>
                    </button>
                </div>
            </div>
            <div class="contentbox--shopping" id="content-c" style="display: none;">
                <div id="purchaseProcess">
                    <ul style="list-style: none; display: flex; margin-top: 20px;">
                        <li>입금대기
                            <br>
                            <span>0</span>
                        </li>
                        <img src="../../../static/images/fluent_ios-arrow-24-filled.svg" alt="arrowImg">
                        <li>결제완료
                            <br>
                            <span>0</span>
                        </li>
                        <img src="../../../static/images/fluent_ios-arrow-24-filled.svg" alt="arrowImg">
                        <li>배송준비
                            <br>
                            <span>0</span>
                        </li>
                        <img src="../../../static/images/fluent_ios-arrow-24-filled.svg" alt="arrowImg">
                        <li>배송중
                            <br>
                            <span>0</span>
                        </li>
                        <img src="../../../static/images/fluent_ios-arrow-24-filled.svg" alt="arrowImg">
                        <li>배송완료
                            <br>
                            <span>0</span>
                        </li>
                        <img src="../../../static/images/fluent_ios-arrow-24-filled.svg" alt="arrowImg">
                        <li style="color: #27AF5A; font-weight: bold;">구매확정
                            <br>
                            <span>2</span>
                        </li>
                    </ul>
                </div>
                <div class="shoppingmenu">
                    <span style="font-size: 18px;">구매확정 목록</span>
                    <span>
                        <div class="shoppingdrop">
                            <select name="purchaseTime" id="purchaseTime" style="width: 100px; margin-top: -15px;">
                                <option value="1개월 전">1개월 전</option>
                                <option value="3개월 전" selected>3개월 전</option>
                                <option value="6개월 전">6개월 전</option>
                                <option value="1년 전">1년 전</option>
                                <option value="2년 전">2년 전</option>
                                <option value="3년 전">3년 전</option>
                            </select>
                        </div>
                    </span>
                </div>
                <div style="margin-top: 5px; width: 750px; height: 510px; background-color: #F5F7F6; border: solid #B5B5B5 1px;">
                    <!-- 1번 -->
                    <div style="margin-top: 20px; margin-left: 30px; display: flex; justify-content: space-between;">
                        <div>
                            <span style="font-weight: bold; font-size: 15px; margin: 5px;">구매확정
                            </span>
                            <img src="../../../static/images/Ellipse%2016.svg" alt="EllipseImg">
                            <span style="font-size: 15px; margin: 5px; ">6/13(목) 도착완료</span>
                        </div>
                        <button type="button" style="margin-right: 20px; color: #23C961;">배송 조회 ></button>
                    </div>
                    <div style="margin: 20px; display: flex; flex-direction: row; border-bottom: solid 1px gray;">
                        <span style="margin: 10px; margin-top: 0px;">
                            <button type="button" style="width: 170px; height: 130px; background-color: rgb(164, 161, 161); padding: 0%; border: none; border-radius: 7px;">
                                <!-- 나중에 쇼핑목록 이미지를 연결하기 -->
                                <img style="width: 100%; height: auto; object-fit: cover; border-radius: 7px;" src="../../../static/images/purchaseEX01.svg" alt="purchaseEXImg">
                            </button>
                        </span>
                        <div style="width: 100%; height: 100%;">
                            <p style="font-weight: bold;">진한 꽃향기 오렌지 자스민 실내공기정화 식물 인테리어식물<br>플랜테리어 화분</p>
                            <p style="margin-bottom: 0px;">1차옵션:오렌지 자스민 소 / 2차옵션: 없음</p>
                            <p>8,900원</p>
                            <div style="display: flex; justify-content: end; margin-bottom: 15px;">
                                <button type="button" class="purbtn1" style="width: 130px; height: 40px; margin-right: 10px; border: 1px solid #23C961; border-radius: 5px;">문의</button>
                                <button type="button" class="purbtn2" style="width: 130px; height: 40px; margin-left: 10px; border: 1px solid #23C961; border-radius: 5px;">리뷰작성</button>
                            </div>
                        </div>
                    </div>
                    <!-- 2번 -->
                    <div style="margin-top: 20px; margin-left: 30px; display: flex; justify-content: space-between;">
                        <div>
                            <span id="purchaseConfirm" style="font-weight: bold; font-size: 15px; margin: 5px;">구매확정
                            </span>
                            <img src="../../../static/images/Ellipse%2016.svg" alt="EllipseImg">
                            <span style="font-size: 15px; margin: 5px; ">6/13(목) 도착완료</span>
                        </div>
                        <button type="button" style="margin-right: 20px; color: #23C961;">배송 조회 ></button>
                    </div>
                    <div style="margin: 20px; display: flex; flex-direction: row;">
                        <span style="margin: 10px; margin-top: 0px;">
                            <button type="button" style="width: 170px; height: 130px; background-color: rgb(164, 161, 161); padding: 0%; border: none; border-radius: 7px;">
                                <!-- 나중에 쇼핑목록 이미지를 연결하기 -->
                                <img style="width: 100%; height: auto; object-fit: cover; border-radius: 7px;" src="../../../static/images/purchaseEX02.svg" alt="purchaseEXImg">
                            </button>
                        </span>
                        <div style="width: 100%; height: 100%;">
                            <p style="font-weight: bold;">진한 꽃향기 오렌지 자스민 실내공기정화 식물 인테리어식물<br>플랜테리어 화분</p>
                            <p style="margin-bottom: 0px;">1차옵션:오렌지 자스민 대 / 2차옵션: 없음</p>
                            <p class="price">28,900원</p>
                            <div style="display: flex; justify-content: end; margin-bottom: 15px;">
                                <button type="button" class="purbtn1" style="width: 130px; height: 40px; margin-right: 10px; border: 1px solid #23C961; border-radius: 5px;">문의</button>
                                <button type="button" class="purbtn2" style="width: 130px; height: 40px; margin-left: 10px; border: 1px solid #23C961; border-radius: 5px;">리뷰작성</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="${pageContext.request.contextPath}/chatbot.jsp"/>
        <div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" id="modal-modify" style="background-color: white !important;">
                    <form id="modify-form" action="${pageContext.request.contextPath}/member/modify.do" method="post" enctype="multipart/form-data">
                        <div id="modal-close-btn">
                            <button type="button" class="btn-close" id="modal-close-btn-detail" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="profilebox-header">
                            <div style="display: flex; align-items: center; flex-direction: column; margin-top: 4vh">
                                <div id="modify-profile-image" style="position: relative; display: inline-block;">
                                    <img src="${pageContext.request.contextPath}/static/images/storage/${loggedInMember.mem_pic}"
                                         id="profile-img" class="profile" alt="프로필사진"style="width: 20vh; height: 20vh; border-radius: 50%; border: 1px solid #CCCCCC;">
                                    <button type="button" id="upload-btn" style="position: absolute; bottom: 0; right: 0;">
                                        <img src="../../../static/images/modify_profile.svg">
                                    </button>
                                    <input type="file" name="modify_pic" id="img-file-upload" style="display: none">
                                </div>
                                <button type="button" id="del-profile-img" style="font-size: 0.8rem; color: #CCCCCC; margin-top: 1vh">이미지 삭제</button>
                            </div>
                        </div>
                        <div class="profilebox-body">
                            <div class="profile-div">
                                <p class="profile-modal-p">닉네임</p>
                                <input id="profile-nickname" name="mem_nickname" placeholder="${loggedInMember.mem_nickname}" autocomplete="username">
                                <p class="profile-message" id="nickname-message">default</p>
                            </div>
                            <div class="profile-div">
                                <p class="profile-modal-p">비밀번호</p>
                                <input id="origin-password" type="password" placeholder="사용 중인 비밀번호를 입력해주세요." autocomplete="password">
                                <p class="profile-message" id="password-message">default</p>
                                <input type="hidden" id="origin-password-val" value="${loggedInMember.password}">
                            </div>
                            <div class="profile-div">
                                <p class="profile-modal-p">새 비밀번호</p>
                                <input id="newpassword" type="password" name="password" placeholder="새로운 비밀번호를 입력해주세요." autocomplete="new-password">
                                <p class="profile-message" id="newpassword-message">default</p>
                            </div>
                            <div class="profile-div">
                                <p class="profile-modal-p">새 비밀번호 확인</p>
                                <input id="newpassword-check" type="password" placeholder="한 번 더 입력해주세요." autocomplete="new-password">
                                <p class="profile-message" id="newpassword-check-message">default</p>
                            </div>
                            <div style="margin-top: 4vh; background: #23C961; width: 20vw; height: 7vh; border-radius: 5px; display: flex; justify-content: center">
                                <button type="submit" id="save-modify-btn" style="color: white; font-size: 1.3em; width: 100%; height: 100%;">변경사항 저장</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade" id="rank1modal">
            <div class="modal-dialog modal-xl">
                <div class="modal-content modal-greentalk">
                    <div class="modalbox">
                        <div class="modal-body">
                            <img src="/static/images/storage/${greentalk.file.filename}" alt="" class="modalmain">
                            <div class="modal-right">
                                <div class="modalthumb">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/thumbnail1.png" alt="" class="modalthumbnail" id="modalthumb1_1">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/thumbnail2.png" alt="" class="modalthumbnail" id="modalthumb1_2">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/thumbnail3.png" alt="" class="modalthumbnail" id="modalthumb1_3">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/thumbnail4.png" alt="" class="modalthumbnail" id="modalthumb1_4" style="height: 96.27px;">
                                </div>
                                <div class="modalcontentbox">
                                    <div class="modalcontents">
                                        <div class="writerpic">
                                            <img src="${pageContext.request.contextPath}/static/images/프로필사진.png" alt="" style="width: 30px; height: 30px;">
                                        </div>
                                        <div class="modalmaincon">
                                            karina87
                                        </div>
                                        <div class="modalmaindate">
                                            24.06.27
                                        </div>
                                        <div class="modalreport">
                                            <img src="${pageContext.request.contextPath}/static/images/그린톡/menu.png.png" alt="" style="width: 15px;">
                                        </div>
                                    </div>
                                    <div class="modalmaincontent">
                                        <p>123</p>
                                    </div>
                                </div>
                            </div>
                            <div class="title">
                                <p class="titlename">#초록  #자랑</p>
                                <div class="btnicon">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/bookmark_black.png" class="bookmarkicon" alt="북마크" style="display: inline;">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/filledbookmarkicon.png" class="filledbookmarkicon" alt="북마크" style="display: none;">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/hearticon.png" class="hearticon" alt="하트" style="display: inline;">
                                    <img src="${pageContext.request.contextPath}/static/images/그린톡/filledhearticon.png" class="filledhearticon" alt="채워진 하트" style="display: none;">
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
        <jsp:include page="../../../footer.jsp"/>
        <script>
            let originNickname = "";
            let nickname = "";
            let originPasswordVal = document.getElementById("origin-password-val").value;
            let originPassword = "";
            let newPassword = "";
            let newPasswordCheck = "";

            // 정규표현식
            const regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{8,15}$/;


            document.addEventListener('DOMContentLoaded', () => {
                const popupIcon = document.getElementById('popup-icon1');
                const popupContent = document.getElementById('popup-content1');
                const popupIcon2 = document.getElementById('popup-icon2');

                popupIcon.addEventListener('mouseover', () => {
                    popupContent.classList.remove('hidden');
                });

                popupIcon.addEventListener('mouseleave', () => {
                    popupContent.classList.add('hidden');
                });

                popupIcon2.addEventListener('click', () => {
                    window.scrollTo({ top: 0, behavior: 'smooth' });
                });
            });

            $(() => {
                $("#mycontentbtn").addClass("active");
                $(".mycontenttxt").css("color", "white");
                $("#mycontentbtn").click((e) => {
                    $("#testform").submit();

                    $("#mycontentbtn").addClass("active");
                    $("#snscontentbtn").removeClass("active");
                    $("#shopcontentbtn").removeClass("active");
                    $("#contype").trigger("click");
                    $(".mycontenttxt").css("color", "white");
                    $(".snspic").css("color", "#27AF5A");
                    $(".myshopping").css("color", "#27AF5A");
                    $("#content-a").show();
                    $("#content-b").hide();
                    $("#content-c").hide();
                });

                $("#snscontentbtn").click((e) => {
                    $("#mycontentbtn").removeClass("active");
                    $("#snscontentbtn").addClass("active");
                    $("#shopcontentbtn").removeClass("active");
                    $("#snstype").trigger("click");
                    $(".mycontenttxt").css("color", "#27AF5A");
                    $(".snspic").css("color", "white");
                    $(".myshopping").css("color", "#27AF5A");
                    $("#content-a").hide();
                    $("#content-b").show();
                    $("#content-c").hide();
                });

                $("#shopcontentbtn").click((e) => {
                    $("#mycontentbtn").removeClass("active");
                    $("#snscontentbtn").removeClass("active");
                    $("#shopcontentbtn").addClass("active");
                    $("#shoptype").trigger("click");
                    $(".mycontenttxt").css("color", "#27AF5A");
                    $(".snspic").css("color", "#27AF5A");
                    $(".myshopping").css("color", "white");
                    $("#content-a").hide();
                    $("#content-b").hide();
                    $("#content-c").show();
                });

                $("#upload-btn").on("click", (e) => {
                    document.getElementById('img-file-upload').click();
                });

                document.getElementById('img-file-upload').addEventListener('change', function(event) {
                    const file = event.target.files[0];
                    if (file) {
                        const reader = new FileReader();
                        reader.onload = function(e) {
                            const imgPreview = document.getElementById('profile-img');
                            imgPreview.src = e.target.result;
                        };
                        reader.readAsDataURL(file);
                    }
                });

                $("#del-profile-img").on("click", (e) => {
                    const defaultImageSrc = "/static/images/profile_default.svg"; // 기본 이미지 경로

                    fetch(defaultImageSrc)
                        .then(response => response.blob())
                        .then(blob => {
                            const defaultFile = new File([blob], "profile_default.svg", { type: "image/svg+xml" });

                            const dataTransfer = new DataTransfer();
                            dataTransfer.items.add(defaultFile);

                            const inputElement = document.getElementById('img-file-upload');
                            inputElement.files = dataTransfer.files;

                            const reader = new FileReader();
                            reader.onload = function(e) {
                                const imgPreview = document.getElementById('profile-img');
                                imgPreview.src = e.target.result;
                            };
                            reader.readAsDataURL(defaultFile);
                        })
                        .catch(error => {
                            console.error('Error fetching the default image:', error);
                        });
                });

                $("#profile-nickname").on("change", (e) => {
                    nickname = e.target.value;
                });

                $("#profile-nickname").on("blur", (e) => {
                    originNickname = nick.placeholder;
                    if(nickname !== ""){
                        if(nickname === originNickname) {
                            $("#nickname-message").css({
                                "visibility": "visible", "color": "red"
                            }).text("중복된 닉네임입니다.");
                        } else {
                            $("#nickname-message").css({
                                "visibility": "visible", "color": "green"
                            }).text("사용 가능한 닉네임입니다.");
                        }
                    } else {
                        $("#nickname-message").css({"visibility": "hidden"});
                    }
                });

                $("#origin-password").on("change", (e) => {
                    originPassword = e.target.value;
                });

                $("#origin-password").on("blur", (e) => {
                    if(originPassword === "") {
                        $("#password-message").css({"visibility": "hidden"});
                    } else {
                        if(originPassword !== originPasswordVal){
                            $("#password-message").css({
                                "visibility": "visible", "color": "red"
                            }).text("이전 비밀번호와 일치하지 않습니다.");
                        } else {
                            $("#password-message").css({
                                "visibility": "visible", "color": "green"
                            }).text("이전 비밀번호와 일치합니다.");
                        }
                    }
                });

                $("#newpassword").on("change", (e) => {
                    newPassword = e.target.value;
                });

                $("#newpassword").on("blur", (e) => {
                    if(newPassword === "") {
                        $("#newpassword-message").css({"visibility": "hidden"});
                    } else {
                        if(!regex.test(newPassword)) {
                            $("#newpassword-message").css({
                                "visibility": "visible", "color": "red"
                            }).text("비밀번호는 영문 숫자 특수기호 포함 8자리 이상으로 지정해주세요.");
                        } else {
                            $("#newpassword-message").css({
                                "visibility": "hidden"});
                        }
                    }
                });

                $("#newpassword-check").on("change", (e) => {
                    newPasswordCheck = e.target.value;
                });

                $("#newpassword-check").on("blur", (e) => {
                    if(newPasswordCheck === "") {
                        $("#newpassword-check-message").css({"visibility": "hidden"});
                    } else {
                        if(newPassword !== newPasswordCheck) {
                            $("#newpassword-check-message").css({
                                "visibility": "visible", "color": "red"
                            }).text("입력한 비밀번호와 다릅니다.");
                        } else {
                            $("#newpassword-check-message").css({
                                "visibility": "hidden"});
                        }
                    }
                });

                $("#modify-form").on("submit", function(event) {
                    event.preventDefault();

                    // 제출값 확인을 위한 변수 선언
                    const fileInput = document.getElementById('img-file-upload');

                    // 아무 값도 입력이 없거나 기존 비밀번호만 입력한 경우
                    if((originPassword === "" && nickname === "" && newPassword === "" && !fileInput.files.length) ||
                        (originPassword !== "" && nickname === "" && newPassword === "" && !fileInput.files.length)){
                        alert("값을 입력하세요.");
                    }

                    // 무언가 수정사항이 생겼을 때
                    if(nickname !== "" || newPassword !== "" || fileInput.files.length){
                        // 기존비밀번호 값이 빈칸이면
                        if(originPassword === ""){
                            alert("비밀번호를 입력해주세요.");
                            return;
                        }

                        // 패스워드 변경
                        if(newPassword !== ""){
                            if(originPassword === originPasswordVal && regex.test(newPassword) === true && newPassword === newPasswordCheck){
                                this.submit();
                            }
                        } else {
                            // 닉네임 변경, 이미지 변경
                            if(originPassword === originPasswordVal){
                                this.submit();
                            }
                        }
                    }
                });
            });
            <%--OPEN MODAL--%>
            const openModal = (greenId) => {
                // console.log(greenId);
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
    </body>
</html>
