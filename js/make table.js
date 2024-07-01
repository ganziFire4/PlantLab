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
        <tr>
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