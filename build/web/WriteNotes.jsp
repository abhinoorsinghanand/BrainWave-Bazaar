<%-- 
    Document   : WriteNotes
    Created on : 10-May-2024, 1:48:02 pm
    Author     : ABHINOOR
--%>

<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Upload Notes</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./calendar-08/calendar-08/css/style.css">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="./UploadNotes.css">

        <!-- Box Icon CSS -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <!-- CKEditor CDN link -->
        <script src="https://cdn.ckeditor.com/ckeditor5/41.3.1/classic/ckeditor.js"></script>

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
                        <ul class="menu-links" style="padding: 0rem;">
                            <li class="nav-link">
                                <a href="./Dashboard.jps">
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

            <!-- ------------------------------------------------------------- -->

            <form method="post" action="WriteNotes.jsp">
                <h1 style="margin-bottom: 4.7%;">Write Notes</h1>

                <div class="row mb-4">
                    <div class="mb-6 col-6 ">
                        <label for="caetgory" class="form-label">Category</label>
                        <select class="form-select" id="category" name="category">
                            <option value="category1">--select--</option>
                            <!--Options will be added dynamically here from the database-->
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
                            <!-- Add more categories from admin.jsp -->
                        </select>
                    </div>
                    <div class="mb-6 col-6">
                        <label for="title" class="form-label">Title of the file</label>
                        <input type="text" class="form-control" id="title" name="title">
                    </div>
                </div>
                <div id="writeSection" class="mb-6">
                    <textarea name="content" id="write" cols="30" rows="10"></textarea>
                    <!-- Code for CK Editor -->
                    <script>
                        ClassicEditor
                                .create(document.querySelector('#write'))
                                .then(editor => {
                                    console.log(editor);
                                })
                                .catch(error => {
                                    console.error(error);
                                });
                    </script>

                </div>
                <div class="mb-4">
                    <button type="submit" class="btn btn-primary" style="margin-top: 20px">Submit</button>
                </div>
                <%
//                    String username = (String) session.getAttribute("username");
                    String category_name = request.getParameter("category");
                    String title = request.getParameter("title");
                    String content = request.getParameter("content");

                    String insert_sql = "INSERT INTO `notes` (`category_name`, `title`, `content`) VALUES (?, ?, ?)";
                    int result = 0;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection(url_db, username_db, password_db);
                        PreparedStatement stm = con.prepareStatement(insert_sql);

                        stm.setString(1, category_name);
                        stm.setString(2, title);
                        stm.setString(3, content);
//                        stm.setString(4, username);

                        result = stm.executeUpdate();

                        if (result > 0) {
                            out.println("<br>Submission successful!");
                        } else {
                            out.println("<br>Failure");
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </form>


        </div>
    </body>
</html>
