package com.example.demo.board.domain;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {
    private MultipartFile fileupload;
 
    public MultipartFile getFileupload() {
        return fileupload;
    }
 
    public void setFileupload(MultipartFile fileupload) {
        this.fileupload = fileupload;
    }
}
