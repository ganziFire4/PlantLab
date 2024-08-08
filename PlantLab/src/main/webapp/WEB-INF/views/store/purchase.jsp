<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${product.product_name} - 상세 페이지</title>
    <link rel="stylesheet" href="/static/css/purchase.css">
</head>
<body class="noto-sans-kr">
<jsp:include page="../../../nav.jsp"/>
<header>
    <img src="/static/images/쇼핑몰 헤더 이미지.png" alt="쇼핑몰 헤더">
</header>
<main>
    <div class="main-container">
        <div class="right-panel" id="rightPanel">
            <!-- Panel content -->
        </div>
        <img src="${pageContext.request.contextPath}/static/images/product_img/${product.pics[0].file_name}" alt="${product.product_name}" class="product-image" data-bs-toggle="modal" data-bs-target="#modalimg">

        <div class="product-details">
            <div class="product-title">${product.product_name}</div>
            <div class="product-rating">★★★★★ (${product.view_count} 고객 후기)</div>
            <div class="discount-container">
                <div class="discount-rate">
                    ${product.discount}% <span class="original-price">${product.price}원</span>
                </div>
                <div class="final-price">${product.price * (1 - product.discount / 100)}<span class="currency">원</span></div>
            </div>
            <div class="shipping-info">배송비: 2,500원 (25,000원 이상 무료배송)</div>
            <div class="sale-period">판매: ${product.sell_start} ~ ${product.sell_end}</div>
            <div class="purchase-info">
                <div class="quantity_button">
                    <label for="quantity">수량: </label>
                    <input type="number" id="quantity" name="quantity" value="1" min="1" onchange="updatePrices()">
                </div>
                <p class="total-price"><span style="font-size: 30px;" id="calculated-price">${product.price * (1 - product.discount / 100)}</span>원</p>
            </div>
            <div class="button-container">
                <button type="button" id="buyNowButton">바로 구매</button>
                <button type="button" id="addToCartButton">장바구니</button>
            </div>
        </div>

        <div class="modal fade" id="modalimg">
            <div class="modal-dialog">
                <div class="modal-content">
                    <img src="${pageContext.request.contextPath}/static/images/product_img/${product.pics[0].file_name}" alt="${product.product_name}" class="modalimg">
                </div>
            </div>
        </div>

        <div class="tab-buttons">
            <button class="tab-link active" data-tab="details">상세정보</button>
            <button class="tab-link" data-tab="review">리뷰</button>
            <button class="tab-link" data-tab="qna">Q&A</button>
        </div>

        <div id="details" class="tab-content active">
            <!-- 상세정보 내용 -->
            <div class="purchase_introduce">
                <img src="/static/images/구매페이지1.png" alt="구매페이지 상세정보">
                <img src="/static/images/구매페이지2.png" alt="구매페이지 상세정보">
                <img src="/static/images/구매페이지3.png" alt="구매페이지 상세정보">
                <img src="/static/images/구매페이지4.png" alt="구매페이지 상세정보">
                <img src="/static/images/구매페이지5.png" alt="구매페이지 상세정보">
                <img src="/static/images/구매페이지6.png" alt="구매페이지 상세정보">
            </div>
        </div>

        <div id="review" class="tab-content">
            <!-- 리뷰 내용 -->
        </div>
        <div id="qna" class="tab-content">
            <!-- Q&A 내용 -->
        </div>
    </div>

    </script>
</main>
<jsp:include page="${pageContext.request.contextPath}/chatbot.jsp"/>
<jsp:include page="${pageContext.request.contextPath}/footer.jsp"/>
<script>
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
</script>
</body>
</html>
