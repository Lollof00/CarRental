<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.DbOperations" %>
<%@ page import="Utility.ServletUtility" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

</head>

<body>

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
                    <li><a href="#"><i class="fa fa-envelope"></i>carental@gmail.com</a></li>
                    <li><a href="#"><i class="fa fa-phone"></i>123-456-7890</a></li>
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
            <a class="navbar-brand" href="index.jsp"><h2>Car Rental<em> Website</em></h2></a>
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
                        <a class="nav-link" href="contact.jsp">Contact Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/logout">Logout</a>
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
                <h1>Fleet</h1>
                <span>Lorem ipsum dolor sit amet.</span>
            </div>
        </div>
    </div>
</div>

<div class="services">
    <div class="container">
        <div class="row">
            <% DbOperations dbOperations = new DbOperations();
                ArrayList<ArrayList<String>> veicoli = dbOperations.getOrdiniUtente((String) session.getAttribute("username"));
                for(ArrayList<String> veicolo : veicoli){
            %>

            <div class="col-md-4" id="col">
                <form action="${pageContext.request.contextPath}/commento" method="post">
                    <div class="service-item">
                        <img class="immagine" src="../carImage/<%=veicolo.get(8)%>" width="200" height="200">
                        <div class="down-content">
                            <input type="hidden" name="id" value="<%=veicolo.get(0)%>">
                            <h4><%=veicolo.get(1)%></h4>
                            <div style="margin-bottom:10px;">
                                <span>Da <sup>$</sup><%=veicolo.get(4)%> al giorno</span>
                            </div>
                            <p>
                                <i class="fa fa-user" title="passegengers"></i> <%=veicolo.get(5)%> &nbsp;&nbsp;&nbsp;
                                <i class="fa fa-briefcase" title="luggages"></i> <%=veicolo.get(7)%> &nbsp;&nbsp;&nbsp;
                                <i class="fa fa-sign-out" title="doors"></i> <%=veicolo.get(6)%> &nbsp;&nbsp;&nbsp;
                            </p>
                            <p>
                                <i class="fa fa-calendar" aria-hidden="true"></i> <%=veicolo.get(16)%> - <%=veicolo.get(17)%>
                            </p>
                            <p>
                                <i class="fa fa-map-marker" aria-hidden="true"></i> <%=veicolo.get(15)%> - <%=veicolo.get(11)%>
                            </p>

                            <%
                                if (veicolo.get(20).equals("0"))
                                {
                                    %>

                                <p>
                                    <input type="text" maxlength="1000" name="commento" placeholder="Aggiungi un commento">
                                    <input type="hidden" name="ida" value="<%=veicolo.get(9)%>">
                                    <button type="submit" class="btn btn-primary">Aggiungi commento</button>
                                    <h6 style="color: red;"><%= ServletUtility.getErrorMessage(request) %></h6>
                                    <h6 style="color: green;"><%= ServletUtility.getSuccessMessage(request)%></h6>
                                </p>

                            <%
                                }else {

                            %>
                                <p>
                                    Commento effettuato:
                                    <%=veicolo.get(19)%>
                                </p>
                            <%
                                }
                            %>

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

<!-- Footer Starts Here -->
<div class="sub-footer">
    <div class="container">
        <div class="row">
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-top: 70px;">
    <div class="modal-dialog modal-lg" role="document">
        <form method="get" action="bookNow">
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
                            <input type="text" class="form-control" placeholder="Enter full name" name="full-name" required="">
                        </fieldset>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <fieldset>
                                    <input type="text" class="form-control" placeholder="Enter email address" name="email" required="">
                                </fieldset>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <fieldset>
                                    <input type="text" class="form-control" placeholder="Enter phone" name="phone" required="">
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

<!-- Modal
<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-top: 70px;">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <form>
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel2">Preferiti</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        La macchina e' stata aggiunta ai preferiti.
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        <button type="submit" class="btn btn-primary">Vai ai preferiti</button>
      </div>
      </form>
    </div>
  </div>
</div>
ciao

-->

<!-- Bootstrap core JavaScript -->
<script>
    $("#now").on("click", function ()
    {
        var id = $("#modalBook").attr("data");
        $("#macchinaId").attr("value", id);
    })
</script>
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Additional Scripts -->
<script src="../assets/js/custom.js"></script>
<script src="../assets/js/owl.js"></script>
<script src="../assets/js/slick.js"></script>
<script src="../assets/js/accordions.js"></script>

<script language = "text/Javascript">
    cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
    function clearField(t){                   //declaring the array outside of the
        if(! cleared[t.id]){                      // function makes it static and global
            cleared[t.id] = 1;  // you could use true and false, but that's more typing
            t.value='';         // with more chance of typos
            t.style.color='#fff';
        }
    }
</script>

</body>
</html>
