<%-- 
    Document   : alumnos
    Created on : 20-06-2017, 0:07:09
    Author     : MauricioGabriel
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestor Libreo de Clases</title>
        <style>
            body {
                text-align: center
            }
            table {
                border-collapse: collapse;
                margin: 0px auto
            }
            th, td {
                border-style: solid
            }
            #link {
                color: navy
            }
            #link:hover {
                color: cyan
            }
        </style>
    </head>
    <body>
        <h1>Alumnos del ${curso}</h1>
        <table>
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Matrícula</th>
                    <th>Apoderado</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${alumnos}" var="al">
                    <tr>
                        <td>${al.persona_id_fk.nombre}</td>
                        <td>${al.matricula}</td>
                        <td>${al.apoderado_id_fk.persona_id_fk.nombre}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <h3><a href="getalumno" id="link">Agregar Alumno...</a></h3>
    </body>
</html>
