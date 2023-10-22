package com.uor.fot.Complain.Management.System.service;

import com.uor.fot.Complain.Management.System.dto.UserRegistrationDTO;
import com.uor.fot.Complain.Management.System.model.SeniorStudentCounselor;
import com.uor.fot.Complain.Management.System.repository.SeniorStudentCounselorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SeniorStudentCounselorService {

    private final SeniorStudentCounselorRepository seniorStudentCounselorRepository;

    @Autowired
    public SeniorStudentCounselorService(SeniorStudentCounselorRepository seniorStudentCounselorRepository) {
        this.seniorStudentCounselorRepository = seniorStudentCounselorRepository;
    }

    // Create or update a SeniorStudentCounselor
    public SeniorStudentCounselor saveSeniorStudentCounselor(UserRegistrationDTO registrationDTO) {
        return null;
    }

    // Retrieve a SeniorStudentCounselor by ID
    public Optional<SeniorStudentCounselor> getById(Long id) {
        return seniorStudentCounselorRepository.findById(id);
    }

    // Retrieve all SeniorStudentCounselors
    public List<SeniorStudentCounselor> getAll() {
        return seniorStudentCounselorRepository.findAll();
    }

    // Delete a SeniorStudentCounselor by ID
    public void deleteById(Long id) {
        seniorStudentCounselorRepository.deleteById(id);
    }
}
