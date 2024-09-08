<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inmuebles</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: #1e1e1e;
            color: #e0e0e0;
            font-family: 'Roboto', sans-serif;
        }
        .container {
            max-width: 900px;
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
        table {
            width: 100%;
            margin-bottom: 1.5rem;
            border-collapse: collapse;
        }
        th, td {
            padding: 0.75rem;
            text-align: left;
            border-bottom: 1px solid #444;
        }
        th {
            background: #333;
            color: #00bfff;
        }
        tr:nth-child(even) {
            background: #2c2c2c;
        }
        tr:hover {
            background: #3a3a3a;
        }
        a {
            color: #00bfff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Listado de Inmuebles</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Dirección</th>
                    <th>Precio</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    
                    try {
                        // Establecer conexión con PostgreSQL
                        Class.forName("org.postgresql.Driver");
                        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/tu_base_de_datos", "usuario", "contraseña");

                        // Crear y ejecutar consulta
                        stmt = conn.createStatement();
                        String sql = "SELECT id, name, address, price FROM inmuebles";
                        rs = stmt.executeQuery(sql);
                        
                        // Mostrar datos
                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String name = rs.getString("name");
                            String address = rs.getString("address");
                            double price = rs.getDouble("price");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= name %></td>
                    <td><%= address %></td>
                    <td><%= price %></td>
                </tr>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // Cerrar recursos
                        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
