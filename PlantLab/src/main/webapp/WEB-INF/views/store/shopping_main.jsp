<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>플랜트랩_쇼핑몰</title>
    <link rel="stylesheet" href="/static/css/store.css">
</head>
<body class="noto-sans-kr">
<jsp:include page="../../../nav.jsp"/>
<header>
    <img src="/static/images/쇼핑몰 헤더 이미지.png" alt="쇼핑몰 헤더">
</header>
<main>
    <div class="product_form">
        <h2>상품 등록</h2>
        <form id="productForm" enctype="multipart/form-data">
            <label for="brand">브랜드:</label>
            <input type="text" id="brand" name="brand" required><br>

            <label for="product_name">상품명:</label>
            <input type="text" id="product_name" name="product_name" required><br>

            <label for="price">가격:</label>
            <input type="number" id="price" name="price" required><br>

            <label for="discount">할인:</label>
            <input type="number" id="discount" name="discount"><br>

            <label for="rate">평점:</label>
            <input type="number" step="0.1" id="rate" name="rate"><br>

            <label for="color">색상:</label>
            <input type="text" id="color" name="color"><br>

            <label for="is_light">채광 유무:</label>
            <select id="is_light" name="is_light">
                <option value="true">양지</option>
                <option value="false">음지</option>
            </select><br>

            <label for="base_type">기본 형태:</label>
            <input type="text" id="base_type" name="base_type"><br>

            <label for="size">사이즈:</label>
            <input type="text" id="size" name="size"><br>

            <label for="tag">태그:</label>
            <input type="text" id="tag" name="tag"><br>

            <label for="file">파일:</label>
            <input type="file" id="file" name="file" required><br>

            <button type="submit">등록</button>
        </form>
        <img id="previewImage" style="max-width: 200px; display: none;" /> <!-- 이미지 미리보기 추가 -->
    </div>

    <div class="right-panel" id="rightPanel">
        <div class="toggle-button" id="toggleButton">
            <span class="arrow arrow-left"></span>
        </div>
        <div class="panel-content">
            <div class="panel-item">
                <div class="">
                    <a href="">
                        <img src="/static/images/카카오톡 상담.png" alt="카카오톡 상담">
                        <br>
                        카카오톡
                        <br>
                        상담문의
                    </a>
                </div>
            </div>
            <div class="panel-item">
                <a href="">
                    <img src="/static/images/마이페이지.png" alt="마이페이지">
                    <br>
                    마이페이지
                </a>
            </div>
            <div class="panel-item">
                <a href="">
                    <img src="/static/images/장바구니.png" alt="장바구니">
                    <br>
                    장바구니
                </a>
            </div>
            <div class="panel-item recent-items">
                <button id="prevBtn" style="border: none; background-color: white;"><img src="/static/images/좌측으로.png" alt="우측패널 좌측으로"></button>
                <div class="recent-item-viewer" id="recentItemViewer">
                    <img src="" alt="최근 상품" id="recentItemImage">
                </div>
                <button id="nextBtn" style="border: none; background-color: white;"><img src="/static/images/우측으로.png" alt="우측패널 우측으로"></button>
            </div>
            <div class="panel-item">
                <span id="recentItemsText">최근 열람 품목</span>
            </div>
            <span><button id="topBtn" style="background-color: white; border: none; margin-left: 66px;"><img src="/static/images/on top.png" alt="페이지 최상단으로"></button></span>
        </div>
    </div>
    <div class="overall_container">
        <div class="selector">
            <ul class="selector_group">
                <li class="item" id="item1" onclick="toggleAct(this)">#식물키트</li>
                <li class="item" id="item2" onclick="toggleAct(this)">#공기정화</li>
                <li class="item" id="item3" onclick="toggleAct(this)">#사무실</li>
                <li class="item" id="item4" onclick="toggleAct(this)">#인테리어</li>
                <li class="item" id="item5" onclick="toggleAct(this)">#간단식용</li>
                <li class="item" id="item6" onclick="toggleAct(this)">#미니식물</li>
            </ul>
        </div>
        <div class="sort_box">
            <div>
                <div class="color-container">
                    <span style="font-weight: bold; margin-right: 20px; margin-left: 20px; font-size: 20px;">색상</span>
                    <button class="circle" data-color="빨강" style="background-color: red;"></button>
                    <button class="circle" data-color="주황" style="background-color: orange;"></button>
                    <button class="circle" data-color="노랑" style="background-color: yellow;"></button>
                    <button class="circle" data-color="초록" style="background-color: green;"></button>
                    <button class="circle" data-color="파랑" style="background-color: blue;"></button>
                    <button class="circle" data-color="보라" style="background-color: indigo;"></button>
                    <button class="circle" data-color="분홍" style="background-color: violet;"></button>
                </div>
                <div class="sort_set">
                    <span style="font-weight: bold; margin-right: 40px;">꽃 / 열매 유무</span>
                    <label><input type="checkbox" name="flower" value="꽃"><span class="filter-text">꽃</span></label>
                    <label><input type="checkbox" name="fruit" value="열매"><span class="filter-text">열매</span></label>
                </div>
                <div class="sort_set">
                    <span style="font-weight: bold; margin-right: 40px;">채광 유무</span>
                    <label><input type="checkbox" name="light_mining" value="off"><span class="filter-text">음지(빛없는 실내)</span></label>
                    <label><input type="checkbox" name="light_mining" value="on"><span class="filter-text">양지(빛이 많은곳)</span></label>
                </div>
                <div class="sort_set">
                    <span style="font-weight: bold; margin-right: 40px;">원예 형태</span>
                    <label><input type="checkbox" name="horticultural_form" value="화분"><span class="filter-text">화분</span></label>
                    <label><input type="checkbox" name="horticultural_form" value="꽃병"><span class="filter-text">꽃병</span></label>
                    <label><input type="checkbox" name="horticultural_form" value="바구니"><span class="filter-text">바구니</span></label>
                </div>
                <div class="sort_set">
                    <span style="font-weight: bold; margin-right: 40px;">사이즈</span>
                    <label><input type="checkbox" name="size" value="마당용"><span class="filter-text">마당용</span></label>
                    <label><input type="checkbox" name="size" value="실내용"><span class="filter-text">실내용</span></label>
                    <label><input type="checkbox" name="size" value="탁상용"><span class="filter-text">탁상용(미니)</span></label>
                </div>
                <div class="sort_set">
                    <span style="font-weight: bold; margin-right: 40px;">할인 유무</span>
                    <label><input type="checkbox" id="sale" name="sale" value="on"><span class="filter-text">할인적용 상품</span></label>
                </div>
            </div>
        </div>
        <div class="goods_object" style="margin-bottom: 3rem;">
            <div class="entire_goods">
                <div class="dropdown1">
                    <button class="dropdown-btn" onclick="toggleDropdown()">정렬기준 ▼</button>
                    <ul class="dropdown-menu">
                        <li data-sort="rating">평점순</li>
                        <li data-sort="price-asc">가격낮은순</li>
                        <li data-sort="price-desc">가격높은순</li>
                        <li data-sort="views">조회순</li>
                    </ul>
                </div>
            </div>
            <h1 style="display: inline; margin-right: 5px;">식물 상품</h1>
            <p style="display: inline; font-size: 25px;">나에게 맞는 식물친구들을 찾아보세요</p>
        </div>

        <!-- 상품 목록 시작 -->
        <div id="product-container" class="product_container">
            <c:forEach var="product" items="${products}">
                <div class="product_row">
                    <div class="product_item">
                        <a href="/purchase.do">
                            <img src="${product.file_name}" alt="물품 이미지">
                            <div class="goods_border">
                                <p class="product_title">${product.product_name}</p>
                                <p class="product_company">${product.brand}</p>
                                <p class="product_price">${product.price} 원</p>
                                <p class="product_rating">평점: ${product.rate}</p>
                            </div>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- 상품 목록 끝 -->

    </div>
</main>
<div id="popup-icon1">
    <img src="/static/images/챗봇아이콘.png" alt="Popup Icon" id="popup-image" style="width: 60px; height: 60px;">
</div>
<div id="popup-content1" class="hidden">
    <p>안녕하세요! 플랜트 봇 입니다!<br>궁금한 것은 모두 플랜트 봇에게 물어보세요!</p>
</div>
<div id="popup-icon2">
    <img src="/static/images/top아이콘.png" alt="Popup Icon" id="popup-image" style="width: 60px; height: 60px;">
</div>
<div class="f_container">
    <div style="margin: auto 50px;">
        <!-- <img width="150px" height="150px" src="/static/images/round_logo_colorBack.svg" alt="플랜트팜 로고"> -->
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const productForm = document.getElementById('productForm');
        const previewImage = document.getElementById('previewImage');
        const productContainer = document.getElementById('product-container');

        productForm.addEventListener('submit', function(event) {
            event.preventDefault();

            const formData = new FormData(productForm);

            const productDto = {
                brand: document.getElementById('brand').value || "", // 기본값으로 빈 문자열 설정
                product_name: document.getElementById('product_name').value || "",
                price: document.getElementById('price').value || 0,
                discount: document.getElementById('discount').value || 0.0,
                rate: document.getElementById('rate').value || 0.0,
                color: document.getElementById('color').value || "",
                is_light: document.getElementById('is_light').value === "true",
                base_type: document.getElementById('base_type').value || "",
                size: document.getElementById('size').value || "",
                tag: document.getElementById('tag').value || "",
            };
            formData.append('productDto', new Blob([JSON.stringify(productDto)], { type: 'application/json' }));

            fetch('http://localhost:8090/save', {
                method: 'POST',
                body: formData
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    if (data) {
                        addProductToContainer(data);
                        productForm.reset();
                        previewImage.style.display = 'none';
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('An error occurred: ' + error.message); // 에러 알림 추가
                });
        });

        const fileInput = document.getElementById('file');
        fileInput.addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    previewImage.src = e.target.result;
                    previewImage.style.display = 'block';
                };
                reader.readAsDataURL(file);
            } else {
                previewImage.style.display = 'none';
            }
        });

        function addProductToContainer(product) {
            const productItem = document.createElement('div');
            productItem.classList.add('product_item');

            const productLink = document.createElement('a');
            productLink.href = '/purchase.do';

            const productImage = document.createElement('img');
            productImage.src = product.file_name;
            productImage.alt = '물품 이미지';

            const goodsBorder = document.createElement('div');
            goodsBorder.classList.add('goods_border');

            const productTitle = document.createElement('p');
            productTitle.classList.add('product_title');
            productTitle.textContent = product.product_name;

            const productCompany = document.createElement('p');
            productCompany.classList.add('product_company');
            productCompany.textContent = product.brand;

            const productPrice = document.createElement('p');
            productPrice.classList.add('product_price');
            productPrice.textContent = product.price + ' 원';

            const productRating = document.createElement('p');
            productRating.classList.add('product_rating');
            productRating.textContent = '평점: ' + product.rate;

            goodsBorder.appendChild(productTitle);
            goodsBorder.appendChild(productCompany);
            goodsBorder.appendChild(productPrice);
            goodsBorder.appendChild(productRating);

            productLink.appendChild(productImage);
            productLink.appendChild(goodsBorder);
            productItem.appendChild(productLink);

            const lastRow = productContainer.querySelector('.product_row:last-child');
            if (lastRow && lastRow.children.length < 3) {
                lastRow.appendChild(productItem);
            } else {
                const newRow = document.createElement('div');
                newRow.classList.add('product_row');
                newRow.appendChild(productItem);
                productContainer.appendChild(newRow);
            }
        }

        const filters = {
            category: null,
            color: null,
            rating: null,
            light_mining: [],
            horticultural_form: [],
            size: [],
            sale: null,
            flower: null,
            fruit: null,
            sort: null
        };

        function applyFilters() {
            let filteredProducts = Array.from(document.querySelectorAll('.product_item'));

            if (filters.category) {
                filteredProducts = filteredProducts.filter(product => product.getAttribute('data-category') === filters.category);
            }

            if (filters.color) {
                filteredProducts = filteredProducts.filter(product => product.getAttribute('data-color') === filters.color);
            }

            if (filters.rating) {
                filteredProducts = filteredProducts.filter(product => parseFloat(product.getAttribute('data-rating')) >= filters.rating);
            }

            if (filters.light_mining.length > 0) {
                filteredProducts = filteredProducts.filter(product => filters.light_mining.includes(product.getAttribute('data-light_mining')));
            }

            if (filters.horticultural_form.length > 0) {
                filteredProducts = filteredProducts.filter(product => filters.horticultural_form.includes(product.getAttribute('data-horticultural_form')));
            }

            if (filters.size.length > 0) {
                filteredProducts = filteredProducts.filter(product => filters.size.includes(product.getAttribute('data-size')));
            }

            if (filters.sale) {
                filteredProducts = filteredProducts.filter(product => product.getAttribute('data-sale') === filters.sale);
            }

            if (filters.flower) {
                filteredProducts = filteredProducts.filter(product => product.getAttribute('data-flower') === filters.flower);
            }

            if (filters.fruit) {
                filteredProducts = filteredProducts.filter(product => product.getAttribute('data-fruit') === filters.fruit);
            }

            if (filters.sort) {
                filteredProducts.sort((a, b) => {
                    if (filters.sort === 'rating') {
                        return parseFloat(b.getAttribute('data-rating')) - parseFloat(a.getAttribute('data-rating'));
                    } else if (filters.sort === 'price-asc') {
                        return parseFloat(a.querySelector('.product_price').textContent.replace(/[^0-9.-]+/g, "")) - parseFloat(b.querySelector('.product_price').textContent.replace(/[^0-9.-]+/g, ""));
                    } else if (filters.sort === 'price-desc') {
                        return parseFloat(b.querySelector('.product_price').textContent.replace(/[^0-9.-]+/g, "")) - parseFloat(a.querySelector('.product_price').textContent.replace(/[^0-9.-]+/g, ""));
                    }
                    return 0;
                });
            }

            productContainer.innerHTML = '';

            let currentRow;
            filteredProducts.forEach((product, index) => {
                if (index % 3 === 0) {
                    currentRow = document.createElement('div');
                    currentRow.classList.add('product_row');
                    productContainer.appendChild(currentRow);
                }
                currentRow.appendChild(product);

                const img = product.querySelector('img');
                if (img) {
                    img.style.width = '100%';
                    img.style.height = 'auto';
                }
            });

            const emptyItemsToAdd = (3 - (filteredProducts.length % 3)) % 3;
            for (let i = 0; i < emptyItemsToAdd; i++) {
                const emptyItem = document.createElement('div');
                emptyItem.classList.add('product_item');
                emptyItem.style.visibility = 'hidden';
                currentRow.appendChild(emptyItem);
            }
        }

        document.querySelectorAll('.selector .item').forEach(item => {
            item.addEventListener('click', function() {
                const category = item.textContent.replace('#', '');
                filters.category = (filters.category === category) ? null : category;
                document.querySelectorAll('.selector .item').forEach(i => i.classList.remove('act'));
                if (filters.category) item.classList.add('act');
                applyFilters();
            });
        });

        document.querySelectorAll('.color-container .circle').forEach(circle => {
            circle.addEventListener('click', function() {
                filters.color = (filters.color === circle.getAttribute('data-color')) ? null : circle.getAttribute('data-color');
                document.querySelectorAll('.color-container .circle').forEach(c => c.classList.remove('selected'));
                if (filters.color) circle.classList.add('selected');
                applyFilters();
            });
        });

        document.querySelectorAll('input[name="light_mining"]').forEach(input => {
            input.addEventListener('change', function(event) {
                if (event.target.checked) {
                    filters.light_mining.push(event.target.value);
                } else {
                    filters.light_mining = filters.light_mining.filter(value => value !== event.target.value);
                }
                applyFilters();
            });
        });

        document.querySelectorAll('input[name="horticultural_form"]').forEach(input => {
            input.addEventListener('change', function(event) {
                if (event.target.checked) {
                    filters.horticultural_form.push(event.target.value);
                } else {
                    filters.horticultural_form = filters.horticultural_form.filter(value => value !== event.target.value);
                }
                applyFilters();
            });
        });

        document.querySelectorAll('input[name="size"]').forEach(input => {
            input.addEventListener('change', function(event) {
                if (event.target.checked) {
                    filters.size.push(event.target.value);
                } else {
                    filters.size = filters.size.filter(value => value !== event.target.value);
                }
                applyFilters();
            });
        });

        document.querySelectorAll('input[name="sale"]').forEach(input => {
            input.addEventListener('change', function(event) {
                filters.sale = event.target.checked ? event.target.value : null;
                applyFilters();
            });
        });

        document.querySelectorAll('input[name="flower"]').forEach(input => {
            input.addEventListener('change', function(event) {
                filters.flower = event.target.checked ? event.target.value : null;
                applyFilters();
            });
        });

        document.querySelectorAll('input[name="fruit"]').forEach(input => {
            input.addEventListener('change', function(event) {
                filters.fruit = event.target.checked ? event.target.value : null;
                applyFilters();
            });
        });

        document.querySelector('.dropdown1 .dropdown-menu').addEventListener('click', function(event) {
            filters.sort = event.target.getAttribute('data-sort');
            applyFilters();
            const menu = document.querySelector('.dropdown1 .dropdown-menu');
            menu.style.display = 'none';
        });

        applyFilters();

        document.getElementById('toggleButton').addEventListener('click', function() {
            var panel = document.getElementById('rightPanel');
            panel.classList.toggle('open');
            var arrows = document.querySelectorAll('.toggle-button .arrow');
            arrows.forEach(arrow => arrow.classList.toggle('open'));
        });

        function updateRecentItemViewer() {
            const viewer = document.getElementById('recentItemImage');
            if (recentItems.length > 0) {
                viewer.src = recentItems[currentIndex];
            } else {
                viewer.src = 'https://via.placeholder.com/30';
            }
        }

        let recentItems = [];
        let currentIndex = 0;

        document.getElementById('prevBtn').addEventListener('click', function() {
            if (recentItems.length > 0) {
                currentIndex = (currentIndex - 1 + recentItems.length) % recentItems.length;
                updateRecentItemViewer();
            }
        });

        document.getElementById('nextBtn').addEventListener('click', function() {
            if (recentItems.length > 0) {
                currentIndex = (currentIndex + 1) % recentItems.length;
                updateRecentItemViewer();
            }
        });

        document.getElementById('topBtn').addEventListener('click', function() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });

        updateRecentItemViewer();
    });
</script>
</body>
</html>