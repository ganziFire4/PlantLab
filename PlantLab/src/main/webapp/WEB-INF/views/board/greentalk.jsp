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
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/greentalk.css">
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>--%>
</head>
<body>
    <div class="greenbody">
    <div class="container_green">
        <div class="dailycontent">
            <div class="card1" style="width: 546px;">
                <div class="card-header">
                    <div class="card-writer">
                        <img src="${pageContext.request.contextPath}/static/images/프로필사진.png" alt="" style="width: 30px; height: 30px;"> 더미데이터
                    </div>
                    <div class="report">
                        <img src="${pageContext.request.contextPath}/static/images/그린톡/menu.png.png" alt="신고 버튼" class="reportbtn">
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
                            <img src="${pageContext.request.contextPath}/static/images/그린톡/bookmark_black.png" class="bookmarkicon" alt="북마크" style="display: inline;">
                            <img src="${pageContext.request.contextPath}/static/images/그린톡/filledbookmarkicon.png" class="filledbookmarkicon" alt="북마크" style="display: none;">
                            <img src="${pageContext.request.contextPath}/static/images/그린톡/hearticon.png" alt="" class="hearticon">
                            <img src="${pageContext.request.contextPath}/static/images/그린톡/filledhearticon.png" alt="" class="filledhearticon" style="display: none;">
                        </div>
                    </div>
                </div>
            </div>
            <div class="card2" style="width: 546px;">
                <div class="card-header">
                    <div class="card-writer">
                        <img src="${pageContext.request.contextPath}/static/images/그린톡/defaultprofile.png" alt="" style="width: 29px;">  장길산
                    </div>
                    <div class="report">
                        <img src="${pageContext.request.contextPath}/static/images/그린톡/menu.png.png" alt="신고 버튼" class="reportbtn">
                    </div>
                </div>
                <img src="${pageContext.request.contextPath}/static/images/그린톡/ranksample2.jpeg" class="card-img-top" alt="..." data-bs-toggle="modal"
                     data-bs-target="#rank2modal">
                <div class="card-body">
                    <p class="card-text">오늘 심은 양파...^^</p>
                    <div class="tag-group">
                        <div class="tags">
                            <p class="tag1">#내돈내심</p>
                            <p class="tag2">#반찬</p>
                        </div>
                        <div class="btnicon">
                            <img src="${pageContext.request.contextPath}/static/images/그린톡/bookmark_black.png" class="bookmarkicon" alt="북마크" style="display: inline;">
                            <img src="${pageContext.request.contextPath}/static/images/그린톡/filledbookmarkicon.png" class="filledbookmarkicon" alt="북마크" style="display: none;">
                            <img src="${pageContext.request.contextPath}/static/images/그린톡/hearticon.png" alt="" class="hearticon" id="heart">
                            <img src="${pageContext.request.contextPath}/static/images/그린톡/filledhearticon.png" alt="" class="filledhearticon" style="display: none;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <div class="normalcon">
        <div class="conimg">
            <img src="${pageContext.request.contextPath}/static/images/그린톡/emagesample1.jpg" alt="" class="thumbnail" id="normal1">
            <img src="${pageContext.request.contextPath}/static/images/그린톡/ranksample1.jpg" alt="" class="thumbnail" id="normal2">
            <img src="${pageContext.request.contextPath}/static/images/그린톡/ranksample1.jpg" alt="" class="thumbnail" id="normal3">
        </div>
    </div>
    </div>
    <!--modal 팝업-->
    <div class="modal fade" id="rank1modal">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modalbox">
                    <div class="modal-body">
                        <img src="${pageContext.request.contextPath}/static/images/그린톡/rank1main.png" alt="" class="modalmain">
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
                                    <p>입양한지 100일째 ~ 무럭무럭 크는 우리집 뽀짝<br>그린이에요>_<<br>벌레도 없이 튼튼하게 자라는 중이에요</p>
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
    <div class="modal fade" id="rank2modal">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modalbox">
                    <div class="modal-body">
                        <img src="${pageContext.request.contextPath}/static/images/ranksample2.jpeg" alt="" class="modalmain">
                        <div class="modal-right">
                            <div class="modalthumb">
                                <img src="${pageContext.request.contextPath}/static/images/thumbnail1.png" alt="" class="modalthumbnail" id="modalthumb2_1">
                                <img src="${pageContext.request.contextPath}/static/images/thumbnail2.png" alt="" class="modalthumbnail" id="modalthumb2_2">
                                <img src="${pageContext.request.contextPath}/static/images/thumbnail3.png" alt="" class="modalthumbnail" id="modalthumb2_3">
                                <img src="${pageContext.request.contextPath}/static/images/thumbnail4.png" alt="" class="modalthumbnail" id="modalthumb2_4" style="height: 96.27px;">
                            </div>
                            <div class="modalcontentbox">
                                <div class="modalcontents">
                                    <div class="writerpic">
                                        <img src="${pageContext.request.contextPath}/static/images/defaultprofile.png" alt="" style="width: 30px;">
                                    </div>
                                    <div class="modalmaincon">
                                        장길산
                                    </div>
                                    <div class="modalmaindate">
                                        24.06.28
                                    </div>
                                    <div class="modalreport">
                                        <img src="${pageContext.request.contextPath}/static/images/menu.png.png" alt="" style="width: 15px;">
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
                                <img src="${pageContext.request.contextPath}/static/images/bookmark_black.png" class="bookmarkicon" alt="북마크" style="display: inline;">
                                <img src="${pageContext.request.contextPath}/static/images/filledbookmarkicon.png" class="filledbookmarkicon" alt="북마크" style="display: none;">
                                <img src="${pageContext.request.contextPath}/static/images/hearticon.png" class="hearticon" alt="하트" style="display: inline;">
                                <img src="${pageContext.request.contextPath}/static/images/filledhearticon.png" class="filledhearticon" alt="채워진 하트" style="display: none;">
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
