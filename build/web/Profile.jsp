<%-- 
    Document   : Profile
    Created on : 09-May-2024, 10:13:37 am
    Author     : ABHINOOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./calendar-08/calendar-08/css/style.css">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <title>Profile</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="./Profile.css">
        <script src="./Profile.js"></script>

        <!-- Box Icon CSS -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>

    <body>
        <div class="container-fluid">

            <!-- --------------NAVIGATION BAR-------------------------------- -->
            <nav class="sidebar close">
                <header>
                    <div class="image-text">
                        <span class="image">
                            <!-- <img src="logo.png" alt="logo"> -->
                        </span>

                        <div class="text header-text">
                            <span class="name">BrainWave Bazaar</span>
                            <!--<span class="profession">&nbsp;</span>-->
                        </div>
                    </div>

                    <!-- <i class='bx bx-chevron-right toggle'></i> -->
                </header>

                <div class="menu-bar">
                    <div class="menu">
                        <li class="search-box">
                            <i class='bx bx-search-alt icon'></i>
                            <input type="search" placeholder="Search...">
                        </li>
                        <ul class="menu-links" style="padding: 0rem;">
                            <li class="nav-link">
                                <a href="#">
                                    <i class='bx bx-home-alt icon'></i>
                                    <span class="text nav-text">Dashboard</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="./UploadNotes.jsp">
                                    <i class='bx bx-upload icon'></i>
                                    <span class="text nav-text">Upload Notes</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="./">
                                    <i class='bx bx-book-reader icon'></i>
                                    <span class="text nav-text">Read Notes</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="#">
                                    <i class='bx bx-category-alt icon'></i>
                                    <span class="text nav-text">My Notes</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="#">
                                    <i class='bx bxs-face icon'></i>
                                    <span class="text nav-text">Profile</span>
                                </a>
                            </li>
                        </ul>
                    </div>

                    <div class="bottom-content">
                        <li class="">
                            <a href="./">
                                <i class='bx bx-log-out icon'></i>
                                <span class="text nav-text">Logout</span>
                            </a>
                        </li>

                    </div>
                </div>
            </nav>

            <!-- ------------------------------------------------------------ -->

            <div class="form-container">
                <form>
                    <h1 style="margin-bottom: 4.7%;">Profile</h1>

                    <table>


                        <tr>
                            <td><label for="name" class="form-label">Name</label></td>
                            <td>
                                <%
                                    String url_db = "jdbc:mysql://localhost:3306/notes_organization_system";
                                    String username_db = "root";
                                    String password_db = "Biotechnology08";

                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection connection = DriverManager.getConnection(url_db, username_db, password_db);
                                        String query = "select * from users where username = ?";
                                        PreparedStatement statement = connection.prepareStatement(query);
                                        statement.setString(1, (String) session.getAttribute("username"));
                                        ResultSet resultSet = statement.executeQuery();

                                        if (resultSet.next()) {
                                            String name = resultSet.getString("name");
                                            out.println("<p id='name' name='name'>" + name + "</p>");
                                        } else {
                                            out.println("Please Login again!");
                                        }
                                    } catch (Exception e) {
                                        out.println("Error: " + e.getMessage());
                                    }
                                %>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="username" class="form-label">User Name</label></td>
                            <td>
                                <%
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection connection = DriverManager.getConnection(url_db, username_db, password_db);
                                        String query = "select * from users where username = ?";
                                        PreparedStatement statement = connection.prepareStatement(query);
                                        statement.setString(1, (String) session.getAttribute("username"));
                                        ResultSet resultSet = statement.executeQuery();

                                        if (resultSet.next()) {
                                            String username = resultSet.getString("username");
                                            System.out.println(username);
                                            out.println("<p id='username' name='username'>" + username + "</p>");
                                        } else {
                                            out.println("Please Login again!");
                                        }
                                    } catch (Exception e) {
                                        out.println("Error: " + e.getMessage());
                                    }

                                %>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="changePassword" class="form-label">Change Password?</label></td>
                            <td>
                                <input type="password" id="currentPassword" name="currentPassword" placeholder="Current Password" class="form-control">
                                <br>
                                <input type="password" id="newPassword" name="newPassword" placeholder="New Password" class="form-control">
                                <br>
                                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm New Password" class="form-control">
                                <br>
                                <button type="submit" class="btn btn-primary">Change Password</button>
                                <br>
                                <%                        
                                    String currentPassword = request.getParameter("currentPassword");
                                    String newPassword = request.getParameter("newPassword");
                                    String confirmPassword = request.getParameter("confirmPassword");

                                    if (newPassword != null && confirmPassword != null && newPassword.equals(confirmPassword)) {
                                        try {
                                            Class.forName("com.mysql.cj.jdbc.Driver");
                                            Connection connection = DriverManager.getConnection(url_db, username_db, password_db);

                                            String query = "select * from users where username = ? and password = ?";

                                            PreparedStatement statement = connection.prepareStatement(query);
                                            statement.setString(1, (String) session.getAttribute("username"));
                                            statement.setString(2, currentPassword);

                                            ResultSet resultSet = statement.executeQuery();

                                            if (resultSet.next()) {
                                                String updateQuery = "UPDATE users SET password = ? WHERE username = ?";
                                                PreparedStatement updateStatement = connection.prepareStatement(updateQuery);
                                                updateStatement.setString(1, newPassword);
                                                updateStatement.setString(2, (String) session.getAttribute("username"));
                                                updateStatement.executeUpdate();

                                                out.println("Password changed successfully!");
                                            } else {
                                                out.println("Current password is incorrect!");
                                            }
                                        } catch (Exception e) {
                                            out.println("Error: " + e.getMessage());
                                        }
                                    }
//                            else if(newPassword.equals(confirmPassword)){
//                                out.println("<script>alert('New password and confirm new password do not match!')</script>");
//                            }


                                %>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

        </div>
    </body>

</html>
