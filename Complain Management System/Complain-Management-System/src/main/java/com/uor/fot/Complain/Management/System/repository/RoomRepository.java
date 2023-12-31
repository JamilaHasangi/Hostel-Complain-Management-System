package com.uor.fot.Complain.Management.System.repository;

import com.uor.fot.Complain.Management.System.model.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomRepository extends JpaRepository<Room, Long> {
    @Query("SELECT r FROM Room r WHERE r.roomNo = :roomNo")
    Room getByRoomNo(@Param("roomNo") Integer roomNo);
}

