package com.example.StudentManagement_1.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.StudentManagement_1.SRepository.SRepository;
import com.example.StudentManagement_1.pathmodel.Student;

@Controller
public class ViewController {

    private final SRepository repo;

    public ViewController(SRepository repo) {
        this.repo = repo;
    }

    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam String name,
                               @RequestParam String password,
                               Model model) {
        model.addAttribute("user", name);
        return "redirect:/create";
    }

    @GetMapping("/create")
    public String showCreatePage(Model model) {
        model.addAttribute("student", new Student());
        model.addAttribute("user", model.getAttribute("user"));
        return "create";
    }
    
    @PostMapping("/create")
    public String createStudent(@ModelAttribute Student student, Model model) {
        if (repo.existsById(student.getId())) {
            model.addAttribute("error", "ID already exists!");
            return "create";
        }
        repo.save(student);
        return "redirect:/list";
    }


    @GetMapping("/list")
    public String listStudents(Model model) {
        List<Student> all = repo.findAll();
        model.addAttribute("students", all);
        return "list";
    }

    @GetMapping("/edit")
    public String editStudent(@RequestParam Integer id, Model model) {
        repo.findById(id).ifPresent(s -> model.addAttribute("student", s));
        return "create"; // reuse form for editing
    }

    @PostMapping("/delete")
    public String deleteStudent(@RequestParam Integer id) {
        repo.deleteById(id);
        return "redirect:/list";
    }

    @GetMapping("/logout")
    public String logout() {
        return "redirect:/login";
    }
}
