package com.bit.springboard.common;

import com.bit.springboard.dto.GreentalkFileDto;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Component
public class FileUtils {
    public static GreentalkFileDto parserFileInfo(MultipartFile multipartFile, String attachPath) {
        GreentalkFileDto greentalkFileDto = new GreentalkFileDto();

        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        Date nowDate = new Date();

        String nowDateStr = format.format(nowDate);

        UUID uuid = UUID.randomUUID();

        String fileName = uuid.toString() + "_" + nowDateStr + "_" + multipartFile.getOriginalFilename();

        File uploadFile = new File(attachPath + fileName);
        String type = "";

        try {
            multipartFile.transferTo(uploadFile);
            type = Files.probeContentType(uploadFile.toPath());
        } catch(IOException ie) {
            System.out.println(ie.getMessage());
        }

        if(!type.equals("")) {
            if(type.startsWith("image")) {
                greentalkFileDto.setFiletype("image");
            } else {
                greentalkFileDto.setFiletype("etc");
            }
        } else {
            greentalkFileDto.setFiletype("etc");
        }

        greentalkFileDto.setFilename(fileName);
        greentalkFileDto.setFileoriginname(multipartFile.getOriginalFilename());
        greentalkFileDto.setFilepath(attachPath);

        return greentalkFileDto;
    }

    public String saveFile(MultipartFile file, String attachPath) throws IOException {
        if (file.isEmpty()) {
            throw new IOException("Failed to store empty file.");
        }

        String originalFilename = file.getOriginalFilename();
        String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
        String savedFilename = UUID.randomUUID().toString() + extension;

        File directory = new File(attachPath);
        if (!directory.exists()) {
            directory.mkdirs(); // 디렉토리가 없으면 생성
        }

        File uploadFile = new File(attachPath + savedFilename);

        try {
            file.transferTo(uploadFile);
        } catch(IOException ie) {
            System.out.println(ie.getMessage());
        }

        return savedFilename;
    }
}