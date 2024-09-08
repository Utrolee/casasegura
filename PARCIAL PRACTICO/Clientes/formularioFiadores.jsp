<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulario de Fiadores</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: #1e1e1e;
            color: #e0e0e0;
            font-family: 'Roboto', sans-serif;
        }
        .container {
            max-width: 600px;
            margin: 5rem auto;
            background: #2c2c2c;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.7);
        }
        h1 {
            color: #00bfff;
            margin-bottom: 1.5rem;
            text-align: center;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 0.5rem;
        }
        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1rem;
            border: 1px solid #444;
            border-radius: 0.25rem;
            background: #333;
            color: #e0e0e0;
        }
        input[type="submit"] {
            width: 100%;
            padding: 0.75rem;
            background-color: #00bfff;
            border: none;
            border-radius: 0.25rem;
            color: #000;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #009acd;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Formulario de Fiadores</h1>
        <form action="cliente" method="post">
            <div class="form-group">
                <label for="fiadorName">Nombre del Fiador:</label>
                <input type="text" id="fiadorName" name="fiadorName" required />
            </div>
            <div class="form-group">
                <label for="fiadorEmail">Correo Electrónico del Fiador:</label>
                <input type="email" id="fiadorEmail" name="fiadorEmail" required />
            </div>
            <input type="submit" value="Enviar" />
        </form>
    </div>
</body>
</html>
