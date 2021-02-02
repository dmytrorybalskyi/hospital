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

<form action="/logout" method="POST">
   <button type="submit"><spring:message code="label.signOut" /></button>
</form>

<form action="/appointment" method="POST">
   <select class="selectpicker form-control form-select-button" name="category" required>
            <c:forEach items="${categories}" var="category">
                <option value="${category.id}">${category.name}</option>
            </c:forEach>
        </select>
        <button type="submit"><spring:message code="label.appointment"/></button>
              <c:if test="${appointment==true}">
                    <p><spring:message code="label.appointmentExist" /></p>
              </c:if>
</form>

         <table class="table">
              <thead>
              <tr>
                  <td><b>Name</b></td>
                  <td><b>type</b></td>
                  <td>Status</td>
                  <td></td>
              </tr>
              </thead>
                     <c:forEach items="${proceduresList}" var="procedures">
                     <form action="doProcedures" method="POST">
                      <tr>
                      <td>${procedures.procedureName}</td>
                      <td>${procedures.type.name}</td>
                      <td>${procedures.status.name}</td>
                      </tr>
                      </form>
                       </c:forEach>
          </table>
</body>
</html>