package com.bit.springboard.controller;

import com.bit.springboard.dto.ProductDto;
import com.bit.springboard.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;

    @PostMapping(value = "/save", consumes = "multipart/form-data")
    @ResponseBody
    public ProductDto saveProduct(
            @RequestPart(value = "productDto", required = false) ProductDto productDto,
            @RequestPart(value = "file", required = false) MultipartFile file) {
        try {
            if (productDto == null) {
                productDto = new ProductDto(); // 기본값으로 초기화된 DTO 생성
            }
            return productService.saveProduct(productDto, file);
        } catch (Exception e) {
            e.printStackTrace();  // 서버 콘솔에 예외 로그 출력
            throw new RuntimeException("Product save failed", e);
        }
    }

    @GetMapping("/all")
    @ResponseBody
    public List<ProductDto> getAllProducts() {
        return productService.getAllProducts();
    }

    @GetMapping("/shopping_main.do")
    public String shoppingMain() {
        return "/WEB-INF/views/store/shopping_main";
    }

    @GetMapping("/purchase.do")
    public String purchase() {
        return "/WEB-INF/views/store/purchase";
    }
}