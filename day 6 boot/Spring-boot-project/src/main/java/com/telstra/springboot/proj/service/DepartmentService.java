package com.telstra.springboot.proj.service;

import com.telstra.springboot.proj.entity.Department;
import com.telstra.springboot.proj.error.DepartmentNotFoundException;

import java.util.List;


public interface DepartmentService {
   public Department saveDepartment(Department department);

   public List<Department> fetchDepartmentList();

  public  Department fetchDepartmentById(Long departmentId) throws DepartmentNotFoundException;

  public void deleteDepartmentById(Long departmentId);

   public Department updateDepartment(Long departmentId, Department department);

   public Department fetchDepartmentByName(String departmentName);
}
