<%-- 
    Document   : ReadNotes
    Created on : 10-May-2024, 3:51:49 pm
    Author     : ABHINOOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Read Notes</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <!-- <link rel="stylesheet" href="./calendar-08/calendar-08/css/style.css"> -->

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/style.css">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Custom CSS and JS File -->
        <link rel="stylesheet" href="./ReadNotes.css">
        <!--<script src="./ReadNotes.js"></script>-->

        <!-- Box Icon CSS -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <div class="container-fluid">

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
<!--                        <li class="search-box">
                            <i class='bx bx-search-alt icon'></i>
                            <input type="search" placeholder="Search...">
                        </li>-->
                        <ul class="menu-links" style="padding: 0rem;">
                            <li class="nav-link">
                                <a href="./dashboard.jps">
                                    <i class='bx bx-home-alt icon'></i>
                                    <span class="text nav-text">Dashboard</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="./WriteNotes.jsp">
                                    <i class='bx bx-pen icon'></i>
                                    <span class="text nav-text">Write Notes</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="./UploadNotesNew.jsp">
                                    <i class='bx bx-upload icon'></i>
                                    <span class="text nav-text">Upload Notes</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="./ReadNotes.jsp">
                                    <i class='bx bx-book-reader icon'></i>
                                    <span class="text nav-text">Read Notes</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="./Profile.jsp">
                                    <i class='bx bxs-face icon'></i>
                                    <span class="text nav-text">Profile</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="./AboutUs.html">
                                    <i class='bx bx-group icon'></i>
                                    <span class="text nav-text">About Us</span>
                                </a>
                            </li>
                        </ul>
                    </div>

                    <div class="bottom-content">
                        <li class="">
                            <a href="./index.html">
                                <i class='bx bx-log-out icon'></i>
                                <span class="text nav-text">Logout</span>
                            </a>
                        </li>

                    </div>
                </div>
            </nav>

            <!-- ------------------------------------------------------------ -->
            
            <div class="form-container">
                <form action="ReadNotes.jsp">
                    <h1 style="margin-bottom: 4.7%;">Read Notes</h1>

                    <div class="row mb-4">
                        <div class="mb-6 col-4 ">
                            <label for="category" class="form-label">Category</label>
                            <select class="form-select" id="category" name="category">
                                <option value="category1">--select--</option>
                                <%
                                    // Connect Database
                                    String url_db = "jdbc:mysql://localhost:3306/notes_organization_system";
                                    String username_db = "root";
                                    String password_db = "Biotechnology08";

                                    String select_sql = "select category_name from categories";

                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection con = DriverManager.getConnection(url_db, username_db, password_db);
                                        PreparedStatement stm = con.prepareStatement(select_sql);

                                        ResultSet resultSet = stm.executeQuery();

                                        while (resultSet.next()) {
                                            String categoryName = resultSet.getString("category_name");
                                            out.println("<option value=\"" + categoryName + "\">" + categoryName + "</option>");
                                        }

                                    } catch (Exception e) {
                                        out.println("<option value=\"\">Error fetching categories</option>");
                                        e.printStackTrace();
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                            <button type="submit" class="btn btn-primary">View Notes</button>
                    <div class="row mb-4 col-12" id="notesSection" style="background-color: white;">
                        <%
                            String category_name = request.getParameter("category");
                            session.setAttribute("selectedCategory", category_name);

                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection(url_db, username_db, password_db);
                                PreparedStatement stm = con.prepareStatement("SELECT * FROM notes WHERE category_name = ?");
                                stm.setString(1, category_name);
                                ResultSet resultSet = stm.executeQuery();

                                while (resultSet.next()) {
                                    String title = resultSet.getString("title");
                                    String content = resultSet.getString("content");

                                    out.println("<a href='./ViewNotes.jsp?title=" + URLEncoder.encode(title, "UTF-8") + "&content=" + URLEncoder.encode(content, "UTF-8") + "' target='_blank'><h5>" + title + "</h5></a>");
                                    out.println("<hr>");
                                }

                            } catch (Exception e) {
                                out.println("Error fetching notes: " + e.getMessage());
                                e.printStackTrace();
                            }
                        %>
                    </div>

                </form>

            </div>


        </div>
    </body>
</html>
