<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <title>Main</title>
</head>
<body>

<p><spring:message code="label.hello"/> ${login}
<span style="float: right">
    <a href="?lang=en">en</a>
    |
    <a href="?lang=ru">ru</a>
</span>

 <p><a href="/addDoctor"><spring:message code="label.addNewDoctor"/></a></p>

    <table class="table">
         <thead>
         <tr>
             <td><b>Name</b></td>
             <td><b>Category</b></td>
             <td></td>
             <td></td>
         </tr>
         </thead>
         <c:forEach items="${treatments}" var="treatment">
             <tr>
                 <td>${treatment.patient.name}</td>
                 <td>${treatment.category.name}</td>
                 <td><button type="submit"><a href="/treatment/${treatment.id}">set</a></button></td>
             </tr>
         </form>
         </c:forEach>
     </table>

     <p>${doctor}</p>

<form action="/logout" method="POST">
     <button type="submit"><spring:message code="label.signOut" /></button>
</form>
</body>
</html>