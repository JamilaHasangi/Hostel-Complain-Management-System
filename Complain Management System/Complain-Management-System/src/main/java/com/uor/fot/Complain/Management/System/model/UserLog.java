package com.uor.fot.Complain.Management.System.model;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Table(name = "user_log")
public class UserLog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "description")
    private String description;

    @Column(name = "role_name")
    private String roleName;

    @Column(name = "action")
    private String action;

    @Column(name = "created_at")
    private Date createdAt;
}