<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <title>Main</title>
           <meta name="viewport" content="width=device-width, initial-scale=1">

            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
            <style>
            body{
             padding: 20px;
              background: url("https://www.luxinombra.net/wp-content/uploads/2018/06/350829-widescreen-website-background-1920x1080-windows-xp.jpg");
            }
            </style>
</head>
<body>
<div class="container-fluid">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand"><spring:message code="label.hospital" /></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link" aria-current="page" href="/"><spring:message code="label.main" /></a>
                <a class="nav-link active" aria-current="page" href="/procedure"><spring:message code="label.procedures" /></a>
      </div>
      <div class="navbar-nav position-absolute top-0 end-0">
       <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
        <div class="btn-group me-2" role="group" aria-label="First group">
           <form>
           <a href="?lang=en" class="btn btn-secondary btn-sm"><spring:message code="label.en" /></a>
           </form>
           <form>
           <a href="?lang=ru" class="btn btn-secondary btn-sm"><spring:message code="label.ru" /></a>
           </form>
        </div>
       <div class="btn-group me-2" role="group" aria-label="Second group">
           <form action="/logout" method="POST">
                 <button type="submit" class="btn btn-secondary btn-sm"><spring:message code="label.signOut" /></button>
           </form>
       </div>
     </div>
      </div>
    </div>
  </div>
</nav>
<div class="container-fluid">
<div class="row">
<div class="col-1">
</div>
<div class="col-5">
 <h3><spring:message code="label.yourProcedures" /></h3>
       <table class="table table-striped">
            <thead>
               <tr>
                 <td><b><spring:message code="label.name" /></b></td>
                 <td><b><spring:message code="label.procedure" /></b></td>
                 <td><b><spring:message code="label.type" /></b></td>
                 <td><b><spring:message code="label.status" /></b></td>
                 <td></td>
               </tr>
           </thead>
            <c:forEach items="${proceduresList}" var="procedures">
                 <form action="doProcedures" method="POST">
                    <tr>
                     <td>${procedures.treatment.patient.name}</td>
                      <td>${procedures.procedureName}</td>
                      <td>${procedures.type}</td>
                      <td>${procedures.status}</td>
                      <input type="hidden" name="procedures_id" value=${procedures.id}>
                      <td><button type="submit" class="btn btn-primary"><spring:message code="label.execute" /></a></button></td>
                    </tr>
                 </form>
    </c:forEach>
     </table>
</div>
<div class="col-6">
</div>
</div>
</div>
</div>
</body>
</html>