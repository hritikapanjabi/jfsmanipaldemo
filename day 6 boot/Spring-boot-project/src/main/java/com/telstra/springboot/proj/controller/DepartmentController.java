package com.telstra.springboot.proj.controller;

import com.telstra.springboot.proj.entity.Department;
import com.telstra.springboot.proj.error.DepartmentNotFoundException;
import com.telstra.springboot.proj.service.DepartmentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;


@RestController
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    private final Logger LOGGER= (Logger)LoggerFactory.getLogger(DepartmentController.class);

    @PostMapping("/departments")
    public Department saveDepartment(@Valid @RequestBody Department department){
     LOGGER.info("Inside save meth");
     return departmentService.saveDepartment(department);
    }

    @GetMapping("/departments")
    public List<Department> fetchDepartmentList(){
      LOGGER.info("Inside get all" );
        return departmentService.fetchDepartmentList();
    }

    @GetMapping("/departments/{id}")
    public Department fetchDepartmentById(@PathVariable("id") Long departmentId) throws DepartmentNotFoundException {
        LOGGER.info("Inside get by id" );
        return departmentService.fetchDepartmentById(departmentId);
    }

    @DeleteMapping("/departments/{id}")
    public String deleteDepartmentById(@PathVariable("id") Long departmentId){
        LOGGER.info("Inside delete by id" );
    departmentService.deleteDepartmentById(departmentId);
    return "Department deleted";
    }

    @PutMapping("/departments/{id}")
     public Department updateDepartment(@PathVariable("id") Long departmentId
                                      ,@RequestBody Department department){
        LOGGER.info("Inside update by id" );
     return departmentService.updateDepartment(departmentId, department);
     }

     @GetMapping("/department/{name}")
     public Department fetchDepartmentByName(@PathVariable("name") String departmentName){
       return departmentService.fetchDepartmentByName(departmentName);
     }


}
