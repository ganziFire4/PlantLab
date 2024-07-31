package com.bit.springboard.service.impl;

import com.bit.springboard.dto.ProductDto;
import com.bit.springboard.common.StoreFileUtils;
import com.bit.springboard.dao.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class ProductServiceImpl {
    @Autowired
    private StoreFileUtils fileUtils;

    @Autowired
    private ProductDao productDao;

    public ProductDto saveProduct(ProductDto productDto, MultipartFile file) {
        if (file != null && !file.isEmpty()) {
            try {
                String savedFileName = fileUtils.saveFile(file);
                productDto.setFile_name(savedFileName);
            } catch (IOException e) {
                // 예외 처리
                e.printStackTrace();
            }
        }
        productDao.saveProduct(productDto);
        return productDto;
    }

    public List<ProductDto> getAllProducts() {
        return productDao.getAllProducts();
    }
}