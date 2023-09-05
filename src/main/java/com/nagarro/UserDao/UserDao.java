package com.nagarro.UserDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.nagarro.entities.Products;
import com.nagarro.entities.User;

public class UserDao {
private SessionFactory factory;

public UserDao(SessionFactory factory) {

this.factory = factory;
}
//public User storeProduct(String Title, int Quantity, int Size, String Image){
//	return User;
//}

public User getUserByEmailAndPassword(String email,String password)
{
User user=null;
try {
String query="from User where userEmail=:userEmail and userPassword=:userPassword";
Session session= this.factory.openSession();
Query q= session.createQuery(query);
q.setParameter("userEmail",email);



q.setParameter("userPassword",password);



user = (User) q.uniqueResult();
session.close();

} catch (Exception e) {
// TODO: handle exception
}
return user;
}

public Products storeProduct(String title, int quantity, String size, String image) {
Products prod = null;
	try {
		String query="insert into products (Image, Quantity,Size,Title)";
		Session session= this.factory.openSession();
		Query q= session.createQuery(query);
		q.setParameter("Title", title);



		q.setParameter("Quantity", quantity);
		q.setParameter("Size", size);
		q.setParameter("Image", image);



		session.close();
		session.close();

		} catch (Exception e) {
		// TODO: handle exception
		}
	return prod;
}



}
