package com.bit.springboard.service.impl;

import com.bit.springboard.dao.ProductDao;
import com.bit.springboard.dto.PicDto;
import com.bit.springboard.dto.ProductDto;
import com.bit.springboard.common.FileUtils;
import com.bit.springboard.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private FileUtils fileUtils;

    @Autowired
    private ProductDao productDao;

    @Override
    public ProductDto saveProduct(ProductDto productDto, MultipartFile file, String attachPath) {
        try {
            if (file != null && !file.isEmpty()) {
                String savedFileName = fileUtils.saveFile(file, attachPath);

                // 제품 저장
                ProductDto savedProductDto = productDao.saveProduct(productDto);

                // 파일 정보 저장
                PicDto picDto = new PicDto();
                picDto.setProduct_id(savedProductDto.getProduct_id());
                picDto.setFile_name("static/images/product_img/" + savedFileName); // 웹 경로로 저장
                picDto.setIs_main(true);
                productDao.savePic(picDto);
            } else {
                productDao.saveProduct(productDto);
            }
            return productDto;
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("File save failed", e);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Product save failed", e);
        }
    }

    @Override
    public List<ProductDto> getAllProducts() {
        return productDao.getAllProducts();
    }
}
