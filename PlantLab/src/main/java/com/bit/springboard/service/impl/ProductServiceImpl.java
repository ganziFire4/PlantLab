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
    public ProductDto saveProduct(ProductDto productDto, MultipartFile file) {
        try {
            // 제품 저장
            productDao.saveProduct(productDto);

            if (file != null && !file.isEmpty()) {
                String savedFileName = fileUtils.saveFile(file);

                // 파일 정보 저장
                PicDto picDto = new PicDto();
                picDto.setProduct_id(productDto.getProduct_id());
                picDto.setFile_name(savedFileName);
                picDto.setIs_main(true); // 주 파일로 설정
                productDao.savePic(picDto);
            } else {
                // 파일 정보가 없을 경우 기본값으로 PicDto 저장
                PicDto picDto = new PicDto();
                picDto.setProduct_id(productDto.getProduct_id());
                picDto.setFile_name(""); // 기본값
                picDto.setIs_main(false); // 기본값
                productDao.savePic(picDto);
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