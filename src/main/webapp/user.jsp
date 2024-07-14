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
        <a href="index.jsp" class="navbar-brand">
          <img src="resources/icon.png" height="35px" alt="">
          <span>Kryp</span>turg
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#my-navbar">
          <i class="fa-solid fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="my-navbar">
            <ul class="navbar-nav mx-auto p-2">
              <li>
                <a href="index.jsp">Home</a>
              </li>
              <li>
                <a href="user.jsp">User</a>
              </li>
              <li>
                <a href=""  data-toggle="modal" data-target="#AdminLoginModal">Admin</a>
              </li>
              <li>
                <a href=""  data-toggle="modal" data-target="#contactModal">Get In Touch</a>
              </li>
            </ul>
            <a id="call" href="tel:9811XXXXXX"><i class="fa-solid fa-mobile-screen-button"></i> 9811XXXXXX</a>
        </div>
    </nav>

	<section class="container bg-light p-3">
		<div class="row">
			<div class="col-sm bg-success text-white p-4">
				<h4>User Sign In</h4>
				<form action="UserSignIn" method="post" >
                		<label>User Email:</label>
                		<input class="form-control my-2" type="email" name="email" maxlength="100" placeholder="User Email" required />
                		<label>User Password:</label>
                		<input class="form-control my-2" type="password" name="password" maxlength="20" placeholder="Password" required />
                		<button class="btn btn-primary my-2">Login</button>
              	</form>
			</div>
			<div class="col-sm bg-info text-white p-4">
				<h4>User Sign Up</h4>
				<form action="UserSignUp" method="post" >
                		<label>User Email:</label>
                		<input class="form-control my-2" type="email" name="email" maxlength="100" placeholder="User Email" required />
                		<label>User Name:</label>
                		<input class="form-control my-2" type="text" name="name" pattern="[a-zA-Z ]+" maxlength="100" placeholder="User Name" required />
                		<label>User Phone:</label>
                		<input class="form-control my-2" type="tel" name="phone" maxlength="10" minlength="10" placeholder="User Phone" required />
                		<label>User Password:</label>
                		<input class="form-control my-2" type="password" name="password" maxlength="20" placeholder="Password" required />
                		<button class="btn btn-primary my-2">Register</button>
              	</form>
			</div>
		</div>
	</section>

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