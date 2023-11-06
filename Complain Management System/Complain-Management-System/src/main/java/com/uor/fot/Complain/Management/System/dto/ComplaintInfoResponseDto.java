package com.uor.fot.Complain.Management.System.dto;

import lombok.Data;

import java.util.Date;

@Data
public class ComplaintInfoResponseDto {
    private String firstName;
    private String lastName;
    private String roleName;
    private String facultyName;
    private Date createdAt;
    private Date updatedAt;
    private String assetName;
    private String description;
    private Date submissionDate;
    private int quantity;
    private int status;
}
