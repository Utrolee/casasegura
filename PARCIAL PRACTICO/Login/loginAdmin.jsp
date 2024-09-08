<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String errorMessage = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Verificar credenciales
        try {
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/tu_base_de_datos", "usuario", "contraseña");
            String sql = "SELECT * FROM administradores WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("admin", username);
                response.sendRedirect("admin/dashboard.jsp"); // Redirige al dashboard del administrador
            } else {
                errorMessage = "Credenciales incorrectas.";
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            errorMessage = "Error en el sistema. Por favor, intente más tarde.";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Administrador - CasaSegura</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: #0d0d0d;
            color: #e0e0e0;
            font-family: 'Roboto', sans-serif;
        }
        .login-container {
            max-width: 500px;
            margin: 5rem auto;
            background: #1e1e1e;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.7);
        }
        .login-container h2 {
            margin-bottom: 1.5rem;
            color: #00bfff;
        }
        .btn-primary {
            background-color: #00bfff;
            border-color: #00bfff;
            color: #000;
        }
        .btn-primary:hover {
            background-color: #009acd;
            border-color: #009acd;
            color: #fff;
        }
        .alert-danger {
            margin-top: 1rem;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2 class="text-center">Login Administrador</h2>
        <form method="post">
            <div class="form-group">
                <label for="username">Nombre de Usuario:</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Contraseña:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Iniciar Sesión</button>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger mt-2" role="alert">
                    <c:out value="${errorMessage}" />
                </div>
            </c:if>
        </form>
    </div>
</body>
</html>
