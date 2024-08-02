package com.bit.springboard.controller;

import com.bit.springboard.dto.ProductDto;
import com.bit.springboard.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ProductController {

    private final ProductService productService;

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/shoppingMain.do")
    public String shoppingMain(Model model) {
        List<ProductDto> products = productService.getAllProducts();
        model.addAttribute("products", products);
        return "WEB-INF/views/store/shopping_main";
    }

    @GetMapping("/purchase.do")
    public String purchaseProduct(Model model) {
        return "WEB-INF/views/store/purchase";
    }
}