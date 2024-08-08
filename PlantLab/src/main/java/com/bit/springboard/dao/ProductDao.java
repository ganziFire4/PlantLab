package com.bit.springboard.dao;

import com.bit.springboard.dto.ProductDto;
import com.bit.springboard.dto.PicDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDao {

    private final SqlSessionTemplate sqlSessionTemplate;

    @Autowired
    public ProductDao(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<ProductDto> getAllProducts() {
        return sqlSessionTemplate.selectList("ProductDao.getAllProducts");
    }

    public ProductDto saveProduct(ProductDto productDto) {
        sqlSessionTemplate.insert("ProductDao.saveProduct", productDto);
        return productDto;
    }

    public void savePic(PicDto picDto) {
        sqlSessionTemplate.insert("ProductDao.savePic", picDto);
    }

    public void incrementViewCount(int productId) {
        sqlSessionTemplate.update("ProductDao.incrementViewCount", productId);
    }
}