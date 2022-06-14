<%@page import="Utility.ServletUtility" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.DbOperations" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Car Rental</title>

    <link
            href="https://code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css"
            rel="stylesheet"
    />
    <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous"
    ></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
            integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    ></script>
    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


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
          <select class="custom-select px-4 mb-3" style="height: 50px;" name="locationPick" required>
            <option selected>Pickup Location</option>
            <option value="Roma Leonardo Da Vinci">Roma Leonardo Da Vinci</option>
            <option value="Catania TorreRossa">Catania TorreRossa</option>
            <option value="Napoli Capodichino">Napoli Capodichino</option>
          </select>
        </div>
        <div class="col-xl-2 col-lg-4 col-md-6 px-2">
          <select class="custom-select px-4 mb-3" style="height: 50px;" name="locationDrop" required>
            <option selected>Drop Location</option>
            <option value="Milano Malpensa">Milano Malpensa</option>
            <option value="Bologna Guielmo Marconi">Bologna Guielmo Marconi</option>
            <option value="Palermo Falcone e Borsellino">Palermo Falcone e Borsellino</option>
          </select>
        </div>
        <div class="col-xl-2 col-lg-4 col-md-6 px-2">
          <div class="date mb-3" id="date" data-target-input="nearest">
            <input id="pickUp" type="text" class="form-control p-4 datetimepicker-input" placeholder="Pickup Date"
                   data-target="#date" data-toggle="datetimepicker" name="pickUp"/>
          </div>
        </div>
        <div class="col-xl-2 col-lg-4 col-md-6 px-2">
          <div class="time mb-3" id="time" data-target-input="nearest">
            <input id="dropOff" type="text" class="form-control p-4 datetimepicker-input" placeholder="Drop Off"
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

  <script>





    jQuery(function($) {
      $('input.datetimepicker').datepicker({
        duration: '',
        changeMonth: true,
        changeYear: false,
        yearRange: '2010:2020',
        showTime: false,
        time24h: true
      });

      $.datepicker.regional['it'] = {
        closeText: 'Chiudi', // set a close button text
        currentText: 'Oggi', // set today text
        monthNames: ['Gennaio','Febbraio','Marzo','Aprile','Maggio','Giugno',   'Luglio','Agosto','Settembre','Ottobre','Novembre','Dicembre'], // set month names
        monthNamesShort: ['Gen','Feb','Mar','Apr','Mag','Giu','Lug','Ago','Set','Ott','Nov','Dic'], // set short month names
        dayNames: ['Domenica','Luned&#236','Marted&#236','Mercoled&#236','Gioved&#236','Venerd&#236','Sabato'], // set days names
        dayNamesShort: ['Dom','Lun','Mar','Mer','Gio','Ven','Sab'], // set short day names
        dayNamesMin: ['Do','Lu','Ma','Me','Gio','Ve','Sa'], // set more short days names
        dateFormat: 'dd/mm/yy' // set format date
      };

      $.datepicker.setDefaults($.datepicker.regional['it']);
    });
  </script>


  <script>
    $(document).ready(function() {
      $("#pickUp").datepicker({
        onClose: function (selectedDate) {
          $("#dropOff").datepicker("option", "minDate", selectedDate);
        }
      });
      $("#dropOff").datepicker({
        onClose: function (selectedDate) {
          $("#pickUp").datepicker("option", "maxDate", selectedDate);
        }
      });
    });
  </script>
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
              <% DbOperations dbOperations = new DbOperations();
                ArrayList<ArrayList<String>> commenti = dbOperations.getCommentiUtenti();
                for(ArrayList<String> commento : commenti){
              %>
              <div class="testimonial-item">
                <div class="inner-content">
                  <h4><%=commento.get(0)%></h4>
                  <p>"<%=commento.get(1)%>"</p>
                </div>
                <img src="http://placehold.it/60x60" alt="">
              </div>
              <%}%>
              
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



    <script src="../assets/js/custom.js"></script>
    <script src="../assets/js/owl.js"></script>
    <script src="../assets/js/slick.js"></script>
    <script src="../assets/js/accordions.js"></script>


  </body>
</html>