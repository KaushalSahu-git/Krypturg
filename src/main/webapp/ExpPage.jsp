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
	<p class="bg-danger text-white p-4 text-center"> EXCEPTION OCCURED !! </p>
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
    <section>
      <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="resources/banner1.jpg" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="resources/banner2.jpg" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="resources/banner3.jpg" class="d-block w-100" alt="...">
          </div>
        </div>
       <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </button>
      </div>
    </section>
    <section class="container text-center my-5" id="dishes" data-aos="zoom-in" data-aos-duration="1000">
        <h3>Lorem ipsum dolor sit amet.</h3>
        <div class="row">
          <div class="col-sm p-2">
            <div class="c-dishes-card">
                <img src="resources/img1.jpg" alt="">
                <h6>Lorem ipsum dolor sit.</h6>
                <p>Lorem ipsum dolor sit amet consectetur.</p>
            </div>
          </div>
          <div class="col-sm p-2">
            <div class="c-dishes-card">
                <img src="resources/img2.jpg" alt="">
                <h6>Lorem ipsum dolor sit.</h6>
                <p>Lorem ipsum dolor sit amet consectetur.</p>
            </div>
          </div>
          <div class="col-sm p-2">
            <div class="c-dishes-card">
                <img src="resources/img3.jpg" alt="">
                <h6>Lorem ipsum dolor sit.</h6>
                <p>Lorem ipsum dolor sit amet consectetur.</p>
            </div>
          </div>
          <div class="col-sm p-2">
            <div class="c-dishes-card">
                <img src="resources/img4.jpg" alt="">
                <h6>Lorem ipsum dolor sit.</h6>
                <p>Lorem ipsum dolor sit amet consectetur.</p>
            </div>
          </div>
        </div>
        <button class="btn btn-primary my-5 c-get-in-touch" data-toggle="modal" data-target="#contactModal">Get In Touch <i class="fa-solid fa-right-long"></i></button>
    </section>
    <section id="sec-1" class="p-5">
        <p>Lorem ipsum dolor sit amet.</p>
        <h6>Lorem ipsum dolor sit amet consectetur <br/> adipisicing elit Beatae, iure.</h6>
        <div class="my-4" data-aos="fade-down" data-aos-duration="1000">
          <p>
            <i class="fa-solid fa-computer fa-2x"></i><br/> <label>Lorem, ipsum dolor.</label>
          </p>
          <p>
            <i class="fa-solid fa-computer-mouse fa-2x"></i><br/> <label>Lorem, ipsum dolor.</label>
          </p>
          <p class="border-0">
            <i class="fa-solid fa-computer fa-2x"></i> <br/> <label>Lorem, ipsum dolor.</label>
          </p>
        </div>
        <button data-aos="fade-right" data-aos-duration="1000" class="btn btn-primary c-get-in-touch" data-toggle="modal" data-target="#contactModal">Get In Touch <i class="fa-solid fa-right-long"></i></button>
    </section>
    <footer class="bg-dark p-5 text-center">
        <a href="index.jsp">
          <img src="resources/icon.png" height="35px" alt="">
          <span class="text-danger">Kryp</span>Turg
        </a>
        <br/>
        <p>&copy Rights Reserved</p>
        <p>
          <a href="https://www.facebook.com/incapp"><i class="fa-brands fa-facebook"></i></a>
          <a href="https://www.instagram.com/incapp.in"><i class="fa-brands fa-instagram"></i></a>
          <a href="https://www.youtube.com/incapp"><i class="fa-brands fa-youtube"></i></a>
        </p>
    </footer>
    <label id="top-button"><i class="fa-solid fa-circle-up fa-2x"></i></label>

	<!-- Modal -->
    <div class="modal fade" id="AdminLoginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header bg-primary text-white">
            <h5 class="modal-title" id="exampleModalLabel">Admin Login</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <form action="AdminLogin" method="post" >
                  <div class="row">
                      <div class="col-sm mt-2">
                          <input class="form-control" type="text" name="id" maxlength="20" placeholder="Admin ID" required />
                      </div>
                      <div class="col-sm mt-2">
                        <input class="form-control" type="password" name="password" maxlength="20" placeholder="Password" required />
                    </div>
                    <div class="col-sm mt-2">
                      <button class="btn btn-primary">Login</button>
                    </div>
                  </div>
              </form>
          </div>
        </div>
      </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="contactModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header bg-success">
            <h5 class="modal-title" id="exampleModalLabel">Get In Touch</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <form action="AddEnquiry" method="post">
                  <div class="row">
                      <div class="col-sm mt-2">
                          <input class="form-control" type="text" name="name" pattern="[a-zA-Z ]+" maxlength="20" placeholder="Your Name" required />
                      </div>
                      <div class="col-sm mt-2">
                        <input class="form-control" type="tel" name="phone" pattern="[0-9]+" maxlength="10" minlength="10" placeholder="Your Phone" required />
                    </div>
                    <div class="col-sm mt-2">
                      <button class="btn btn-success">Submit</button>
                    </div>
                  </div>
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