package  com.nagarro.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nagarro.UserDao.ProductDao;
import com.nagarro.controller.Factory;
import com.nagarro.entities.Products;



public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try {
			String op=request.getParameter("operation");
			if(op.trim().equals("addproduct"))
			{
			String Title=request.getParameter("Title");
			int Quantity=Integer.parseInt(request.getParameter("Quantity"));
			String Size=request.getParameter("Size");
			String Image=request.getParameter("Image");
	     	Products p=	new Products();
	    	p.setTitle(Title);
	    	p.setQuantity(Quantity);
	    	p.setSize(Size);
	    	p.setImage(Image);
		
		ProductDao pdao=new ProductDao(Factory.getFactory());
		pdao.saveProduct(p);
		out.println("success");
		List<Products>list=pdao.getProducts();
		HttpSession httpSession= request.getSession();
        httpSession.setAttribute("list",list);
		response.sendRedirect("admin.jsp");
		for(Products prod:list)
		{
			out.println(prod.getTitle()+prod.getQuantity()+prod.getSize()+prod.getImage());
		}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		doGet(request, response);
	}

}
