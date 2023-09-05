package com.nagarro.UserDao;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.nagarro.entities.Products;

public class ProductDao {
private SessionFactory factory;

public ProductDao(SessionFactory factory) {
	super();
	this.factory = factory;
}
public boolean saveProduct(Products prod)
{
	boolean f=false;
	try {
		Session session=this.factory.openSession();
	Transaction tx=	session.beginTransaction();
//System.out.println(prod.toString());
	session.save(prod);
	tx.commit();
	session.close();
	f=true;
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
		f=false;
	}
	return f;
}
public List<Products> getProducts()
{
	Session s=this.factory.openSession();
	Query query=s.createQuery("from Products");
	List<Products>list=query.list();
	return list;
}

//delete a product in product table
public void deleteProduct(int id){
	Session s=this.factory.openSession();	
	Transaction tx=	s.beginTransaction();
    try {	
      Products prod = s.get(Products.class, id);
          s.delete(prod);
          System.out.println("product is deleted");
      tx.commit();
}catch (Exception e) {
    if (tx != null) {
       tx.rollback();
    }
    e.printStackTrace();
}
}
//update product
public void updateProduct(Products prod){
	Session s=this.factory.openSession();	
	Transaction tx=	s.beginTransaction();
    try {	
            s.update(prod);
          System.out.println("product is updated");
      tx.commit();
}catch (Exception e) {
    if (tx != null) {
       tx.rollback();
    }
    e.printStackTrace();
}
}
}

