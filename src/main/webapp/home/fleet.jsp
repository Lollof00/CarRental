<%@ page import="DB.DbOperations" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@page import="Utility.ServletUtility" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">


    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../assets/css/fontawesome.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/owl.css">
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>



  </head>

  <body>

  <%
    if(!(session.getAttribute("bookSuccess") ==null)){
  %>
  <script>
    $(document).ready(function() {
      $("#confermaPrenotazione").modal("show")
    })
  </script>
<%
  }
  %>

    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->

  <div class="modal" id="confermaPrenotazione" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"><%=session.getAttribute("bookSuccess")%></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Ti abbiamo inviato un email con i dettagli del noleggio</p>
      </div>
      <div class="modal-footer">
        <a href="miei-ordini.jsp"><button type="button" class="btn btn-primary">Vai ai miei ordini</button></a>
      </div>
    </div>
  </div>
  </div>

    <!-- Header -->
    <div class="sub-header">
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-xs-12">
            <ul class="left-info">
              <li><a href="mailto:carrentalsapienza@gmail.com"><i class="fa fa-envelope"></i>carrentalsapienza@gmail.com</a></li>
            </ul>
          </div>
          <div class="col-md-4">
            <ul class="right-icons">
              <form action="${pageContext.request.contextPath}/preferiti" method="get"><li><button type="submit"><i class="fa fa-star" aria-hidden="true"></i></button></li></form>
            </ul>
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
              <li class="nav-item">
                <a class="nav-link" href="index.jsp">Home
                  <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item active">
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
            </ul>
          </div>
        </div>
      </nav>
    </header>

    <!-- Page Content -->
    <div class="page-heading header-text">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <%SimpleDateFormat pick = new SimpleDateFormat("dd/MM");
              SimpleDateFormat drop = new SimpleDateFormat("dd/MM");
              Date pick_date = (Date) session.getAttribute("pick_date");
              Date drop_date = (Date) session.getAttribute("drop_date");

            %>
            <h1><b>Ritiro: <%=session.getAttribute("pick_location")%> </b>   Il: <%=pick.format(pick_date)%> <b>Riconsegna:</b> <%=session.getAttribute("drop_location")%>  Il: <%=drop.format(drop_date)%></h1>
          </div>
        </div>
      </div>
    </div>

    <div class="services">
      <div class="container">
        <div class="row">
          <% ArrayList<ArrayList<String>> veicoli = (ArrayList<ArrayList<String>>) session.getAttribute("veicoli");
            for(ArrayList<String> veicolo : veicoli){
          %>

          <div class="col-md-4" id="col">
            <form action="${pageContext.request.contextPath}/preferiti" method="post">
              <div class="service-item">
                <img class="immagine" src="../carImage/<%=veicolo.get(8)%>" width="200" height="200">
                <div class="down-content">
                  <input type="hidden" name="id" value="<%=veicolo.get(0)%>">
                  <h4><%=veicolo.get(1)%></h4>
                  <div style="margin-bottom:10px;">
                    <span>from <sup>$</sup><%=veicolo.get(4)%> per weekend</span>
                  </div>
                  <p>
                    <i class="fa fa-user" title="passegengers"></i> <%=veicolo.get(5)%> &nbsp;&nbsp;&nbsp;
                    <i class="fa fa-briefcase" title="luggages"></i> <%=veicolo.get(7)%> &nbsp;&nbsp;&nbsp;
                    <i class="fa fa-sign-out" title="doors"></i> <%=veicolo.get(6)%> &nbsp;&nbsp;&nbsp;
                  </p>
                  <a href="#" data-toggle="modal" data-target="#exampleModal" class="filled-button" data="<%=veicolo.get(0)%>" id="modalBook">Prenota ora</a>
                  <p></p>
                  <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal2" >Aggiungi ai preferiti</button>

                </div>
              </div>
            </form>
            <br>
          </div>


          <br>
          <%}%>
          </div>
        </div>

        <br>
        <br>

        <nav>
          <ul class="pagination pagination-lg justify-content-center">
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">«</span>
                <span class="sr-only">Previous</span>
              </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">»</span>
                <span class="sr-only">Next</span>
              </a>
            </li>
          </ul>
        </nav>

        <br>
        <br>
        <br>
        <br>
      </div>
    </div>


    
    <div class="sub-footer">
      <div class="container">
        <div class="row">
        </div>
      </div>
    </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-top: 70px;">
      <div class="modal-dialog modal-lg" role="document">
        <form method="get" action="${pageContext.request.contextPath}/bookNow">
          <input type="hidden" value="" id="macchinaId" name="macchinaId">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Book Now</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">

                  <div class="form-group">
                    <fieldset>
                      <input type="text" class="form-control" placeholder="Nome Completo" name="full-name" required>
                    </fieldset>
                  </div>

                  <div class="row">
                   <div class="col-md-6">
                    <div class="form-group">
                      <fieldset>
                        <input type="email" class="form-control" placeholder="Indirizzo email" name="email" required>
                      </fieldset>
                    </div>
                   </div>

                   <div class="col-md-6">
                    <div class="form-group">
                      <fieldset>
                        <input type="tel" class="form-control" placeholder="Telefono" name="phone" required>
                      </fieldset>
                    </div>
                   </div>
                  </div>
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-primary" id="now">Book Now</button>
          </div>
        </div>
        </form>
      </div>
    </div>


    <script>
      $(document).ready(function() {
        $(".filled-button").on("click", function () {
          var id = $(this).attr("data");
          $("#now").on("click", function () {
            $("#macchinaId").attr("value", id);
          })
        })
      })
    </script>


    <script src="../assets/js/custom.js"></script>
    <script src="../assets/js/owl.js"></script>
    <script src="../assets/js/slick.js"></script>
    <script src="../assets/js/accordions.js"></script>

  </body>
</html>