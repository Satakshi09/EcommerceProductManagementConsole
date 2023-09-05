package com.nagarro.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="prod_name")
public class Products {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int prodID;
	private String Title;
	private int Quantity;
	private String Size;
	private String Image;

	public Products() {
		super();
// TODO Auto-generated constructor stub
	}

	public Products(int prodID, String Title, int Quantity, String Size, String Image) {
		super();
		this.prodID = prodID;
		this.Title = Title;
		this.Quantity = Quantity;
		this.Size = Size;
		this.Image = Image;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String Title) {
		this.Title = Title;
	}

	public int getQuantity() {
		return Quantity;
	}

	public void setQuantity(int Quantity) {
		this.Quantity = Quantity;
	}

	public String getSize() {
		return Size;
	}

	public void setSize(String Size) {
		this.Size = Size;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String Image) {
		this.Image = Image;
	}

	public int getprodID() {
		return prodID;
	}

	public void setprodID(int prodID) {
		this.prodID = prodID;
	}

	@Override
	public String toString() {
		return "Products [prodID=" + prodID + ", Title=" + Title + ", Quantity=" + Quantity + ", Size=" + Size
				+ ", Image=" + Image + "]";
	}
}