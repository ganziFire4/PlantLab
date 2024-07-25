<%--
  Created by IntelliJ IDEA.
  User: phani
  Date: 24. 7. 24.
  Time: 오후 7:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<html>
<head>
    <title>플랜트랩:그린톡</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/greentalk.css">
</head>
<body class="noto-sans-kr">
    <jsp:include page="../../../nav.jsp"/>
    <header id="header">
    <!-- <img src="images/header_정보.png" alt="글쓰기 헤더"> 자랑글 페이지용 헤더 만들기 -->
    </header>
    <div class="container">
        <div class="dailycontent">
            <div class="card1" style="width: 546px;">
                <div class="card-header">
                    <div class="card-writer">
                        <img src="images/프로필사진.png" alt="" style="width: 30px; height: 30px;"> karina87
                    </div>
                    <div class="report">
                        <img src="images/menu.png.png" alt="신고 버튼" class="reportbtn">
                    </div>
                </div>
                <img src="" class="card-img-top" alt="..." data-bs-toggle="modal"
                     data-bs-target="#rank1modal">
                <div class="card-body">
                    <p class="card-text">입양한지 100일째 ~ 무럭무럭 크는 우리집 뽀짝 그린이에요>_< 벌레도 없이 튼튼하게 자라는 중이에요</p>
                    <div class="tag-group">
                        <div class="tags">
                            <p class="tag1">#초록</p>
                            <p class="tag2">#자랑</p>
                        </div>
                        <div class="btnicon">
                            <img src="images/bookmark_black.png" class="bookmarkicon" alt="북마크" style="display: inline;">
                            <img src="images/filledbookmarkicon.png" class="filledbookmarkicon" alt="북마크" style="display: none;">
                            <img src="images/hearticon.png" alt="" class="hearticon">
                            <img src="images/filledhearticon.png" alt="" class="filledhearticon" style="display: none;">
                        </div>
                    </div>
                </div>
            </div>
            <div class="card2" style="width: 546px;">
                <div class="card-header">
                    <div class="card-writer">
                        <img src="images/defaultprofile.png" alt="" style="width: 29px;">  장길산
                    </div>
                    <div class="report">
                        <img src="images/menu.png.png" alt="신고 버튼" class="reportbtn">
                    </div>
                </div>
                <img src="images/ranksample2.jpeg" class="card-img-top" alt="..." data-bs-toggle="modal"
                     data-bs-target="#rank2modal">
                <div class="card-body">
                    <p class="card-text">오늘 심은 양파...^^</p>
                    <div class="tag-group">
                        <div class="tags">
                            <p class="tag1">#내돈내심</p>
                            <p class="tag2">#반찬</p>
                        </div>
                        <div class="btnicon">
                            <img src="images/bookmark_black.png" class="bookmarkicon" alt="북마크" style="display: inline;">
                            <img src="images/filledbookmarkicon.png" class="filledbookmarkicon" alt="북마크" style="display: none;">
                            <img src="images/hearticon.png" alt="" class="hearticon" id="heart">
                            <img src="images/filledhearticon.png" alt="" class="filledhearticon" style="display: none;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="normalcon">
        <div class="conimg">
            <img src="images/emagesample1.jpg" alt="" class="thumbnail" id="normal1">
            <img src="images/ranksample1.jpg" alt="" class="thumbnail" id="normal2">
            <img src="images/ranksample1.jpg" alt="" class="thumbnail" id="normal3">
        </div>
    </div>
    </div>
        <jsp:include page="../../../footer.jsp"/>
    <!--modal 팝업-->
    <div class="modal fade" id="rank1modal">
        <div class="modal-dialog modal-xl">
            <!--.modal-content: 모달의 콘텐츠 영역-->
            <div class="modal-content">
                <!--.modal-header: 모달의 헤더 영역-->
                <!-- <div class="modal-header">
                    <h3>슈퍼푸드</h3>
                </div> -->
                <!--.modal-body: 모달의 바디 영역-->
                <div class="modalbox">
                    <div class="modal-body">
                        <img src="images/rank1main.png" alt="" class="modalmain">
                        <div class="modal-right">
                            <div class="modalthumb">
                                <img src="images/thumbnail1.png" alt="" class="modalthumbnail" id="modalthumb1">
                                <img src="images/thumbnail2.png" alt="" class="modalthumbnail" id="modalthumb1">
                                <img src="images/thumbnail3.png" alt="" class="modalthumbnail" id="modalthumb1">
                                <img src="images/thumbnail4.png" alt="" class="modalthumbnail" id="modalthumb1" style="height: 96.27px;">
                            </div>
                            <div class="modalcontentbox">
                                <div class="modalcontents">
                                    <div class="writerpic">
                                        <img src="images/프로필사진.png" alt="" style="width: 30px; height: 30px;">
                                    </div>
                                    <div class="modalmaincon">
                                        karina87
                                    </div>
                                    <div class="modalmaindate">
                                        24.06.27
                                    </div>
                                    <div class="modalreport">
                                        <img src="images/menu.png.png" alt="" style="width: 15px;">
                                    </div>
                                </div>
                                <div class="modalmaincontent">
                                    <p>입양한지 100일째 ~ 무럭무럭 크는 우리집 뽀짝<br>그린이에요>_<<br>벌레도 없이 튼튼하게 자라는 중이에요</p>
                                </div>
                            </div>
                        </div>
                        <div class="title">
                            <p class="titlename">#초록  #자랑</p>
                            <div class="btnicon">
                                <img src="images/bookmark_black.png" class="bookmarkicon" alt="북마크" style="display: inline;">
                                <img src="images/filledbookmarkicon.png" class="filledbookmarkicon" alt="북마크" style="display: none;">
                                <img src="images/hearticon.png" class="hearticon" alt="하트" style="display: inline;">
                                <img src="images/filledhearticon.png" class="filledhearticon" alt="채워진 하트" style="display: none;">
                            </div>
                        </div>
                        <div class="comment">
                            <input action="text" class="commentbox" placeholder="댓글을 입력하세요."
                                   onfocus="placeholder=''" onblur="placeholder='댓글을 입력하세요.'"></input>
                            <div type="submit" class="confirmbox">게시</div>
                        </div>
                    </div>
                </div>
                <!--.modal-body: 모달의 푸터 영역-->
                <!-- <div class="modal-footer"> -->
                <!--data-bs-dismiss="modal": 클릭 시 모달창 닫기-->
                <!-- <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
            </div> -->
            </div>
        </div>
    </div>
    <div class="modal fade" id="rank2modal">
        <div class="modal-dialog modal-xl">
            <!--.modal-content: 모달의 콘텐츠 영역-->
            <div class="modal-content">
                <!--.modal-header: 모달의 헤더 영역-->
                <!-- <div class="modal-header">
                    <h3>슈퍼푸드</h3>
                </div> -->
                <!--.modal-body: 모달의 바디 영역-->
                <div class="modalbox">
                    <div class="modal-body">
                        <img src="images/ranksample2.jpeg" alt="" class="modalmain">
                        <div class="modal-right">
                            <div class="modalthumb">
                                <img src="images/thumbnail1.png" alt="" class="modalthumbnail" id="modalthumb1">
                                <img src="images/thumbnail2.png" alt="" class="modalthumbnail" id="modalthumb1">
                                <img src="images/thumbnail3.png" alt="" class="modalthumbnail" id="modalthumb1">
                                <img src="images/thumbnail4.png" alt="" class="modalthumbnail" id="modalthumb1" style="height: 96.27px;">
                            </div>
                            <div class="modalcontentbox">
                                <div class="modalcontents">
                                    <div class="writerpic">
                                        <img src="images/defaultprofile.png" alt="" style="width: 30px;">
                                    </div>
                                    <div class="modalmaincon">
                                        장길산
                                    </div>
                                    <div class="modalmaindate">
                                        24.06.28
                                    </div>
                                    <div class="modalreport">
                                        <img src="images/menu.png.png" alt="" style="width: 15px;">
                                    </div>
                                </div>
                                <div class="modalmaincontent">
                                    <p>오늘 심은 양파...^^</p>
                                </div>
                            </div>
                        </div>
                        <div class="title">
                            <p class="titlename">#내돈내심  #반찬</p>
                            <div class="btnicon">
                                <img src="images/bookmark_black.png" class="bookmarkicon" alt="북마크" style="display: inline;">
                                <img src="images/filledbookmarkicon.png" class="filledbookmarkicon" alt="북마크" style="display: none;">
                                <img src="images/hearticon.png" class="hearticon" alt="하트" style="display: inline;">
                                <img src="images/filledhearticon.png" class="filledhearticon" alt="채워진 하트" style="display: none;">
                            </div>
                        </div>
                        <div class="comment">
                            <input action="text" class="commentbox" placeholder="댓글을 입력하세요."
                                   onfocus="placeholder=''" onblur="placeholder='댓글을 입력하세요.'"></input>
                            <div type="submit" class="confirmbox">게시</div>
                        </div>
                    </div>
                </div>
                <!--.modal-body: 모달의 푸터 영역-->
                <!-- <div class="modal-footer"> -->
                <!--data-bs-dismiss="modal": 클릭 시 모달창 닫기-->
                <!-- <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
            </div> -->
            </div>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const cardTexts = document.querySelectorAll('.card-text');

            cardTexts.forEach(function(cardText) {
                const text = cardText.textContent.trim();
                const maxLength = 30;

                if (text.length > maxLength) {
                    const trimmedText = text.slice(0, maxLength) + '...';
                    cardText.textContent = trimmedText;
                }
            });
        });
    </script>
</body>
</html>
