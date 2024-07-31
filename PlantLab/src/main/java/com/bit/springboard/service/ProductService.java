package com.bit.springboard.service;

import com.bit.springboard.dto.ProductDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Insert;

import java.util.List;

@Mapper
public interface ProductService {
    @Insert("INSERT INTO store_product (pic_id, brand, product_name, price, discount, rate, color, is_light, base_type, size, tag, view_count, sell_start, sell_end, product_status, created_at, updated_at, file_name, is_main) VALUES (#{pic_id}, #{brand}, #{product_name}, #{price}, #{discount}, #{rate}, #{color}, #{is_light}, #{base_type}, #{size}, #{tag}, #{view_count}, #{sell_start}, #{sell_end}, #{product_status}, #{created_at}, #{updated_at}, #{file_name}, #{is_main})")
    void saveProduct(ProductDto productDto);

    @Select("SELECT * FROM store_product")
    List<ProductDto> getAllProducts();
}