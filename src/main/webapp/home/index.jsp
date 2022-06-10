<%@page import="Utility.ServletUtility" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Car Rental</title>

    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../assets/css/fontawesome.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/owl.css">
  </head>

  <body>

  <%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); %>
    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->

    <!-- Header -->
    <div class="sub-header">
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-xs-12">
            <ul class="left-info">
              <h1 class="navbar-brand"><%=session.getAttribute("username")%></h1>
            </ul>
          </div>
          <div class="col-md-4">
          </div>
        </div>
      </div>
    </div>

    <header class="">
      <nav class="navbar navbar-expand-lg">
        <div class="container">
          <a class="navbar-brand" href="index.jsp"><h2>Car Rental</h2></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home
                  <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="miei-ordini.jsp">I miei ordini</a>
              </li>
              <li class="nav-item dropdown">
                <a class="dropdown-toggle nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
              
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="about.jsp">About Us</a>
                    <a class="dropdown-item" href="team.jsp">Team</a>
                </div>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="contact.jsp">Contattaci</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/logout">Logout</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>


    <div class="main-banner header-text" id="top">
        <div class="Modern-Slider">
          <div class="item item-1">
            <div class="img-fill">
                <div class="text-content">
                  <h6>Mettiti in contatto con noi!</h6>
                  <h4>Risolveremo<br> tutti i tuoi problemi</h4>
                  <p>Non esitare a contattarci per eventuali dubbi o domande.</p>
                  <a href="contact.jsp" class="filled-button">contattaci</a>
                </div>
            </div>
          </div>

          <div class="item item-2">
            <div class="img-fill">
            </div>
          </div>

          <div class="item item-3">
            <div class="img-fill">
            </div>
          </div>

        </div>
    </div>
    <!-- Banner Ends Here -->
    <form action="../FilterCar" method="post">
    <div class="container-fluid bg-white pt-3 px-lg-5">
      <div class="row mx-n2">
        <div class="col-xl-2 col-lg-4 col-md-6 px-2">
          <select class="custom-select px-4 mb-3" style="height: 50px;" name="locationPick">
            <option selected>Pickup Location</option>
            <option value="Roma Leonardo Da Vinci">Roma Leonardo Da Vinci</option>
            <option value="Catania TorreRossa">Catania TorreRossa</option>
            <option value="Napoli Capodichino">Napoli Capodichino</option>
          </select>
        </div>
        <div class="col-xl-2 col-lg-4 col-md-6 px-2">
          <select class="custom-select px-4 mb-3" style="height: 50px;" name="locationDrop">
            <option selected>Drop Location</option>
            <option value="Milano Malpensa">Milano Malpensa</option>
            <option value="Bologna Guielmo Marconi">Bologna Guielmo Marconi</option>
            <option value="Palermo Falcone e Borsellino">Palermo Falcone e Borsellino</option>
          </select>
        </div>
        <div class="col-xl-2 col-lg-4 col-md-6 px-2">
          <div class="date mb-3" id="date" data-target-input="nearest">
            <input type="date" class="form-control p-4 datetimepicker-input" placeholder="Pickup Date"
                   data-target="#date" data-toggle="datetimepicker" name="pickUp"/>
          </div>
        </div>
        <div class="col-xl-2 col-lg-4 col-md-6 px-2">
          <div class="time mb-3" id="time" data-target-input="nearest">
            <input type="date" class="form-control p-4 datetimepicker-input" placeholder="Drop Off"
                   data-target="#time" data-toggle="datetimepicker" name="dropOff" />
          </div>
        </div>
        <div class="col-xl-2 col-lg-4 col-md-6 px-2">
          <button class="btn btn-primary btn-block mb-3" type="submit" style="height: 50px;">Cerca</button>
        </div>
      </div>
    </div>
    </form>
    <h6 style="color: red;"><%= ServletUtility.getErrorMessage(request) %></h6>
    <h6 style="color: green;"><%= ServletUtility.getSuccessMessage(request)%></h6>

    <div class="testimonials">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section-heading">
              <h2>Cosa dicono <em>di noi</em></h2>
              <span>testimonials dai nostri miglori clienti</span>
            </div>
          </div>
          <div class="col-md-12">
            <div class="owl-testimonials owl-carousel">
              
              <div class="testimonial-item">
                <div class="inner-content">
                  <h4>George Walker</h4>
                  <span>Chief Financial Analyst</span>
                  <p>"Nulla ullamcorper, ipsum vel condimentum congue, mi odio vehicula tellus, sit amet malesuada justo sem sit amet quam. Pellentesque in sagittis lacus."</p>
                </div>
                <img src="http://placehold.it/60x60" alt="">
              </div>
              
              <div class="testimonial-item">
                <div class="inner-content">
                  <h4>John Smith</h4>
                  <span>Market Specialist</span>
                  <p>"In eget leo ante. Sed nibh leo, laoreet accumsan euismod quis, scelerisque a nunc. Mauris accumsan, arcu id ornare malesuada, est nulla luctus nisi."</p>
                </div>
                <img src="http://placehold.it/60x60" alt="">
              </div>
              
              <div class="testimonial-item">
                <div class="inner-content">
                  <h4>David Wood</h4>
                  <span>Chief Accountant</span>
                  <p>"Ut ultricies maximus turpis, in sollicitudin ligula posuere vel. Donec finibus maximus neque, vitae egestas quam imperdiet nec. Proin nec mauris eu tortor consectetur tristique."</p>
                </div>
                <img src="http://placehold.it/60x60" alt="">
              </div>
              
              <div class="testimonial-item">
                <div class="inner-content">
                  <h4>Andrew Boom</h4>
                  <span>Marketing Head</span>
                  <p>"Curabitur sollicitudin, tortor at suscipit volutpat, nisi arcu aliquet dui, vitae semper sem turpis quis libero. Quisque vulputate lacinia nisl ac lobortis."</p>
                </div>
                <img src="http://placehold.it/60x60" alt="">
              </div>
              
            </div>
          </div>
        </div>
      </div>
    </div>



    
    <div class="sub-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <p>
                Copyright © 2022 Car Rental
            </p>
          </div>
        </div>
      </div>
    </div>

    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../assets/js/custom.js"></script>
    <script src="../assets/js/owl.js"></script>
    <script src="../assets/js/slick.js"></script>
    <script src="../assets/js/accordions.js"></script>


  </body>
</html>