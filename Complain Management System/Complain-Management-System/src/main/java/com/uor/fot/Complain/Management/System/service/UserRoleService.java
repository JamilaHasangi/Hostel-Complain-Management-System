package com.uor.fot.Complain.Management.System.service;

import com.uor.fot.Complain.Management.System.model.UserRole;
import com.uor.fot.Complain.Management.System.repository.UserRoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserRoleService {

    private final UserRoleRepository userRoleRepository;

    @Autowired
    public UserRoleService(UserRoleRepository userRoleRepository) {
        this.userRoleRepository = userRoleRepository;
    }

    public UserRole getUserRoleById(Long id) {
        return userRoleRepository.findById(id).orElse(null);
    }
}
