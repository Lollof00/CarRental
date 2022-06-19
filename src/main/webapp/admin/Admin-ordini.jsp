<%@ page import="DB.DbOperations" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="Utility.ServletUtility" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Sezione Admin</title>

    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../assets/css/fontawesome.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/owl.css">
    <style>
        .table-wrapper {
            width: 1300px;
            margin: 30px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }
        .table-title {
            padding-bottom: 10px;
            margin: 0 0 10px;
        }
        .table-title h2 {
            margin: 6px 0 0;
            font-size: 22px;
        }
        .table-title .add-new {
            float: right;
            height: 30px;
            font-weight: bold;
            font-size: 12px;
            text-shadow: none;
            min-width: 100px;
            border-radius: 50px;
            line-height: 13px;
        }
        .table-title .add-new i {
            margin-right: 4px;
        }
        table.table {

        }
        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
        }
        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }
        table.table th:last-child {
            width: 100px;
        }
        table.table td a {
            cursor: pointer;
            display: inline-block;
            margin: 0 5px;
            min-width: 24px;
        }
        table.table td a.add {
            color: #27C46B;
        }
        table.table td a.edit {
            color: #FFC107;
        }
        table.table td a.delete {
            color: #E34724;
        }
        table.table td i {
            font-size: 19px;
        }
        table.table td a.add i {
            font-size: 24px;
            margin-right: -1px;
            position: relative;
            top: 3px;
        }
        table.table .form-control {

            box-shadow: none;
            border-radius: 2px;
        }
        table.table .form-control.error {
            border-color: #f50000;
        }
        table.table td .add {
            display: none;
        }
    </style>
</head>

<body>

<div id="preloader">
    <div class="jumper">
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>


<header class="">
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="admin-page.jsp"><h2>Car Rental</h2></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#"><b><%=request.getSession().getAttribute("username")%></b>
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/register-admin.jsp">Registra nuovo Admin</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin-page.jsp">Admin Page</a>
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
                <h1>Admin Page</h1>
            </div>
        </div>
    </div>
</div>

<div class="services">
    <div class="container">
        <h6 style="color: red;"><%= ServletUtility.getErrorMessage(request) %></h6>
        <h6 style="color: green;"><%= ServletUtility.getSuccessMessage(request)%></h6>
        <div class="container-lg">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-8"><h2>Dettagli <b>Ordini</b></h2></div>

                        </div>
                    </div>
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>Id_Macchina</th>
                            <th>PickUp Location</th>
                            <th>Return Location</th>
                            <th>Nome registrazione</th>
                            <th>Email</th>
                            <th>Telefono</th>
                            <th>Inizio Noleggio</th>
                            <th>Fine Noleggio</th>
                            <th>Utente</th>
                            <th>Commento</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% DbOperations operations = new DbOperations();
                            ArrayList<ArrayList<String>> veicoli = operations.getAllOrdini();
                            for(ArrayList<String> veicolo : veicoli){
                        %>
                        <tr>
                            <td><%=veicolo.get(0)%></td><!--id -->
                            <td><%=veicolo.get(1)%></td><!--id car -->
                            <td><%=veicolo.get(6)%></td><!--pickup -->
                            <td><%=veicolo.get(2)%></td><!--return -->
                            <td><%=veicolo.get(3)%></td><!--fullname -->
                            <td><%=veicolo.get(4)%></td><!--email -->
                            <td><%=veicolo.get(5)%></td><!--cell -->
                            <td><%=veicolo.get(7)%></td><!--inizio -->
                            <td><%=veicolo.get(8)%></td><!--fine -->
                            <td><%=veicolo.get(9)%></td><!--utente -->
                            <td><%=veicolo.get(10)%></td><!--commento -->
                            <td></td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

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