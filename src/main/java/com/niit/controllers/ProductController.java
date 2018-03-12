package com.niit.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.DAO.CategoryDAO;
import com.niit.DAO.ProductDAO;
import com.niit.DAO.SupplierDAO;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.Supplier;

@Controller
public class ProductController 
{
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	SupplierDAO supplierDAO;
	
	@RequestMapping("/Product")
	public String showProductPage(Model m)
	{
		Product product=new Product();
		m.addAttribute(product);
		m.addAttribute("catlist",this.listCategories());
		m.addAttribute("suplist",this.listSuppliers());
		return "Product";	
	}
	
	@RequestMapping(value="/InsertProduct",method=RequestMethod.POST)
	public String addProduct(@ModelAttribute("product")Product product,Model m,@RequestParam("pimage") MultipartFile filedet)
	{
		Product product1=new Product();
		m.addAttribute(product1);
		productDAO.addProduct(product);
		
		//===> Image Uploading	
		String imagePath="C:\\Users\\Suyash\\Desktop\\New folder (2)\\Frontend1\\src\\main\\webapp\\Resources\\images\\";
		imagePath=imagePath+String.valueOf(product.getProductId())+".jpg";
		File image=new File(imagePath);
		
		if(!filedet.isEmpty())
		{
			
			try 
			{
				byte[] fileBuffer=filedet.getBytes();	
				FileOutputStream fos=new FileOutputStream(image);
				BufferedOutputStream bs=new BufferedOutputStream(fos);
				bs.write(fileBuffer);
				bs.close();
			} catch (Exception e)
			{
				System.out.println("Exception Arised:"+e);
				e.printStackTrace();
			}
			
		}
		else
		{
			System.out.println("Problem Occured in File Uploading");
		}
		//==>End of Image Uploading
		
		
		m.addAttribute("catlist",this.listCategories());
		m.addAttribute("suplist",this.listSuppliers());
		return "Product";	
	}
	
	public LinkedHashMap<Integer,String> listCategories()
	{
		List<Category> listCategories=categoryDAO.getCategories();
		LinkedHashMap<Integer,String> catlist=new LinkedHashMap<Integer,String>();
		for(Category category:listCategories)
		{
			catlist.put(category.getCategoryId(),category.getCategoryName());
		}
		return catlist;
	}
	
	public LinkedHashMap<Integer,String> listSuppliers()
	{
		List<Supplier> listSuppliers=supplierDAO.getSuppliers();
		LinkedHashMap<Integer,String> suplist=new LinkedHashMap<Integer,String>();
		for(Supplier supplier:listSuppliers)
		{
			suplist.put(supplier.getSupplierId(),supplier.getSupplierName());
		}
		return suplist;
	}
	
	@RequestMapping(value="/ProductPage",method=RequestMethod.GET)
	public String showProductsPage(Model m)
	{
		List<Product> listProducts=productDAO.getProducts();
		m.addAttribute("listProducts",listProducts);
		return "ProductPage";
	}
	
	@RequestMapping(value="/ProductDesc{productId}",method=RequestMethod.GET)
	public String showProductDesc(@PathVariable("productId")int productId,Model m)
	{
		Product product=productDAO.getProduct(productId);
		String categoryName=categoryDAO.getCategory(product.getCategoryId()).getCategoryName();
		m.addAttribute("ProductInfo",product);
		m.addAttribute("categoryName",categoryName);
		return "ProductDesc";
	}
	
	@RequestMapping("/UpdateProduct{productId}")
	public String updateProduct(@PathVariable("productId") int productId,Model m)
	{
		Product product=productDAO.getProduct(productId);
		
		m.addAttribute(product);
		m.addAttribute("catlist",this.listCategories());
		m.addAttribute("suplist",this.listSuppliers());
		return "UpdateProduct";
	}

	@RequestMapping(value="/UpdateProduct",method=RequestMethod.POST)
	public String updateProduct(@ModelAttribute("product")Product product,Model m,@RequestParam("pimage") MultipartFile filedet)
	{
		Product product1=new Product();
		m.addAttribute(product1);
		productDAO.updateProduct(product);
		
		//===> Image Uploading	
		String imagePath="C:\\Users\\Suyash\\Desktop\\New folder (2)\\Frontend1\\src\\main\\webapp\\Resources\\images\\";
		imagePath=imagePath+String.valueOf(product.getProductId())+".jpg";
		File image=new File(imagePath);
		
		if(!filedet.isEmpty())
		{
			
			try 
			{
				byte[] fileBuffer=filedet.getBytes();	
				FileOutputStream fos=new FileOutputStream(image);
				BufferedOutputStream bs=new BufferedOutputStream(fos);
				bs.write(fileBuffer);
				bs.close();
			} catch (Exception e)
			{
				System.out.println("Exception Arised:"+e);
				e.printStackTrace();
			}
			
		}
		else
		{
			System.out.println("Problem Occured in File Uploading");
		}
		//==>End of Image Uploading
		
		List<Product> listProducts=productDAO.getProducts();
		m.addAttribute("listProducts",listProducts);
		m.addAttribute("catlist",this.listCategories());
		m.addAttribute("suplist",this.listSuppliers());
		return "ProductPage";	
	}
	
	@RequestMapping("/DeleteProduct{productId}")
	public String deleteProduct(@PathVariable("productId") int productId,Model m)
	{
		Product product=productDAO.getProduct(productId);
		
		productDAO.deleteProduct(product);
		
		List<Product> listProducts=productDAO.getProducts();
		m.addAttribute("listProducts",listProducts);
		m.addAttribute("catlist",this.listCategories());
		m.addAttribute("suplist",this.listSuppliers());
	
		return "ProductPage";
	}
}
