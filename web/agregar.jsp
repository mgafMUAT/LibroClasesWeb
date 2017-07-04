<%-- 
    Document   : agregar
    Created on : 21-06-2017, 12:34:21
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
            table {
                margin: 0px auto
            }
        </style>
    </head>
    <body>
        <h1>Agregar Nuevo Alumno</h1>
        <form action="getcurso">
            <table>
                <tr>
                    <th></th><th>Alumno:</th>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" name="nombre" size="30" /></td>
                </tr>
                <tr>
                    <td>Rut:</td>
                    <td><input type="text" name="rut" size="30" /></td>
                </tr>
                <tr>
                    <td>Año de ingreso:</td>
                    <td>
                        <select name="agnoingreso">
                            <option value="2017">2017</option>
                            <option value="2018">2018</option>
                            <option value="2019">2019</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th></th><th>Apoderado:</th>
                </tr>
                <tr>
                    <th></th>
                    <th>
                        <input type="radio" name="apod" value="nuevo" />
                        Apoderado nuevo
                    </th>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" name="nomAp" size="30" /></td>
                </tr>
                <tr>
                    <td>Rut:</td>
                    <td><input type="text" name="rutAp" size="30" /></td>
                </tr>
                <c:if test="${not empty apods}">
                    <tr>
                        <th></th>
                        <th>
                            <input type="radio" name="apod" value="existe" />
                            Apoderado ya registrado
                        </th>
                    </tr>
                    <tr>
                        <th></th>
                        <th>
                            <select name="apodExiste">
                                <c:forEach items="${apods}" var="apod">
                                    <option value="${apod.id}" label="${apod.persona_id_fk.nombre}">
                                        ${apod.persona_id_fk.nombre}
                                    </option>
                                </c:forEach>
                            </select>
                        </th>
                    </tr>
                </c:if>
            </table>
            <input type="submit" value="Agregar" />
            <input type="hidden" name="accion" value="agrega" />
        </form>
    </body>
</html>
