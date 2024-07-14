<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.incapp.model.DAO"%>
<%
String adminName = (String) session.getAttribute("adminName");
if (adminName == null) {
	session.setAttribute("msg", "Please Login First!");
	response.sendRedirect("index.jsp");
} else {
%>

<!DOCTYPE html>
<html>

<head>
<title>Krypturg</title>
<link rel="icon" href="resources/Krypturg-logo.png" />

<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />

<!-- font-awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/js/all.min.js"
	integrity="sha512-rpLlll167T5LJHwp0waJCh3ZRf7pO6IT1+LZOhAyP6phAirwchClbTZV3iqL3BMrVxIYRbzGTpli4rfxsCK6Vw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- AOS CSS & Script -->
<script src="resources/aos/aos.js"></script>
<link rel="stylesheet" href="resources/aos/aos.css" />

<!-- custom css -->
<link rel="stylesheet" href="resources/custom.css">

<meta name="author" content="Rahul Chauhan" />
<meta name="description" content="This is a website for Computers." />
<meta name="keywords" content="" />
</head>

<body>

	<%
	String msg = (String) session.getAttribute("msg");
	if (msg != null) {
	%>
	<p class="bg-warning p-2 text-center">
		<%=msg%>
	</p>
	<%
	session.setAttribute("msg", null);
	}
	%>


	<nav class="navbar navbar-expand-sm container my-3">
		<a href="AdminHome.jsp" class="navbar-brand"> <img
			src="resources/icon.png" height="35px" alt=""> <span>Kryp</span>turg
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#my-navbar">
			<i class="fa-solid fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="my-navbar">
			<ul class="navbar-nav mx-auto p-2">
				<li><a href="AdminHome.jsp">Orders</a></li>
				<li><a href="Enquiries.jsp">Enquiries</a></li>
				<li><a href="Products.jsp">Products</a></li>
				<li><a href="ViewProducts.jsp">View Products</a></li>
			</ul>
			<label id="call" href=""> Welcome: <b><%=adminName%></b> <a
				class="btn btn-sm btn-danger" href="Logout">Logout</a>
			</label>
		</div>
	</nav>

	<section class="container bg-light p-3">
		<h3>Category</h3>
		<hr>
		<div class="row">
			<div class="col-sm bg-success text-white p-4">
				<h5>ADD Category</h5>
				<form action="AddCategory" method="post">
					<div class="row">
						<div class="col-sm mt-2">
							<input class="form-control" type="text" name="name"
								maxlength="20" placeholder="Category Name" required />
						</div>
						<div class="col-sm mt-2">
							<button class="btn btn-light">Add</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-sm bg-danger text-white p-4">
				<h5>Delete Category</h5>
				<form action="DeleteCategory" method="post">
					<div class="row">
						<div class="col-sm mt-2">
							<select name="name" class="form-control">
								<%
								DAO db = new DAO();
								ArrayList<String> categories = (ArrayList<String>) db.getAllCategory();
								db.closeConnection();
								for (String category : categories) {
								%>
								<option><%=category%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="col-sm mt-2">
							<button class="btn btn-light">Delete</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>

	<section class="container bg-info text-white mt-3 p-3">
		<h2>Add New Product</h2>
		<form action="AddProduct" method="post" enctype="multipart/form-data">
			<input class="form-control m-2" type="text" name="name" maxlength="45"
				placeholder="Product Name" required /> 
			<input class="form-control m-2"
				type="number" name="price" min="0" placeholder="Product Price"
				required /> 
			<input class="form-control m-2" type="text" name="cname"
				maxlength="45" placeholder="Company Name" required /> 
			<select name="category" class="form-control m-2">
				<%
				for (String category : categories) {
				%>
				<option><%=category%></option>
				<%
				}
				%>
			</select>
			<label>Select Product Image:</label>
			<input class="form-control m-2" type="file" accept=".jpeg,.jpg,.png" name="image"
				required /> 
			<textarea class="form-control m-2" rows="3" name="info" maxlength="100" placeholder="Product Info"  required></textarea>
			<input class="form-control m-2"
				type="number" name="qty" min="1" placeholder="Product Quantity"
				required /> 
			<button class="btn btn-dark m-2">Submit</button>
		</form>
	</section>

	
	<label id="top-button"><i class="fa-solid fa-circle-up fa-2x"></i></label>

</body>
<script>
	AOS.init();
	//script for scroll to top
	$("#top-button").click(function() {
		$("html, body").animate({
			scrollTop : 0
		}, 1000);
	});
</script>
</html>
<%
}
%>