package com.uor.fot.Complain.Management.System.repository;

import com.uor.fot.Complain.Management.System.model.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRoleRepository extends JpaRepository<UserRole, Long> {
}
