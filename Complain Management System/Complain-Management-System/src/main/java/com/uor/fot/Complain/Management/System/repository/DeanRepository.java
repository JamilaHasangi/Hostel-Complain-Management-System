package com.uor.fot.Complain.Management.System.repository;

import com.uor.fot.Complain.Management.System.model.Dean;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DeanRepository extends JpaRepository<Dean, Long> {
}
