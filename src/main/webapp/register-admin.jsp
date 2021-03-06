
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
  <title>Registrazione Admin</title>


  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

  <link rel="stylesheet" type="text/css" href="css/register.css">
</head>
<body>
<div class="container">
  <div class="d-flex justify-content-center h-100">
    <div class="card">
      <div class="card-header">
        <h3>Registra nuovo Admin</h3>
      </div>
      <div class="card-body">
        <form method="post" action="registrazione">
          <div class="input-group form-group">
            <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-user"></i></span>
            </div>
            <input type="text" class="form-control" name="nome" placeholder="nome" required>
          </div>
          <div class="input-group form-group">
            <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-user"></i></span>
            </div>
            <input type="text" class="form-control" name="cognome" placeholder="cognome" required>
          </div>
          <div class="input-group form-group">
            <div class="input-group-prepend">
              <span class="input-group-text"><i class="fa-solid fa-box-archive"></i></span>
            </div>
            <input type="text" class="form-control" name="cf" placeholder="codice fiscale" size="16" maxlength="16" required>
          </div>
          <div class="input-group form-group">
            <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
            </div>
            <input type="date" class="form-control" name="nascita" value="nascita" required>
          </div>
          <div class="input-group form-group">
            <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-envelope"></i></span>
            </div>
            <input type="email" class="form-control" name="email" placeholder="email" required>
          </div>
          <div class="input-group form-group">
            <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-user"></i></span>
            </div>
            <input type="text" class="form-control" name="username" placeholder="username" required>
          </div>

          <div class="input-group form-group">
            <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-key"></i></span>
            </div>
            <input type="password" class="form-control" name="password" placeholder="password" required>
          </div>
          <input type="hidden" value="" name="Path" id="path"/>
          <div class="form-group">
            <input type="submit" value="Registrati" class="btn float-right login_btn">
          </div>
        </form>
      </div>
      <div class="card-footer">
        <div class="d-flex justify-content-center">
          <a href="admin/admin-page.jsp">Torna all'Admin Page</a>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
<script>
  document.getElementById("path").setAttribute("value",window.location.href)
</script>
</html>