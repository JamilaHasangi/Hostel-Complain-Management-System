package com.uor.fot.Complain.Management.System.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Data
@Table(name = "academic_warden")
public class AcademicWarden extends User {
}

