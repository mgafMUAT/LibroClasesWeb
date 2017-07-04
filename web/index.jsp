<%-- 
    Document   : index.jsp
    Created on : 07-06-2017, 13:53:45
    Author     : MauricioGabriel
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestor Libro de Clases</title>
        <style>
            body {
                text-align: center
            }
        </style>
    </head>
    <body>
        <h1>Bienvenido(a)</h1>
        <p>Escoja su institución y curso</p>
        <form name="seleccion" action="getcurso" method="post">
            <select name="colegio">
                <c:forEach items="<%=orm.InstitucionDAO.listInstitucionByQuery(null, null)%>" var="col">
                    <option value="${col.id}" label="${col.nombre}" selected>${col.id}</option>
                </c:forEach>
            </select>
            <p></p>
            <select name="nivel">
                <c:forEach begin="1" end="8" var="i">
                    <option label="${i}">${i}</option>
                </c:forEach>
            </select>
            <select name="letra">
                <option label="A">A</option><option label="B">B</option>
            </select>
            <input type="submit" value="Cargar"/>
            <input type="hidden" name="accion" value="carga" />
        </form>
    </body>
</html>
