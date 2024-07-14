package com.incapp.model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.HashMap;

public class DAO {
	private Connection c;
	
	public DAO() throws SQLException,ClassNotFoundException  {
		Class.forName("com.mysql.cj.jdbc.Driver");
		c=DriverManager.getConnection("jdbc:mysql://localhost:3306/krypturg", "root", "incapp");
	}
	
	public void closeConnection()throws SQLException {
		c.close();
	}
	public String userLogin(String email, String password) throws SQLException{
		PreparedStatement p=c.prepareStatement("select * from users where email = ? and password = ?");
		p.setString(1, email);
		p.setString(2, password);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			return rs.getString("name");
		}else {
			return null;
		}
	}
	public String adminLogin(String id, String password) throws SQLException{
		PreparedStatement p=c.prepareStatement("select * from admin_login where id = ? and password = ?");
		p.setString(1, id);
		p.setString(2, password);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			return rs.getString("name");
		}else {
			return null;
		}
	}
	public void addEnquiry(String name, String phone) throws SQLException{
		PreparedStatement p=c.prepareStatement("insert into enquiries (name,phone,e_date,status) values (?,?,CURRENT_DATE,'Pending')");
		p.setString(1, name);
		p.setString(2, phone);
		p.executeUpdate();
	}
	public ArrayList<HashMap<String, Object>> getAllEnquires() throws SQLException{
		PreparedStatement p=c.prepareStatement("select * from enquiries order by id DESC");
		ResultSet rs=p.executeQuery();
		ArrayList<HashMap<String, Object>> enquiries=new ArrayList<HashMap<String, Object>>();
		while(rs.next()) {
			HashMap<String, Object> enquiry=new HashMap<String, Object>();
			enquiry.put("id",rs.getInt("id"));
			enquiry.put("name",rs.getString("name"));
			enquiry.put("phone",rs.getString("phone"));
			enquiry.put("e_date",rs.getString("e_date"));
			enquiry.put("status",rs.getString("status"));
			enquiries.add(enquiry);
		}
		return enquiries;
	}
	public void changeEnquiryStatus(int id) throws SQLException{
		PreparedStatement p=c.prepareStatement("update enquiries set status='Done' where id=?");
		p.setInt(1, id);
		p.executeUpdate();
	}
	public String addCategory(String name) throws SQLException{
		PreparedStatement p=c.prepareStatement("insert into category values (?)");
		p.setString(1, name);
		try {
			p.executeUpdate();
			return "Success";
		}catch (SQLIntegrityConstraintViolationException e) {
			return "Failed (Already Exist!)";
		}
	}
	public ArrayList<String> getAllCategory() throws SQLException{
		PreparedStatement p=c.prepareStatement("select * from category");
		ResultSet rs=p.executeQuery();
		ArrayList<String> categories=new ArrayList<String>();
		while(rs.next()) {
			categories.add(rs.getString("name"));
		}
		return categories;
	}
	public void deleteCategory(String name) throws SQLException{
		PreparedStatement p=c.prepareStatement("delete from category where name=?");
		p.setString(1, name);
		p.executeUpdate();
	}
	public void deleteProduct(String name) throws SQLException{
		PreparedStatement p=c.prepareStatement("delete from products where name=?");
		p.setString(1, name);
		p.executeUpdate();
	}
	public String addProduct(HashMap<String,Object> product) throws SQLException{
		PreparedStatement p=c.prepareStatement("insert into products (name,price,cname,category,info,qty,image) values (?,?,?,?,?,?,?)");
		p.setString(1, (String)product.get("name"));
		p.setInt(2, (int)product.get("price"));
		p.setString(3, (String)product.get("cname"));
		p.setString(4, (String)product.get("category"));
		p.setString(5, (String)product.get("info"));
		p.setInt(6, (int)product.get("qty"));
		p.setBinaryStream(7, (InputStream)product.get("image"));
		try {
			p.executeUpdate();
			return "Success";
		}catch (SQLIntegrityConstraintViolationException e) {
			return "Failed (Already Exist!)";
		}
	}
	public ArrayList<HashMap<String, Object>> getAllProducts() throws SQLException{
		PreparedStatement p=c.prepareStatement("select * from products order by category DESC");
		ResultSet rs=p.executeQuery();
		ArrayList<HashMap<String, Object>> products=new ArrayList<HashMap<String, Object>>();
		while(rs.next()) {
			HashMap<String, Object> product=new HashMap<String, Object>();
			product.put("price",rs.getInt("price"));
			product.put("qty",rs.getInt("qty"));
			product.put("name",rs.getString("name"));
			product.put("category",rs.getString("category"));
			product.put("cname",rs.getString("cname"));
			product.put("info",rs.getString("info"));
			products.add(product);
		}
		return products;
	}
	public byte[] getProductImage(String name) throws SQLException {
		PreparedStatement p=c.prepareStatement("select image from products where name=?");
		p.setString(1, name.trim());
		ResultSet rs=p.executeQuery();
		if(rs.next()) 
			return rs.getBytes("image");
		else
			return null;
	}
	public String addUser(String name,String phone,String email,String password) throws SQLException{
		PreparedStatement p=c.prepareStatement("insert into users (email,name,phone,password) values (?,?,?,?)");
		p.setString(1, email);
		p.setString(2, name);
		p.setString(3, phone);
		p.setString(4, password);
		try {
			p.executeUpdate();
			return "Success";
		}catch (SQLIntegrityConstraintViolationException e) {
			return "Failed (Already Exist!)";
		}
	}
	public ArrayList<HashMap<String, Object>> getProductsLikeName(String name) throws SQLException{
		PreparedStatement p=c.prepareStatement("select * from products where name like ? and qty>0 order by category DESC");
		p.setString(1, "%"+name+"%");
		ResultSet rs=p.executeQuery();
		ArrayList<HashMap<String, Object>> products=new ArrayList<HashMap<String, Object>>();
		while(rs.next()) {
			HashMap<String, Object> product=new HashMap<String, Object>();
			product.put("price",rs.getInt("price"));
			product.put("qty",rs.getInt("qty"));
			product.put("name",rs.getString("name"));
			product.put("category",rs.getString("category"));
			product.put("cname",rs.getString("cname"));
			product.put("info",rs.getString("info"));
			products.add(product);
		}
		return products;
	}
	public void addToCart(String email,String name) throws SQLException{
		PreparedStatement p=c.prepareStatement("select * from cart where email=?");
		p.setString(1, email);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			String i=rs.getString("items");
			p=c.prepareStatement("update cart set items=? where email=?");
			p.setString(1, i+","+name);
			p.setString(2, email);
			p.executeUpdate();
		}else {
			p=c.prepareStatement("insert into cart (email,items) values (?,?)");
			p.setString(1, email);
			p.setString(2, name);
			p.executeUpdate();
		}
	}
	public int countCart(String email) throws SQLException{
		PreparedStatement p=c.prepareStatement("select * from cart where email=?");
		p.setString(1, email);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			String items=rs.getString("items");
			String i[]=items.split(",");
			return i.length;
		}else {
			return 0;
		}
	}
	public String[] getAllCartItemsByEmail(String email) throws SQLException{
		PreparedStatement p=c.prepareStatement("select * from cart where email=?");
		p.setString(1, email);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			String all_items=rs.getString("items");
			String i[]=all_items.split(",");
			return i;
		}else {
			return null;
		}
	}
	public int getItemPrice(String name) throws SQLException{
		PreparedStatement p=c.prepareStatement("select price from products where name=?");
		p.setString(1, name);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			return rs.getInt("price");
		}else {
			return 0;
		}
	}
	public void removeFromCart(String email,String name) throws SQLException{
		PreparedStatement p=c.prepareStatement("select * from cart where email=?");
		p.setString(1, email);
		ResultSet rs=p.executeQuery();
		if(rs.next()) {
			String items=rs.getString("items");
			String i[]=items.split(",");
			ArrayList<String> newItems=new ArrayList<>();
			for (int x=0;x<i.length;x++) {
				newItems.add(i[x]);
			}
			newItems.remove(name);
			items="";
			for (String string : newItems) {
				items+=","+string;
			}
			items=items.substring(1, items.length());
			p=c.prepareStatement("update cart set items=? where email=?");
			p.setString(1, items);
			p.setString(2, email);
			p.executeUpdate();
		}
	}
	public ArrayList<String> getProductByCategory(String category) throws SQLException{
		PreparedStatement p=c.prepareStatement("select * from products where category=? and qty>0");
		p.setString(1, category);
		ResultSet rs=p.executeQuery();
		ArrayList<String> categories=new ArrayList<String>();
		while(rs.next()) {
			categories.add(rs.getString("name"));
		}
		return categories;
	}
	public ArrayList<String> getAddressByEmail(String email) throws SQLException {
		PreparedStatement p=c.prepareStatement("select address from addresses where email=?");
		p.setString(1, email);
		ResultSet rs=p.executeQuery();
		ArrayList<String> addresses=new ArrayList<>();
		while(rs.next()) {
			addresses.add(rs.getString("address"));
		}
		return addresses;
	}
	public void addAddress(String email,String address) throws SQLException{
		PreparedStatement p=c.prepareStatement("insert into addresses (email,address) values (?,?)");
		p.setString(1, email);
		p.setString(2, address);
		p.executeUpdate();
	}
	public void orderPlaced(String email,String address) throws SQLException{
		String[] items=getAllCartItemsByEmail(email);
		String orderItems="";
		int total=0;
		for(String item:items){
			int price=getItemPrice(item);
			total+=price;
			orderItems += ","+item+"-"+price;
		}
		orderItems=orderItems.substring(1,orderItems.length());
		PreparedStatement p=c.prepareStatement("insert into orders (email,address,total,items,order_date,status) values (?,?,?,?,CURRENT_DATE,'Pending')");
		p.setString(1, email);
		p.setString(2, address);
		p.setInt(3, total);
		p.setString(4, orderItems);
		p.executeUpdate();
		p=c.prepareStatement("delete from cart where email=?");
		p.setString(1, email);
		p.executeUpdate();
		
		p=c.prepareStatement("update products set qty=qty-1 where name=?");
		for(String item:items){
			p.setString(1, item);
			p.executeUpdate();
		}
	}
	public ArrayList<HashMap> getOrdersByEmail(String email) throws SQLException{
		PreparedStatement p=c.prepareStatement("select * from orders where email=? order by order_date DESC");
		p.setString(1, email);
		ResultSet rs=p.executeQuery();
		ArrayList<HashMap> orders=new ArrayList<>();
		while(rs.next()) {
			HashMap order=new HashMap();
			order.put("id", rs.getInt("id"));
			order.put("address", rs.getString("address"));
			order.put("items", rs.getString("items"));
			order.put("total", rs.getInt("total"));
			order.put("status", rs.getString("status"));
			order.put("order_date", rs.getString("order_date"));
			orders.add(order);
		}
		return orders;
	}
	public ArrayList<HashMap> getOrders() throws SQLException{
		PreparedStatement p=c.prepareStatement("select * from orders order by order_date DESC");
		ResultSet rs=p.executeQuery();
		ArrayList<HashMap> orders=new ArrayList<>();
		while(rs.next()) {
			HashMap order=new HashMap();
			order.put("id", rs.getInt("id"));
			order.put("email", rs.getString("email"));
			order.put("address", rs.getString("address"));
			order.put("items", rs.getString("items"));
			order.put("total", rs.getInt("total"));
			order.put("status", rs.getString("status"));
			order.put("order_date", rs.getString("order_date"));
			orders.add(order);
		}
		return orders;
	}
	public void changeOrderStatus(int id,String status) throws SQLException{
		PreparedStatement p=c.prepareStatement("update  orders set status=? where id=?");
		p.setString(1, status);
		p.setInt(2, id);
		p.executeUpdate();
		
		if(status.equalsIgnoreCase("Canceled") || status.equalsIgnoreCase("Rejected")) {
			p=c.prepareStatement("select items from orders where id=?");
			p.setInt(1, id);
			ResultSet rs=p.executeQuery();
			if(rs.next()) {
				String items=rs.getString("items");
				String i[]=items.split(",");
				for(String s:i) {
					String a[]=s.split("-");
					p=c.prepareStatement("update products set qty=qty+1 where name=?");
					p.setString(1, a[0]);
					p.executeUpdate();
				}
			}
		}
	}
}
