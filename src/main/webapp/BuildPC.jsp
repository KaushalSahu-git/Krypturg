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
    		<h5 class="text-center">Build My PC</h5>
		<form action="AddPcToCart" method="post" >
        		<label>Select Mother Board:</label>
        		<select name="motherboard" class="form-control">
				<%
				ArrayList<String> list = (ArrayList<String>) db.getProductByCategory("MotherBoard");
				for (String motherboard : list) {
				%>
				<option><%=motherboard%></option>
				<%
				}
				%>
			</select>
        		<label>Select Processor:</label>
        		<select name="processor" class="form-control">
				<%
				list = (ArrayList<String>) db.getProductByCategory("Processor");
				for (String processor : list) {
				%>
				<option><%=processor%></option>
				<%
				}
				%>
			</select>
			<label>Select RAM:</label>
        		<select name="ram" class="form-control">
				<%
				list = (ArrayList<String>) db.getProductByCategory("RAM");
				for (String ram : list) {
				%>
				<option><%=ram%></option>
				<%
				}
				%>
			</select>
			<label>Select Hard Disk:</label>
        		<select name="harddisk" class="form-control">
				<%
				list = (ArrayList<String>) db.getProductByCategory("HardDisk");
				for (String harddisk : list) {
				%>
				<option><%=harddisk%></option>
				<%
				}
				%>
			</select>
			<label>Select keyboard:</label>
        		<select name="keyboard" class="form-control">
				<%
				list = (ArrayList<String>) db.getProductByCategory("keyboard");
				for (String keyboard : list) {
				%>
				<option><%=keyboard%></option>
				<%
				}
				%>
			</select>
			<label>Select Mouse:</label>
        		<select name="mouse" class="form-control">
				<%
				list = (ArrayList<String>) db.getProductByCategory("mouse");
				for (String mouse : list) {
				%>
				<option><%=mouse%></option>
				<%
				}
				%>
			</select>
			<label>Select Web Cam:</label>
        		<select name="webcam" class="form-control">
				<%
				list = (ArrayList<String>) db.getProductByCategory("webcam");
				for (String webcam : list) {
				%>
				<option><%=webcam%></option>
				<%
				}
				%>
			</select>
			<label>Select UPS:</label>
        		<select name="ups" class="form-control">
				<%
				list = (ArrayList<String>) db.getProductByCategory("ups");
				for (String ups : list) {
				%>
				<option><%=ups%></option>
				<%
				}
				%>
			</select>
			<label>Select Cabinate:</label>
        		<select name="cabinate" class="form-control">
				<%
				list = (ArrayList<String>) db.getProductByCategory("Cabinate");
				for (String Cabinate : list) {
				%>
				<option><%=Cabinate%></option>
				<%
				}
				%>
			</select>
			<br/>
        		<button class="btn btn-dark my-2">Build</button>
      	</form>
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