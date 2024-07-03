const now = new Date();
        let nowMonth = now.getMonth()+1;
        let zeroMonth = '0' + nowMonth;
        let zeroDate = '0' + now.getDate();
        let defaultHour = now.getHours();

        if(defaultHour < 5){
            defaultHour = 2;
        } else if(defaultHour < 8) {
            defaultHour = 5;
        } else if(defaultHour < 11) {
            defaultHour = 8;
        } else if(defaultHour < 14) {
            defaultHour = 11;
        } else if(defaultHour < 17) {
            defaultHour = 14;
        } else if(defaultHour < 20) {
            defaultHour = 17;
        } else if(defaultHour < 23) {
            defaultHour = 20;
        } else if(defaultHour < 2) {
            defaultHour = 21;
        }
        let zeroHour = '0' + defaultHour;

        let year = now.getFullYear();
        let month = zeroMonth.substr(-2);
        let date = zeroDate.substr(-2);
        let hour = zeroHour.substr(-2);
        let fulldate = year + month + date;
        let url = `https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=gIQrlKBkoGwsDw%2BrhZZZ47LwsVb%2BsbXkagAhe20dhc5nBBIQUxXsw7PB38hiMm8JNRN%2FnVI23Kv6glqRx3C94Q%3D%3D&pageNo=1&numOfRows=1000&dataType=JSON&base_date=${fulldate}&base_time=${hour}00&nx=61&ny=126`;
        // let url = `https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=gIQrlKBkoGwsDw%2BrhZZZ47LwsVb%2BsbXkagAhe20dhc5nBBIQUxXsw7PB38hiMm8JNRN%2FnVI23Kv6glqRx3C94Q%3D%3D&pageNo=1&numOfRows=1000&dataType=JSON&base_date=${year}${month}${date}&base_time=0530&nx=61&ny=126`;
        
        let temperature;
        let rain;
        let quantity;
        let tempNum = 0; // 온도
        let rainNum = 9; // 강수량
        let quantityNum = 7; // 강수확률

        // let second = now.getSeconds();
        let minute = now.getMinutes();
        console.log(url);
        $.getJSON(url, function(data) {
                temperature = data.response.body.items.item[tempNum].fcstValue;
                rain = data.response.body.items.item[rainNum].fcstValue;
                quantity = data.response.body.items.item[quantityNum].fcstValue;
                // console.log(url);
                if(quantity < 10) {
                    // 맑음 
                    $('#weatherImg').attr('src', 'image/sunny.svg');
                    $('#result').html(`<div>${temperature} ˚C<br>맑음</div>`);
                } else if(quantity < 30){
                    // 흐림
                    $('#weatherImg').attr('src', "image/rainny.svg");
                    $('#result').html(`<div>${temperature} ˚C<br>흐림</div>`);
                } else {
                    // 비
                    $('#weatherImg').attr('src', "image/strongRainny.svg");
                    $('#result').html(`<div>${temperature} ˚C<br> 비(${rain})</div>`);
                }
            });