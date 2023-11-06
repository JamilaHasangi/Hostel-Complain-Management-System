package com.uor.fot.Complain.Management.System.controller;

import com.uor.fot.Complain.Management.System.dto.ComplaintInfoResponseDto;
import com.uor.fot.Complain.Management.System.dto.CreateComplaintDTO;
import com.uor.fot.Complain.Management.System.dto.PriorityType;
import com.uor.fot.Complain.Management.System.enums.ComplaintStatus;
import com.uor.fot.Complain.Management.System.model.Asset;
import com.uor.fot.Complain.Management.System.model.Complaint;
import com.uor.fot.Complain.Management.System.model.Student;
import com.uor.fot.Complain.Management.System.service.AssetService;
import com.uor.fot.Complain.Management.System.service.ComplaintService;
import com.uor.fot.Complain.Management.System.service.ImageService;
import com.uor.fot.Complain.Management.System.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/complain")
public class ComplaintController {
    private final ComplaintService complaintService;
    private final AssetService assetService;
    private final StudentService studentService;
    private final ImageService imageService;

    @Autowired
    public ComplaintController(ComplaintService complaintService, AssetService assetService, StudentService studentService, ImageService imageService) {
        this.complaintService = complaintService;
        this.assetService = assetService;
        this.studentService = studentService;
        this.imageService = imageService;
    }

    @PostMapping("/submit")
    public String submitComplaint(@RequestPart("complaintDTO") CreateComplaintDTO complaintDTO, @RequestPart("image") MultipartFile image, RedirectAttributes redirectAttributes) {
        try {
            // Save the image
            String imageUrl = imageService.saveImage(image);

            // Create a new complaint
            Complaint complaint = new Complaint();

            // Get Asset
            Asset asset = assetService.getAssetById(complaintDTO.getAssetId());
            if (asset == null) {
                throw new RuntimeException("Asset not found.");
            }
            complaint.setAsset(asset);

            // Get Student by registration no
            Student student = studentService.getStudentByRegNo(complaintDTO.getStudentRegNo());
            if (student == null) {
                throw new RuntimeException("Student not found.");
            }
            complaint.setStudent(student);

            complaint.setDescription(complaintDTO.getDescription());
            complaint.setQuantity(complaintDTO.getQuantity());
            complaint.setImageURL(imageUrl);
            complaint.setUrgency(PriorityType.getById(complaintDTO.getUrgency()).getId());
            complaint.setStatus(ComplaintStatus.ESCALATED_TO_SUB_WARDEN.getId());

            complaintService.submitComplaint(complaint);

            redirectAttributes.addFlashAttribute("successMessage", "Complaint submitted successfully.");
            return "redirect:/view-complaints";
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to submit the complaint.");
            return "redirect:/view-complaints";
        }
    }

    @GetMapping("/view/info")
    public String getComplainsInfo(Model model) {
        List<ComplaintInfoResponseDto> complaints = complaintService.getComplaintInfo();
        model.addAttribute("complaints", complaints);
        return "complaint/view_complaint";
    }

    @PostMapping("update")
    public String updateComplain(CreateComplaintDTO complaintDTO) {
        return null;
    }
}
