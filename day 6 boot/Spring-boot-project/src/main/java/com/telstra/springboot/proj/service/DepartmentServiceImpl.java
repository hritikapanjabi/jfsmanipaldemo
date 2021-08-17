package com.telstra.springboot.proj.service;

import com.telstra.springboot.proj.entity.Department;
import com.telstra.springboot.proj.error.DepartmentNotFoundException;
import com.telstra.springboot.proj.repository.DepartmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class DepartmentServiceImpl implements DepartmentService{
   @Autowired
   private DepartmentRepository departmentRepository;

   @Override
    public Department saveDepartment(Department department) {
        return departmentRepository.save(department);
    }

    @Override
    public List<Department> fetchDepartmentList() {
        return departmentRepository.findAll();
    }

    @Override
    public Department fetchDepartmentById(Long departmentId) throws DepartmentNotFoundException {
       Optional<Department> department= departmentRepository.findById(departmentId);
       if(!department.isPresent()){
           throw new DepartmentNotFoundException("Dept not available");
       }
       return department.get();
    }

    @Override
    public void deleteDepartmentById(Long departmentId) {
        departmentRepository.deleteById(departmentId);
    }

    @Override
    public Department updateDepartment(Long departmentId, Department department) {
        //get the debt from db then update
      Department depBb= departmentRepository.findById(departmentId).get();
     if(Objects.nonNull(department.getDepartmentName()) &&
     !"".equalsIgnoreCase(department.getDepartmentName())){
         depBb.setDepartmentName(department.getDepartmentName());

     }

        if(Objects.nonNull(department.getDepartmentCode()) &&
                !"".equalsIgnoreCase(department.getDepartmentCode())){
            depBb.setDepartmentCode(department.getDepartmentCode());

        }

        if(Objects.nonNull(department.getDepartmentAddress()) &&
                !"".equalsIgnoreCase(department.getDepartmentAddress())){
            depBb.setDepartmentAddress(department.getDepartmentAddress());

        }

        return departmentRepository.save(depBb);

    }

    @Override
    public Department fetchDepartmentByName(String departmentName) {
        return departmentRepository.findByDepartmentNameIgnoreCase(departmentName);
    }
}
