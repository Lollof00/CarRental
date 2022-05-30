<%@ page import="DB.DbOperations" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>PHPJabbers.com | Free Car Rental Website Template</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <style>
        .table-wrapper {
            width: 1000px;
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
            table-layout: fixed;
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
            height: 32px;
            line-height: 32px;
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
                    <li><a href="#"><i class="fa fa-envelope"></i>contact@company.com</a></li>
                    <li><a href="#"><i class="fa fa-phone"></i>123-456-7890</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <ul class="right-icons">
                    <li><a href="#">Registra nuovo Admin</a></li>
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
        <script>
                $(document).ready(function(){
                    $('[data-toggle="tooltip"]').tooltip();
                    var actions = $("table td:last-child").html();
                    // Append table with add row form on add new button click
                    $(".add-new").click(function(){
                        $(this).attr("disabled", "disabled");
                        var index = $("table tbody tr:last-child").index();
                        var row = '<tr>' +
                            '<td><input type="text" class="form-control" name="id" id="id"></td>' +
                            '<td><input type="text" class="form-control" name="modello" id="modello"></td>' +
                            '<td><input type="text" class="form-control" name="produttore" id="produttore"></td>' +
                            '<td><input type="text" class="form-control" name="targa" id="targa"></td>' +
                            '<td><input type="text" class="form-control" name="costoGiornaliero" id="costoGiornaliero"></td>' +
                            '<td><input type="text" class="form-control" name="passeggeri" id="passeggeri"></td>' +
                            '<td><input type="text" class="form-control" name="porte" id="porte"></td>' +
                            '<td><input type="text" class="form-control" name="bagagli" id="bagagli"></td>' +
                            '<td>' + actions + '</td>' +
                            '</tr>';
                        $("table").append(row);
                        $("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
                        $('[data-toggle="tooltip"]').tooltip();
                    });
                    // Add row on add button click
                    $(document).on("click", ".add", function(){
                        var empty = false;
                        var input = $(this).parents("tr").find('input[type="text"]');
                        input.each(function(){
                            if(!$(this).val()){
                                $(this).addClass("error");
                                empty = true;
                            } else{
                                $(this).removeClass("error");
                            }
                        });
                        $(this).parents("tr").find(".error").first().focus();
                        if(!empty){
                            input.each(function(){
                                $(this).parent("td").html($(this).val());
                            });
                            $(this).parents("tr").find(".add, .edit").toggle();
                            $(".add-new").removeAttr("disabled");
                        }
                    });
                    // Edit row on edit button click
                    $(document).on("click", ".edit", function(){
                        $(this).parents("tr").find("td:not(:last-child)").each(function(){
                            $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
                        });
                        $(this).parents("tr").find(".add, .edit").toggle();
                        $(".add-new").attr("disabled", "disabled");
                    });
                    // Delete row on delete button click
                    $(document).on("click", ".delete", function(){
                        $(this).parents("tr").remove();
                        $(".add-new").removeAttr("disabled");
                    });
                });
            </script>
        <div class="container-lg">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-8"><h2>Employee <b>Details</b></h2></div>
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
                            <td><%=veicolo.get(2)%></td>
                            <td><%=veicolo.get(3)%></td>
                            <td><%=veicolo.get(4)%></td>
                            <td><%=veicolo.get(5)%></td>
                            <td><%=veicolo.get(6)%></td>
                            <td><%=veicolo.get(7)%></td>
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

<!-- Footer Starts Here -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-3 footer-item">
                <h4>Car Rental Website</h4>
                <p>Vivamus tellus mi. Nulla ne cursus elit,vulputate. Sed ne cursus augue hasellus lacinia sapien vitae.</p>
                <ul class="social-icons">
                    <li><a rel="nofollow" href="#" target="_blank"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                </ul>
            </div>
            <div class="col-md-3 footer-item">
                <h4>Useful Links</h4>
                <ul class="menu-list">
                    <li><a href="#">Vivamus ut tellus mi</a></li>
                    <li><a href="#">Nulla nec cursus elit</a></li>
                    <li><a href="#">Vulputate sed nec</a></li>
                    <li><a href="#">Cursus augue hasellus</a></li>
                    <li><a href="#">Lacinia ac sapien</a></li>
                </ul>
            </div>
            <div class="col-md-3 footer-item">
                <h4>Additional Pages</h4>
                <ul class="menu-list">
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Blog</a></li>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">Terms</a></li>
                </ul>
            </div>
            <div class="col-md-3 footer-item last-item">
                <h4>Contact Us</h4>
                <div class="contact-form">
                    <form id="contact footer-contact" action="" method="post">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <fieldset>
                                    <input name="name" type="text" class="form-control" id="name" placeholder="Full Name" required="">
                                </fieldset>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <fieldset>
                                    <input name="email" type="text" class="form-control" id="email" pattern="[^ @]*@[^ @]*" placeholder="E-Mail Address" required="">
                                </fieldset>
                            </div>
                            <div class="col-lg-12">
                                <fieldset>
                                    <textarea name="message" rows="6" class="form-control" id="message" placeholder="Your Message" required=""></textarea>
                                </fieldset>
                            </div>
                            <div class="col-lg-12">
                                <fieldset>
                                    <button type="submit" id="form-submit" class="filled-button">Send Message</button>
                                </fieldset>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</footer>

<div class="sub-footer">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <p>
                    Copyright © 2020 Company Name
                    - Template by: <a href="https://www.phpjabbers.com/">PHPJabbers.com</a>
                </p>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-top: 70px;">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Book Now</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="#" id="contact">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <fieldset>
                                    <input type="text" class="form-control" placeholder="Pick-up location" required="">
                                </fieldset>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <fieldset>
                                    <input type="text" class="form-control" placeholder="Return location" required="">
                                </fieldset>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <fieldset>
                                    <input type="text" class="form-control" placeholder="Pick-up date/time" required="">
                                </fieldset>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <fieldset>
                                    <input type="text" class="form-control" placeholder="Return date/time" required="">
                                </fieldset>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <fieldset>
                            <input type="text" class="form-control" placeholder="Enter full name" required="">
                        </fieldset>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <fieldset>
                                    <input type="text" class="form-control" placeholder="Enter email address" required="">
                                </fieldset>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <fieldset>
                                    <input type="text" class="form-control" placeholder="Enter phone" required="">
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary">Book Now</button>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Additional Scripts -->
<script src="assets/js/custom.js"></script>
<script src="assets/js/owl.js"></script>
<script src="assets/js/slick.js"></script>
<script src="assets/js/accordions.js"></script>


</body>
</html>