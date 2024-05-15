<%-- 
    Document   : LoginController
    Created on : 03-May-2024, 10:37:56 am
    Author     : ABHINOOR
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LoginController</title>
    </head>
    <body>
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            //Connect Database
            String url_db = "jdbc:mysql://localhost:3306/notes_organization_system";
            String username_db = "root";
            String password_db = "Biotechnology08";

            String select_sql = "select * from users where username = ? and password = ?";
            boolean isAuthenticated = false;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(url_db, username_db, password_db);
                PreparedStatement stm = con.prepareStatement(select_sql);

                stm.setString(1, username);
                stm.setString(2, password);

                ResultSet rs = stm.executeQuery();
                String pass = "";
                if(username.equals("admin") && password.equals("qwerty12345")){
                    response.sendRedirect("admin.jsp");
                }
                else if (rs.next()) {
                    session.setAttribute("username", username);
                    
                    pass = rs.getString(4);
                    int count = rs.getInt(1);
                    if (count > 0) {
                        response.sendRedirect("dashboard.jsp?username=" + username);

                    }

                } else if (password != pass) {
                    response.sendRedirect("login.html");
                }

                
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

        %>    


    </body>
</html>
