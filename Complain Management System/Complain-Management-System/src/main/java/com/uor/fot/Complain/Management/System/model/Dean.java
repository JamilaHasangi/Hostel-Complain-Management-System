package com.uor.fot.Complain.Management.System.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Data
@Entity
@PrimaryKeyJoinColumn(name = "user_id")
@Table(name = "dean")
public class Dean extends User {
}

