package com.bit.springboard.controller;

import com.bit.springboard.dto.ProductDto;
import com.bit.springboard.service.ProductService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;

    @PostMapping(value = "/save")
    @ResponseBody
    public ProductDto saveProduct(
            @RequestPart("productDto") ProductDto productDto,
            @RequestPart("file") MultipartFile file,
            HttpServletRequest request) {
        try {
            String attachPath = request.getSession().getServletContext().getRealPath("/") + "/static/images/product_img/";
            return productService.saveProduct(productDto, file, attachPath);
        } catch (Exception e) {
            e.printStackTrace();
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
