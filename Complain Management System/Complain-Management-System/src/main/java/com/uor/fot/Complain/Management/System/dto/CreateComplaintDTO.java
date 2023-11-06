package com.uor.fot.Complain.Management.System.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class CreateComplaintDTO {
    private String studentRegNo;
    private Long assetId;
    private String description;
    private Integer quantity;
    private MultipartFile image; // MultipartFile for handling image uploads
    private Integer urgency; // Low, Medium, High, etc.
}


