package com.uor.fot.Complain.Management.System.model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "room")
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "room_no", unique = true)
    private Integer roomNo;

    @Column(name = "floor_id")
    private Integer floor;

    @Column(name = "no_of_students")
    private int noOfStudents;
}


