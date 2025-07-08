
package com.example.StudentManagement_1.SRepository;

import com.example.StudentManagement_1.pathmodel.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SRepository extends JpaRepository<Student, Integer> {
}
