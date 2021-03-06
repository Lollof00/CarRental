<%@page import="Utility.ServletUtility" %>
<!DOCTYPE html>
<html>
<head>
  <title>Forgot Password</title>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

  <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<main class="login">
  <div class="container">
    <div class="d-flex justify-content-center h-100">
      <div class="card">
        <div class="card-header">
          <h3>Hai dimenticato la password?</h3>
        </div>
        <div class="card-body">
          <form method="post" action="ForgetPassword">
            <div class="input-group form-group">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
              </div>
              <input type="text" class="form-control" name="email" placeholder="inserisci l'email">
            </div>
            <div class="form-group">
              <input type="submit" value="Ripristina" class="btn float-right login_btn">
            </div>
          </form>
          <h6 style="color: red;"><%= ServletUtility.getErrorMessage(request) %></h6>
          <h6 style="color: green;"><%= ServletUtility.getSuccessMessage(request)%></h6>
        </div>
      </div>
    </div>
  </div>
</main>
</body>
</html>