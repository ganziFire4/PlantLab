package com.bit.springboard.service;

import com.bit.springboard.dto.ProductDto;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ProductService {
    ProductDto saveProduct(ProductDto productDto, MultipartFile file, String attachPath);
    List<ProductDto> getAllProducts();
    ProductDto getProductById(int productId); // 추가된 메서드
    void incrementViewCount(int productId);
}