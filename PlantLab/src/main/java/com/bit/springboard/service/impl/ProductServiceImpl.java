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
import java.time.LocalDateTime;
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
            String savedFileName = null;
            if (file != null && !file.isEmpty()) {
                savedFileName = fileUtils.saveFile(file, attachPath);

                // 제품 저장
                ProductDto savedProductDto = productDao.saveProduct(productDto);

                // 파일 정보 저장
                PicDto picDto = new PicDto();
                picDto.setProduct_id(savedProductDto.getProduct_id());
                picDto.setFile_name(savedFileName); // 웹 경로로 저장
                picDto.setIs_main(true);
                productDao.savePic(picDto);
                savedProductDto.getPics().add(picDto); // 저장된 이미지 정보를 DTO에 추가

                return savedProductDto; // 저장된 제품 DTO 반환
            } else {
                return productDao.saveProduct(productDto);
            }
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
        List<ProductDto> products = productDao.getAllProducts();
        LocalDateTime now = LocalDateTime.now();

        // 판매 시간 내의 상품만 필터링, null인 경우는 필터링하지 않음
        products.removeIf(product ->
                (product.getSell_start() != null && now.isBefore(product.getSell_start())) ||
                        (product.getSell_end() != null && now.isAfter(product.getSell_end()))
        );

        return products;
    }

    @Override
    public void incrementViewCount(int productId) {
        productDao.incrementViewCount(productId);
    }
}
