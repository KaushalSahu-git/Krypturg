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
    <section class="container">
      	<h4 class="bg-success text-white p-3">
      		Select Your Address:
      		<button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#addressModal">Add New Address</button>
      	</h4>
      	<form action="OrderPlaced" method="post">
      	<%
      	ArrayList<String> addresses=db.getAddressByEmail(email);
		for(String address:addresses){
		%>
             <input class="p-2 m-2" type="radio" name="address" value="<%=address%>" required /> <%=address%>
              <br/>
		<%			
		}
		db.closeConnection();
      	%>
      		<p class="bg-success text-white p-3 text-center">
      			Total Amount: <b><%= session.getAttribute("total") %></b> 
            		<button class="btn btn-warning">Place Order</button>
            </p>
        	</form>
      	
    </section>
<!-- Modal -->
    <div class="modal fade" id="addressModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header bg-light">
            <h5 class="modal-title" id="exampleModalLabel">New Address</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <form action="AddAddress" method="post">
                  <textarea class="form-control" rows="3" name="address" placeholder="Your Address" required></textarea>
                  <br/>
                  <button class="btn btn-primary">Submit</button>
              </form>
          </div>
        </div>
      </div>
    </div>
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