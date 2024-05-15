<%-- 
    Document   : SignUpJSP
    Created on : 2 May, 2024, 3:52:42 PM
    Author     : ABHINOOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SignUpController</title>
    </head>
    <body>
        <%
            String name = request.getParameter("name");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");

            //Connect Database
            String url_db = "jdbc:mysql://localhost:3306/notes_organization_system";
            String username_db = "root";
            String password_db = "Biotechnology08";

            String insert_sql = "insert into `users`(`name`,`username`,`password`)values(?,?,?)";
            int result = 0;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(url_db, username_db, password_db);
                PreparedStatement stm = con.prepareStatement(insert_sql);
                stm.setString(1, name);
                stm.setString(2, username);
                stm.setString(3, password);

                result = stm.executeUpdate();
                
                // redirection
                if (result > 0) {
//                    System.out.println(username);
                    session.setAttribute("username", username);
                    session.setAttribute("name", name);
                    response.sendRedirect("dashboard.jsp");
                } else {
//                       System.out.println(username);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("Login.html");
                    dispatcher.forward(request, response);
                }
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

            
//            out.println("<h1>Name: " + name + "</h1>");
//            out.println("<h2>Username: " + username + "</h2>");
//            out.println("<p>Password: " + password + "</p>");
        %>
    </body>
</html>
