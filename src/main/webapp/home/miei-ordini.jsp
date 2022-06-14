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



    <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fontawesome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.css">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

</head>

<body>

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
                    <form action="${pageContext.request.contextPath}/preferiti" method="get"><li><button type="submit"><i class="fa fa-star" aria-hidden="true"></i></button></li></form>
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

<div class="page-heading header-text">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>I miei ordini</h1>
            </div>
        </div>
    </div>
</div>

<div class="services">
    <div class="container">
        <div class="row">
            <% DbOperations dbOperations = new DbOperations();
                ArrayList<ArrayList<String>> veicoli = dbOperations.getOrdiniUtente((String) session.getAttribute("username"));
                System.out.println(veicoli);
                for(ArrayList<String> veicolo : veicoli){
            %>

            <div class="col-md-4" id="col">
                <form action="${pageContext.request.contextPath}/commento" method="post">
                    <div class="service-item">
                        <img class="immagine" src="${pageContext.request.contextPath}/carImage/<%=veicolo.get(7)%>" width="200" height="200">
                        <div class="down-content">
                            <input type="hidden" name="id" value="<%=veicolo.get(0)%>">
                            <h4><%=veicolo.get(1)%></h4>
                            <p>
                                <i class="fa fa-user" title="passegengers"></i> <%=veicolo.get(4)%> &nbsp;&nbsp;&nbsp;
                                <i class="fa fa-briefcase" title="luggages"></i> <%=veicolo.get(5)%> &nbsp;&nbsp;&nbsp;
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
                                </p>

                            <%
                                }else {

                            %>
                                <p>
                                    Commento effettuato:
                                    <%=veicolo.get(19)%>
                                </p>
                            <h6 style="color: red;"><%= ServletUtility.getErrorMessage(request) %></h6>
                            <h6 style="color: green;"><%= ServletUtility.getSuccessMessage(request)%></h6>
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

<div class="sub-footer">
    <div class="container">
        <div class="row">
        </div>
    </div>
</div>




<script>
    $("#now").on("click", function ()
    {
        var id = $("#modalBook").attr("data");
        $("#macchinaId").attr("value", id);
    })
</script>
<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/owl.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/slick.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/accordions.js"></script>



</body>
</html>
