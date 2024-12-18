/// 시간 체크 변수
// let checkMinute = now.getMinutes();
// let checkHour = now.getHours();
//
//
// if(quantity <= 10) {
//     // 맑음
//     $('#weatherImg').attr('src', `/static/images/sunny.svg`);
//     $('#result').html(`<div>${temperature} ˚C<br>맑음</div>`);
// } else if(quantity <= 60){
//     // 흐림
//     $('#weatherImg').attr('src', "/static/images/rainny.svg");
//     $('#result').html(`<div>${temperature} ˚C<br>흐림</div>`);
// } else {
//     // 비
//     $('#weatherImg').attr('src', "/static/images/strongRainny.svg");
//     $('#result').html(`<div>${temperature} ˚C<br> 비(${rain})</div>`);
// }

// const interval = setInterval(() => {
//     checkMinute++;
//     if(checkMinute > 59) {
//         checkMinute = 0;
//         checkHour++;
//     }
//     if(
//         checkHour === 2 || checkHour === 5 || checkHour === 8 || checkHour === 11 ||
//         checkHour === 14 || checkHour === 17 || checkHour === 20 || checkHour === 23
//     ) {
//         location.reload();
//     }
// }, 60000);