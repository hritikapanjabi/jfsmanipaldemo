package controller;
import java.awt.*;
import model.Customer;

import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestMethod;

import dao.CustomerDao;
	 
	@Controller
	public class MainController {
	 
	    @Autowired
	    private CustomerDao customerDAO;
	 
	    @RequestMapping(value = { "/" }, method = RequestMethod.GET)
	    public String welcomePage(Model model) {
	    	//customerDAO.insertDepartment("HR", "Chicago");
	        //departmentDAO.insertDepartment("INV", "Hanoi");
//	    	List <Customer> l1=new List<>();
//	        List<Customer> list = customerDAO.listCustomer();
//	        model.addAttribute("customers", list);
	        return "index";
	    }
	     
	}

