const nickname = ['Mochi', 'Taro', 'Lemon', 'Daisy', 'Sunny'
                , 'Neko', 'Kiwi', 'Panda', 'Mango', 'Lily'
                , 'Peach', 'Bunny', 'Oreo', 'Pixie', 'Coco'];

function make_table(name, mode) {
    let str = `
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
    `;
    
    if(mode === `pop`){
        str += make_pop_row();
    } else if (mode === `info`) {
        str += make_pop_info();
    } else {
        str += make_rec_row(name);
    }
    str += `</tbody></table>`;

    return str;
}

function make_pop_row() {
    let nn;
    let str = ``;
    for(let i = 1; i <= 5; i++) {
        nn = Math.floor(Math.random() * 15);
        str += `
        <tr>
            <th scope="row">${i}</th>
            <td>인기글 ${i}</td>
            <td>${nickname[nn]}</td>
            <td>24.00.00</td>
            <td>0000</td>
            <td>000</td>
            <td>000</td>
        </tr>  
        `;
    }
    return str;
}

function make_rec_row(name) {
    let nn, w, g, s; 
    let str = ``;

    for(let i = 1; i <= 10; i++) {
        nn = Math.floor(Math.random() * 15);
        w = Math.round(Math.random() * 1500);
        g = Math.round(Math.random() * w);
        s = Math.round(Math.random() * g);
        str += `
        <tr class="pop_table">
            <th scope="row">${i}</th>
            <td>${name} ${i}</td>
            <td>${nickname[nn]}</td>
            <td>24.00.00</td>
            <td>${w}</td>
            <td>${s}</td>
            <td>${g}</td>
        </tr>  
        `;
    }
    return str;
}

function make_pop_info() {
    let str = `
    <tr>
        <th scope="row">1</th>
        <td>여름철 모기가 기피하는 식물은?</td>
        <td>관리자</td>
        <td>24.05.31</td>
        <td>5389</td>
        <td>1000</td>
        <td>2877</td>
    </tr>
    <tr>
        <th scope="row">2</th>
        <td>가을철 파리가 기피하는 식물은?</td>
        <td>김개똥</td>
        <td>23.09.23</td>
        <td>4545</td>
        <td>155</td>
        <td>333</td>
    </tr>
    <tr>
        <th scope="row">3</th>
        <td>겨울에도 식물이 살까요?</td>
        <td>홍멍충</td>
        <td>24.01.31</td>
        <td>3567</td>
        <td>1099</td>
        <td>2277</td>
    </tr>
    <tr>
        <th scope="row">4</th>
        <td>앗! 마리모 키우기 숨쉬기 보다 쉽다!</td>
        <td>정아무개</td>
        <td>24.06.24</td>
        <td>3333</td>
        <td>700</td>
        <td>1017</td>
    </tr>
    <tr>
        <th scope="row">5</th>
        <td>또다시 돌아온 금파시대! 파를 자급자족하는 방법은?</td>
        <td>김메롱</td>
        <td>23.08.11</td>
        <td>2855</td>
        <td>2119</td>
        <td>2777</td>
    </tr>
    `;
    return str;
}

function reset(){
    let str = `
    <div class="table_popular">
        <div class="t_headerbar">
            <img src="image/인기글 별.svg" alt="별" style="margin-right: 7px;">인기글
            <select name="pop_condition" id="pop_condition">
                <option value="조회수">조회수</option>
                <option value="공감순">공감순</option>
                <option value="스크랩">스크랩</option>
            </select>
        </div>
        <div class="table_content">
        </div>
    </div>
    <div class="table_recent">
        <div class="t_headerbar">0000개
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
        </div>
    </div>
    <div id="button">
        <a href="writing.html">글쓰기</a>
    </div>
    `;
    return str;
}

function greenTalkcontent() {
    let str = `
        <div class="content_container">
            <div id="button">
                <a href="#" id="writing">글쓰기</a>
            </div>
            <div class="dailycontent">
            <div class="card1" style="width: 546px;">
                <div class="card-header">
                <div class="card-writer">
                    <img src="image/자랑글/카리나.png" alt=""> karina87
                </div>
                <div class="report">
                    <img src="image/자랑글/menu.png.png" alt="신고 버튼" class="reportbtn">
                </div>
                </div>
                <img src="image/자랑글/rank1main.png" class="card-img-top" alt="..." data-bs-toggle="modal"
                data-bs-target="#rank1modal">
                <div class="card-body">
                  <p class="card-text">입양한지 100일째 ~ 무럭무럭 크는 우리집 뽀짝 그린이에요>_< 벌레도 없이 튼튼하게 자라는 중이에요</p>
                  <div class="tag-group">
                    <div class="tags">
                        <p class="tag1">#초록</p>
                        <p class="tag2">#자랑</p>
                    </div>
                    <div class="btnicon">
                        <img src="image/자랑글/bookmark_black.png" class="bookmarkicon" alt="북마크" style="display: inline;">
                        <img src="image/자랑글/filledbookmarkicon.png" class="filledbookmarkicon" alt="북마크" style="display: none;">
                        <img src="image/자랑글/hearticon.png" alt="" class="hearticon">
                        <img src="image/자랑글/filledhearticon.png" alt="" class="filledhearticon" style="display: none;">
                    </div>
                  </div>
                </div>
              </div>
              <div class="card2" style="width: 546px;">
                <div class="card-header">
                    <div class="card-writer">
                        <img src="image/자랑글/defaultprofile.png" alt="" style="width: 29px;">  장길산
                    </div>
                <div class="report">
                    <img src="image/자랑글/menu.png.png" alt="신고 버튼" class="reportbtn">
                </div>
                </div>
                <img src="image/자랑글/ranksample2.jpeg" class="card-img-top" alt="..." data-bs-toggle="modal"
                data-bs-target="#rank2modal">
                <div class="card-body">
                  <p class="card-text">오늘 심은 양파...^^</p>
                  <div class="tag-group">
                    <div class="tags">
                        <p class="tag1">#내돈내심</p>
                        <p class="tag2">#반찬</p>
                    </div>
                    <div class="btnicon">
                        <img src="image/자랑글/bookmark_black.png" class="bookmarkicon" alt="북마크" style="display: inline;">
                        <img src="image/자랑글/filledbookmarkicon.png" class="filledbookmarkicon" alt="북마크" style="display: none;">
                        <img src="image/자랑글/hearticon.png" alt="" class="hearticon" id="heart">
                        <img src="image/자랑글/filledhearticon.png" alt="" class="filledhearticon" style="display: none;">
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </div>
        <div class="normalcon">
            <div class="conimg">
                <img src="image/자랑글/emagesample1.jpg" alt="" class="thumbnail" id="normal1">
                <img src="image/자랑글/ranksample1.jpg" alt="" class="thumbnail" id="normal2">
                <img src="image/자랑글/ranksample1.jpg" alt="" class="thumbnail" id="normal3">
                <img src="image/자랑글/ranksample1.jpg" alt="" class="thumbnail" id="normal4">
                <img src="image/자랑글/ranksample1.jpg" alt="" class="thumbnail" id="normal5">
                <img src="image/자랑글/ranksample1.jpg" alt="" class="thumbnail" id="normal6">
            </div>
        </div>
    </div>
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
                <div class="modal-body">
                    <img src="images/rank1main.png" alt="" class="modalmain">
                    <div class="modal-right">
                        <div class="modalthumb">
                            <img src="image/자랑글/thumbnail1.png" alt="" class="modalthumbnail" id="modalthumb1">
                            <img src="image/자랑글/thumbnail2.png" alt="" class="modalthumbnail" id="modalthumb1">
                            <img src="image/자랑글/thumbnail3.png" alt="" class="modalthumbnail" id="modalthumb1">
                            <img src="image/자랑글/thumbnail4.png" alt="" class="modalthumbnail" id="modalthumb1" style="height: 96.27px;">
                        </div>
                        <div class="modalcontentbox">
                            <div class="modalcontents">
                                <div class="writerpic">
                                    <img src="image/자랑글/카리나.png" alt="">
                                </div>
                                <div class="modalmaincon">
                                    karina87
                                </div>
                                <div class="modalmaindate">
                                    24.06.27
                                </div>
                                <div class="modalreport">
                                    <img src="image/자랑글/menu.png.png" alt="" style="width: 15px;">
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
                            <img src="image/자랑글/bookmark_black.png" class="bookmarkicon" alt="북마크" style="display: inline;">
                            <img src="image/자랑글/filledbookmarkicon.png" class="filledbookmarkicon" alt="북마크" style="display: none;">
                            <img src="image/자랑글/hearticon.png" class="hearticon" alt="하트" style="display: inline;">
                            <img src="image/자랑글/filledhearticon.png" class="filledhearticon" alt="채워진 하트" style="display: none;">
                        </div>
                    </div>
                    <div class="comment">
                        <input action="text" class="commentbox" placeholder="댓글을 입력하세요."
                        onfocus="placeholder=''" onblur="placeholder='댓글을 입력하세요.'"></input>
                        <div type="submit" class="confirmbox">게시</div>
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
                <div class="modal-body">
                    <img src="image/자랑글/ranksample2.jpeg" alt="" class="modalmain">
                    <div class="modal-right">
                        <div class="modalthumb">
                            <img src="image/자랑글/thumbnail1.png" alt="" class="modalthumbnail" id="modalthumb1">
                            <img src="image/자랑글/thumbnail2.png" alt="" class="modalthumbnail" id="modalthumb1">
                            <img src="image/자랑글/thumbnail3.png" alt="" class="modalthumbnail" id="modalthumb1">
                            <img src="image/자랑글/thumbnail4.png" alt="" class="modalthumbnail" id="modalthumb1" style="height: 96.27px;">
                        </div>
                        <div class="modalcontentbox">
                            <div class="modalcontents">
                                <div class="writerpic">
                                    <img src="image/자랑글/defaultprofile.png" alt="" style="width: 29px;">
                                </div>
                                <div class="modalmaincon">
                                    장길산
                                </div>
                                <div class="modalmaindate">
                                    24.06.28
                                </div>
                                <div class="modalreport">
                                    <img src="image/자랑글/menu.png.png" alt="" style="width: 15px;">
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
                            <img src="image/자랑글/bookmark_black.png" class="bookmarkicon" alt="북마크" style="display: inline;">
                            <img src="image/자랑글/filledbookmarkicon.png" class="filledbookmarkicon" alt="북마크" style="display: none;">
                            <img src="image/자랑글/hearticon.png" class="hearticon" alt="하트" style="display: inline;">
                            <img src="image/자랑글/filledhearticon.png" class="filledhearticon" alt="채워진 하트" style="display: none;">
                        </div>
                    </div>
                    <div class="comment">
                        <input action="text" class="commentbox" placeholder="댓글을 입력하세요."
                        onfocus="placeholder=''" onblur="placeholder='댓글을 입력하세요.'"></input>
                        <div type="submit" class="confirmbox">게시</div>
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
    `;
    return str;
}