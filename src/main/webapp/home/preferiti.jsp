<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="DB.DbOperations" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Objects" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Preferiti</title>

    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="../assets/css/fontawesome.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/owl.css">
</head>

<body>

<% Cookie cookie[] = request.getCookies();%>


<div id="preloader">
    <div class="jumper">
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>

<div class="sub-header">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-xs-12">
                <ul class="left-info">
                    <li><a href="mailto:carrentalsapienza@gmail.com"><i class="fa fa-envelope"></i>carrentalsapienza@gmail.com</a></li>
                    <li><a href="#"><i class="fa fa-phone"></i>123-456-7890</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <ul class="right-icons">
                    <form action="preferiti" method="get"><li><button type="submit"><i class="fa fa-star" aria-hidden="true"></i></button></li></form>
                </ul>
            </div>
        </div>
    </div>
</div>

<header class="">
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="index.jsp"><h2>Car Rental<em></em></h2></a>
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
                        <a class="nav-link" href="fleet.jsp">Fleet</a>
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

<!-- Page Content -->
<div class="page-heading header-text">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Preferiti</h1>
            </div>
        </div>
    </div>
</div>

<div class="services">
    <div class="container">
        <div class="row">
            <%
                if(cookie != null && cookie.length > 1){
                DbOperations operations = new DbOperations();
                ArrayList<ArrayList<String>> veicoli = operations.GetVeicoli();
                for(ArrayList<String> veicolo : veicoli){
                    for (int i = 1; i < cookie.length; i++)
                    {
                        if(!Objects.equals(cookie[i].getName(), "JSESSIONID")){
                        if (Integer.parseInt(veicolo.get(0)) == Integer.parseInt(cookie[i].getValue()))
                        {
            %>

            <div class="col-md-4" id="col">
                <form action="${pageContext.request.contextPath}/cookieServlet" method="get">
                    <div class="service-item">
                        <img class="immagine" src="../carImage/<%=veicolo.get(7)%>" width="200" height="200">
                        <div class="down-content">
                            <input type="hidden" name="id" value="<%=veicolo.get(0)%>">
                            <h4><%=veicolo.get(1)%></h4>
                            <div style="margin-bottom:10px;">
                                <span>Da <sup>$</sup><%=veicolo.get(3)%> al giorno</span>
                            </div>
                            <p>
                                <i class="fa fa-user" title="passegengers"></i> <%=veicolo.get(4)%> &nbsp;&nbsp;&nbsp;
                                <i class="fa fa-briefcase" title="luggages"></i> <%=veicolo.get(5)%> &nbsp;&nbsp;&nbsp;
                                <i class="fa fa-sign-out" title="doors"></i> <%=veicolo.get(6)%> &nbsp;&nbsp;&nbsp;
                            </p>
                            <button type="submit" class="btn btn-warning" data-toggle="modal" data-target="#exampleModal2" >Elimina</button>
                            <!--creare servlet che aggiunge ai preferiti come cookie. Nella pagina dei preferiti usare una servlet da tramite per stamparli tutti -->
                        </div>
                    </div>
                </form>
                <br>
            </div>


            <br>
            <%               }
                        }
                    }
                }
            }%>
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
            <div class="col-md-12">
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
