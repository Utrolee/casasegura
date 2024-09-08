<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard Administrador - CasaSegura</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: #0d0d0d;
            color: #e0e0e0;
            font-family: 'Roboto', sans-serif;
        }
        .jumbotron {
            background: #1e1e1e;
            color: #00bfff;
        }
        .btn-primary {
            background-color: #00bfff;
            border-color: #00bfff;
        }
        .btn-primary:hover {
            background-color: #009acd;
            border-color: #009acd;
        }
    </style>
</head>
<body>
    <div class="jumbotron text-center">
        <h1 class="display-4">Dashboard Administrador</h1>
        <p class="lead">Administra inmuebles y clientes.</p>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-4">
                <a href="Admin/createInmueble.jsp" class="btn btn-primary btn-block">Crear inmueble</a>
            </div>
            <div class="col-md-4 mb-4">
                <a href="Admin/createCliente.jsp" class="btn btn-primary btn-block">Crear Clientes</a>
            </div>
            <div class="col-md-4 mb-4">
                <a href="Login/logout.jsp" class="btn btn-primary btn-block">Cerrar Sesión</a>
            </div>
        </div>
    </div>
</body>
</html>
