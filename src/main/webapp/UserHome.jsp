<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.incapp.model.DAO"%>
<%
	String name=(String)session.getAttribute("name");
	String email=(String)session.getAttribute("email");
	if(name==null){
		session.setAttribute("msg", "Please Login First!");
		response.sendRedirect("user.jsp");
	}else{
%>

<!DOCTYPE html>
<html>

<head>
  <title>Krypturg</title>
  <link rel="icon" href="resources/Krypturg-logo.png" />

  <meta name="viewport" content="width=device-width, initial-scale=1">

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" />

  <!-- font-awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/js/all.min.js" integrity="sha512-rpLlll167T5LJHwp0waJCh3ZRf7pO6IT1+LZOhAyP6phAirwchClbTZV3iqL3BMrVxIYRbzGTpli4rfxsCK6Vw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  
  <!-- AOS CSS & Script -->
  <script src="resources/aos/aos.js"></script>
  <link rel="stylesheet" href="resources/aos/aos.css"/>

  <!-- custom css -->
  <link rel="stylesheet" href="resources/custom.css">

  <meta name="author" content="Rahul Chauhan" />
  <meta name="description" content="This is a website for Computers." />
  <meta name="keywords" content="" />
</head>

<body>
	
	<% 
		String msg=(String)session.getAttribute("msg");
	 	if(msg!=null){
	%>
			<p class="bg-warning p-2 text-center"> <%= msg %> </p>
	<%	
			session.setAttribute("msg", null);
	 	}
	%>
	
	
    <nav class="navbar navbar-expand-sm container my-3">
        <a href="UserHome.jsp" class="navbar-brand">
          <img src="resources/icon.png" height="35px" alt="">
          <span>Kryp</span>turg
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#my-navbar">
          <i class="fa-solid fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="my-navbar">
            <ul class="navbar-nav mx-auto p-2">
              <li>
                <a href="UserHome.jsp">Home</a>
              </li>
              <li>
                <a href="UserOrders.jsp">Order</a>
              </li>
              <li>
                <a href="BuildPC.jsp">Build My PC</a>
              </li>
            </ul>
            <label id="call" href=""> 
            		Welcome: <b><%= name %></b>  
            		<%
            		DAO	db=new DAO();
            		int count=db.countCart(email);
            		%>
            		<a class="btn btn-sm btn-dark" href="Cart.jsp">Cart [<%=count %>] </a>
            		<a class="btn btn-sm btn-danger" href="Logout">Logout</a>
            </label>
        </div>
    </nav>
    <section class="container bg-primary text-white p-2">
    		<h5>Search Product</h5>
		<form action="UserHome.jsp" method="post">
			<div class="row">
				<div class="col-sm mt-2">
					<input class="form-control" type="search" name="p_name"
						maxlength="20" placeholder="Product Name" required />
				</div>
				<div class="col-sm mt-2">
					<button class="btn btn-light">Search</button>
				</div>
			</div>
		</form>
    </section>
    <%
	String p_name=request.getParameter("p_name");
	if(p_name==null){
		p_name="";
	}
	%>
    <section class="container bg-light mt-3 p-3">
		<h2 class="text-center">All products</h2>
		<%	
    		ArrayList<HashMap<String, Object>> products=(ArrayList<HashMap<String, Object>>)db.getProductsLikeName(p_name);
    		db.closeConnection();
    		for(HashMap<String, Object> product:products){
    		%>
    		<div class="bg-warning my-1 p-2 pt-4 row">
    			<div class="col-sm-3">
    				<img src="GetProductImage?name=<%=product.get("name") %>" height="100px" />
    			</div>
    			<div class="col-sm-9">
    				<p>
    				Name: <b><%= product.get("name") %></b> &nbsp; &nbsp;
    				Price: <b><%= product.get("price") %></b> &nbsp; &nbsp;
    				Company Name: <b><%= product.get("cname") %></b> &nbsp; &nbsp;
    				Category: <b><%= product.get("category") %></b> &nbsp; &nbsp;
    				Info: <b><%= product.get("info") %></b>
    			</p>
    			<form action="AddToCart">
    				<input type="hidden" name="p_name" value="<%=p_name%>" />
    				<input type="hidden" name="name" value="<%=product.get("name") %>" />
    				<button class="btn btn-sm btn-success">Add To Cart</button>
    			</form>
    			</div>
    		</div>
    	<%
    		}
    	%>
	</section>
	
    
    <label id="top-button"><i class="fa-solid fa-circle-up fa-2x"></i></label>

</body>
<script>
    AOS.init();
    //script for scroll to top
    $("#top-button").click(function () {
        $("html, body").animate({scrollTop: 0}, 1000);
    });
</script>
</html>
<%
}
%>