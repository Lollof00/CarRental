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
            width: 1100px;
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
            <a class="navbar-brand" href="index.jsp"><h2>Car Rental</h2></a>
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
                        <a class="nav-link" href="Admin-ordini.jsp">Storico Ordini</a>
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
        <script>
                $(document).ready(function(){
                    $('[data-toggle="tooltip"]').tooltip();
                    var actions = $("table td:last-child").html();
                    $(".add-new").click(function(){
                        $(this).attr("disabled", "disabled");
                        var index = $("table tbody tr:last-child").index();
                        var row = '<tr>' +
                            '<td><input type="text" class="form-control" name="id" id="id"></td>' +
                            '<td><input type="text" class="form-control" name="modello" id="modello"></td>' +
                            '<td><input type="text" class="form-control" name="produttore" id="produttore"></td>' +
                            '<td><input type="text" class="form-control" name="targa" id="targa" maxlength="7"></td>' +
                            '<td><input type="text" class="form-control" name="costoGiornaliero" id="costoGiornaliero"></td>' +
                            '<td><input type="text" class="form-control" name="passeggeri" id="passeggeri"></td>' +
                            '<td><input type="text" class="form-control" name="porte" id="porte"></td>' +
                            '<td><input type="text" class="form-control" name="bagagli" id="bagagli"></td>' +
                            '<td><input type="file" class="form-control" name="image" id="image"></td>' +
                            '<td>' + actions + '</td>' +
                            '</tr>';
                        $("table").append(row);
                        $("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
                        $('[data-toggle="tooltip"]').tooltip();
                        $(this).parents("tr").find("td:not(:last-child)").each(function(i,el){

                        });
                    });
                    $(document).on("click", ".add", function(){
                        var empty = false;
                        var input = $(this).parents("tr").find('input[type="text"],input[type="file"]');
                        input.each(function(i){
                            let errore="Ci sono errori nei campi: "
                            switch (i){
                                case 0:
                                    if(isNaN($(this).val())){
                                        $(this).addClass("error")
                                        empty = true;
                                        errore+="Id "
                                    }
                                    break;
                                case 1:
                                    break;
                                case 2:
                                    break;
                                case 3:
                                    const regex = new RegExp('[A-Z]{2}[0-9]{3}[A-Z]{2}$')
                                    if(!regex.test($(this).val())){
                                        $(this).addClass("error")
                                        empty = true;
                                        errore+="Targa "
                                    }
                                    break;
                                case 4:
                                    if(isNaN($(this).val())){
                                        $(this).addClass("error")
                                        empty = true;
                                        errore+="Costo giornaliero "
                                    }
                                    break;
                                case 5:
                                    if(isNaN($(this).val())){
                                        $(this).addClass("error")
                                        empty = true;
                                        errore+="Passeggeri "
                                    }
                                    break;
                                case 6:
                                    if(isNaN($(this).val())){
                                        $(this).addClass("error")
                                        empty = true;
                                        errore+="Porte "
                                    }
                                    break;
                                case 7:
                                    if(isNaN($(this).val())){
                                        $(this).addClass("error")
                                        empty = true;
                                        errore+="Bagagli "
                                    }
                                    break;
                            }
                            if(errore!=="Ci sono errori nei campi: "){
                                alert(errore)
                                return
                            }
                            if(!$(this).val()){
                                $(this).addClass("error");
                                empty = true;
                            } else{
                                $(this).removeClass("error");
                            }
                        });
                        $(this).parents("tr").find(".error").first().focus();
                        if(!empty){
                            var toEdit = []
                            input.each(function(i){
                                $(this).parent("td").html($(this).val());
                                if(i===8){
                                    var file = $(this).val().replace(/^.*[\\\/]/, '')
                                    toEdit.push(file)
                                }else {
                                    toEdit.push($(this).val());
                                }
                            });
                            $.ajax({
                                type: "POST",
                                url: "../AdminServlet",
                                dataType: "json",
                                data: {d:toEdit},
                            });
                            $(this).parents("tr").find(".add, .edit").toggle();
                            $(".add-new").removeAttr("disabled");
                            location.reload()
                        }
                    });
                    $(document).on("click", ".edit", function(){
                        $(this).parents("tr").find("td:not(:last-child)").each(function(i){
                            if(i===8){
                                var file = $(this).val().replace(/^.*[\\\/]/, '')
                                $(this).html('<input type="file" class="form-control" value="'+file+'">');
                            }else {
                                $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
                            }
                        });
                        $(this).parents("tr").find(".add, .edit").toggle();
                        $(".add-new").attr("disabled", "disabled");
                    });
                    $(document).on("click", ".delete", function(){
                        $(this).parents("tr").find("td:not(:last-child)").each(function(i,el){
                            if(i===0){
                                var id = $(this).text()
                                $.ajax({
                                    type: "get",
                                    url: "../AdminServlet",
                                    data: {id:id}
                                });
                            }
                        });
                        $(this).parents("tr").remove();
                        $(".add-new").removeAttr("disabled");
                    });
                });
            </script>
        <h6 style="color: red;"><%= ServletUtility.getErrorMessage(request) %></h6>
        <h6 style="color: green;"><%= ServletUtility.getSuccessMessage(request)%></h6>
        <div class="container-lg">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-8"><h2>Dettagli <b>Macchine</b></h2></div>
                            <div class="col-sm-4">
                                <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Add New</button>
                            </div>
                        </div>
                    </div>
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>Modello</th>
                            <th>Produttore</th>
                            <th>Targa</th>
                            <th>Costo Giornaliero</th>
                            <th>Passeggeri</th>
                            <th>Porte</th>
                            <th>Bagagli</th>
                            <th>Immagine</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% DbOperations operations = new DbOperations();
                           ArrayList<ArrayList<String>> veicoli = operations.GetVeicoli();
                           for(ArrayList<String> veicolo : veicoli){
                        %>
                        <tr>
                            <td><%=veicolo.get(0)%></td>
                            <td><%=veicolo.get(1)%></td>
                            <td><%=veicolo.get(8)%></td>
                            <td><%=veicolo.get(2)%></td>
                            <td><%=veicolo.get(3)%></td>
                            <td><%=veicolo.get(4)%></td>
                            <td><%=veicolo.get(5)%></td>
                            <td><%=veicolo.get(6)%></td>
                            <td><img src="../carImage/<%=veicolo.get(7)%>" width="100" height="100"></td>
                            <td>
                                <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                            </td>
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