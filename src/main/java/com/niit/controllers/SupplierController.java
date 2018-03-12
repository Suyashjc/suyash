package com.niit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.DAO.SupplierDAO;
import com.niit.model.Category;
import com.niit.model.Supplier;

@Controller
public class SupplierController 
{

@Autowired
SupplierDAO supplierDAO;

@RequestMapping(value="/Supplier")
public String showSupplier(Model m)
{
	List<Supplier> listSuppliers = supplierDAO.getSuppliers();
	m.addAttribute("listSuppliers", listSuppliers);

	for (Supplier supplier : listSuppliers) 
	{
		System.out.println(supplier.getSupplierName() + ",");
		

	}
	
	return "Supplier";
	
}

@RequestMapping(value="/InsertSupplier", method= RequestMethod.POST)
public String addSupplier(@RequestParam("supname") String supname, Model m)

{
	Supplier supplier = new Supplier();
	supplier.setSupplierName(supname);
	supplierDAO.addSupplier(supplier);
	List<Supplier> listSuppliers = supplierDAO.getSuppliers();
	m.addAttribute("listSuppliers", listSuppliers);

	return "Supplier";
}

@RequestMapping(value="/deleteSupplier{supplierId}")
public String delete(@PathVariable("supplierId") int supplierId, Model m)
{
	Supplier supplier= supplierDAO.getSupplier(supplierId);
	supplierDAO.deleteSupplier(supplier);
	List<Supplier> listSuppliers = supplierDAO.getSuppliers();
	m.addAttribute("listSuppliers", listSuppliers);
	return "Supplier";
	}
}
