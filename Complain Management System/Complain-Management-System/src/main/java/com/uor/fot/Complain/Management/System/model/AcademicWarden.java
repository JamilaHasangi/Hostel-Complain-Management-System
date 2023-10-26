package com.uor.fot.Complain.Management.System.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Data
@PrimaryKeyJoinColumn(name = "id")
@Table(name = "academic_warden")
public class AcademicWarden extends User {
}

