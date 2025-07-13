package com.example.StudentManagement_1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.StudentManagement_1.SRepository.SRepository;
import com.example.StudentManagement_1.pathmodel.Student;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ViewController {
	
	@Autowired
     SRepository repo;

    @GetMapping("/login")
    public String showLoginPage() {
        return "/WEB-INF/views/login";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam String name,
                               @RequestParam String password,
                               Model model) {
        model.addAttribute("user", name);
        return "redirect:/WEB-INF/views/create";
    }

    @GetMapping("/create")
    public String showCreatePage(Model model) {
        model.addAttribute("student", new Student());
        model.addAttribute("user", model.getAttribute("user"));
        return "redirect:/WEB-INF/views/create";
    }
    
    @PostMapping("/create")
    public String createStudent(@ModelAttribute Student student, Model model) {
        if (repo.existsById(student.getId())) {
            model.addAttribute("error", "ID already exists!");
            return "/WEB-INF/views/create";
        }
        repo.saveAndFlush(student);
        return "/WEB-INF/views/list";
    }

    @GetMapping("/list")
    public String listStudents(HttpServletRequest model) {
        List<Student> all = repo.findAll();
        model.setAttribute("students", all);
        return "/WEB-INF/views/list";
    }

    @GetMapping("/edit")
    public String editStudent(@RequestParam Integer id, Model model) {
        repo.findById(id).ifPresent(s -> model.addAttribute("student", s));
        return "/WEB-INF/views/create"; // reuse form for editing
    }

    @GetMapping("/delete")
    public String deleteStudent(@RequestParam Integer id) {
        repo.deleteById(id);
        return "redirect:/WEB-INF/views/list";
    }

    @GetMapping("/WEB-INF/views/logout")
    public String logout() {
        return "redirect:/WEB-INF/views/login";
    }
}
