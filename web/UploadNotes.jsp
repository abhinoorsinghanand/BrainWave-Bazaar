<%-- 
    Document   : UploadNotes
    Created on : 07-May-2024, 7:35:28 pm
    Author     : ABHINOOR
--%>

<%@page contentType="text/html" language="java" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.InputStream" %>
<%@page import="java.io.ByteArrayOutputStream" %>
<%@page import="javax.servlet.http.Part" %>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.annotation.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="java.util.*" %>
<%@page import="java.nio.*" %>
<%@page import="java.nio.file.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>
<%@page import="java.io.IOException" %>
<%@page import="java.sql.Blob" %>
<%@page import="java.io.*, java.sql.*" %>


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
        <script src="./UploadNotes.js"></script>

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
                            <!--                        <span class="profession">Student</span>-->
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
                                <a href="./dashboard.html">
                                    <i class='bx bx-home-alt icon'></i>
                                    <span class="text nav-text">Dashboard</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="#">
                                    <i class='bx bx-upload alt icon'></i>
                                    <span class="text nav-text">Upload Notes</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="#">
                                    <i class='bx bx-home-alt icon'></i>
                                    <span class="text nav-text">Dashboard</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="#">
                                    <i class='bx bx-home-alt icon'></i>
                                    <span class="text nav-text">Dashboard</span>
                                </a>
                            </li>
                            <li class="nav-link">
                                <a href="#">
                                    <i class='bx bx-home-alt icon'></i>
                                    <span class="text nav-text">Dashboard</span>
                                </a>
                            </li>
                        </ul>
                    </div>

                    <div class="bottom-content">
                        <li class="">
                            <a href="#">
                                <i class='bx bx-log-out icon'></i>
                                <span class="text nav-text">Logout</span>
                            </a>
                        </li>

                    </div>
                </div>
            </nav>

            <!-- ------------------------------------------------------------ -->

            <div class="form-container">
                <form method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                    <h1 style="margin-bottom: 4.7%;">Upload Notes</h1>
                    <div class="row mb-4">
                        <div class="mb-6 col-6 ">
                            <label for="caetgory" class="form-label">Category</label>
                            <select class="form-select" id="category">
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
                        <!--                        <div class="mb-6 col-6">
                                                    <label for="note-id" class="form-label">Note ID</label>
                                                    <input type="text" class="form-control" id="note-id" disabled>
                                                </div>-->
                    </div>

                    <div class="row mb-4">
                        <div class="mb-6">
                            <label for="title" class="form-label">Title of the file</label>
                            <input type="text" class="form-control" id="title">
                        </div>

                        <!--                        <div class="mb-6 col-6">
                                                    <label for="tags" class="form-label input-group">Add Tags</label>
                                                    <input type="text" class="form-control" id="tags">
                                                </div>-->
                    </div>

                    <div class="row mb-4">
                        <div class="mb-3">
                            <label class="form-label">Upload or Write Notes?</label>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="notesOption" id="uploadNotes"
                                       onclick="showUploadSection()">
                                <label class="form-check-label" for="uploadNotes" style="font-weight: 400;"> Upload Notes </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="notesOption" id="writeNotes"
                                       onclick="showWriteSection()">
                                <label class="form-check-label" for="writeNotes" style="font-weight: 400;"> Write Notes </label>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div id="uploadSection" style="display: none;">
                            <div class="mb-3">
                                <input class="form-control" type="file" id="fileUpload" name="fileUpload">

                            </div>
                        </div>


                        <div id="writeSection" style="display: none;">
                            <textarea name="write" id="write" cols="30" rows="10"></textarea>
                            <!-- Code for CKEditor -->
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
                    </div>

                    <div class="mb-4">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>


                    <%//                        String category_name = request.getParameter("category");
                        //                        String title = request.getParameter("title");
                        //
                        //                        String savePath = request.getServletContext().getRealPath("/") + "Notes/"; // Change this to your desired path
                        //                        String contentType = request.getContentType();
                        //                        if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
                        //                            DataInputStream in = new DataInputStream(request.getInputStream());
                        //                            int formDataLength = request.getContentLength();
                        //                            byte[] dataBytes = new byte[formDataLength];
                        //                            int byteRead = 0;
                        //                            int totalBytesRead = 0;
                        //                            while (totalBytesRead < formDataLength) {
                        //                                byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                        //                                totalBytesRead += byteRead;
                        //                            }
                        //                            String file = new String(dataBytes);
                        //                            String saveFile = file.substring(file.indexOf("filename=\"") + 10);
                        //                            saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                        //                            saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
                        //                            int lastIndex = contentType.lastIndexOf("=");
                        //                            String boundary = contentType.substring(lastIndex + 1, contentType.length());
                        //                            int pos;
                        //                            pos = file.indexOf("filename=\"");
                        //                            pos = file.indexOf("\n", pos) + 1;
                        //                            pos = file.indexOf("\n", pos) + 1;
                        //                            pos = file.indexOf("\n", pos) + 1;
                        //                            int boundaryLocation = file.indexOf(boundary, pos) - 4;
                        //                            int startPos = ((file.substring(0, pos)).getBytes()).length;
                        //                            int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
                        //                            FileOutputStream fileOut = new FileOutputStream(savePath + "\\" + saveFile);
                        //                            fileOut.write(dataBytes, startPos, (endPos - startPos));
                        //                            fileOut.flush();
                        //                            fileOut.close();
                        //
                        //                            // Save file path to database
                        //                            String filePath = savePath + "\\" + saveFile;
                        //                            try {
                        //                                Class.forName("com.mysql.cj.jdbc.Driver");
                        //                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notes_organization_system", "root", "Biotechnology08");
                        //                                String query = "INSERT INTO notes (title, content, category_name) VALUES (?, ?, ?)";
                        //                                PreparedStatement statement = conn.prepareStatement(query);
                        //                                statement.setString(1, filePath);
                        //                                statement.executeUpdate();
                        //                                statement.close();
                        //                                conn.close();
                        //                                out.println("<h3>PDF file uploaded successfully!</h3>");
                        //                            } catch (Exception e) {
                        //                                e.printStackTrace();
                        //                                out.println("<h3>Error uploading PDF file!</h3>");
                        //                            }

                        //                        try {
                        //                            String category_name = request.getParameter("category");
                        //                            String title = request.getParameter("title");
                        //                            Part filePart = request.getPart("fileUpload");
                        //
                        //                            InputStream inputStream = null;
                        //
                        //                            if (filePart != null) {
                        //                                long fileSize = filePart.getSize();
                        //                                String fileContent = filePart.getContentType();
                        //                                inputStream = filePart.getInputStream();
                        //                            }
                        //
                        //                            Class.forName("com.mysql.cj.jdbc.Driver");
                        //                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notes_organization_system", "root", "Biotechnology08");
                        //                            String query = "INSERT INTO `notes` (`title`, `content`, `category_name`) VALUES (?, ?, ?)";
                        //                            PreparedStatement statement = conn.prepareStatement(query);
                        //                           
                        //                            // Convert InputStream to byte array
                        //                            byte[] fileBytes = inputStream.readAllBytes();
                        //                            ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(fileBytes);
                        //                            statement.setBlob(2, byteArrayInputStream);
                        //                             statement.setString(3, title);
                        //                            statement.setString(7, category_name);
                        //                            int returnCode = statement.executeUpdate();
                        //
                        //                            if (returnCode == 0) {
                        //                                request.setAttribute("Message", "Error inserting file!");
                        //                            } else {
                        //                                request.setAttribute("Message", "Notes uploaded successfully!");
                        //
                        //                            }
                        //                        } catch (Exception e) {
                        //                            e.printStackTrace();
                        //                        }
                        String url_db_one = "jdbc:mysql://localhost:3306/notes_organization_system";
                        String username_db_one = "root";
                        String password_db_one = "Biotechnology08";

                        String insert_sql = "INSERT INTO notes (title, content, category_name) VALUES (?, ?, ?)";

                        if (request.getMethod().equalsIgnoreCase("post")) {
                            String category = request.getParameter("category");
                            String title = request.getParameter("title");

                            // Validate title (ensure it's not null or empty)
                            if (title == null || title.isEmpty()) {
                                out.println("<p>Error: Title cannot be null or empty.</p>");
                                return; // Stop further execution
                            }

                            Part filePart = request.getPart("fileUpload");
                            String writeNotes = request.getParameter("write");

                            Connection con = null;
                            PreparedStatement pstmt = null;

                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection(url_db_one, username_db_one, password_db_one);
                                pstmt = con.prepareStatement(insert_sql);

                                pstmt.setString(1, title);

                                if (filePart != null) {
                                    InputStream inputStream = filePart.getInputStream();
                                    pstmt.setBinaryStream(2, inputStream);
                                } else {
                                    pstmt.setString(2, writeNotes);
                                }

                                pstmt.setString(3, category);

                                int rowsAffected = pstmt.executeUpdate();

                                if (rowsAffected > 0) {
                                    out.println("<p>Notes uploaded successfully!</p>");
                                } else {
                                    out.println("<p>Failed to upload notes.</p>");
                                }
                            } catch (Exception e) {
                                out.println("<p>Error: " + e.getMessage() + "</p>");
                            } finally {
                                try {
                                    if (pstmt != null) {
                                        pstmt.close();
                                    }
                                    if (con != null) {
                                        con.close();
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        }
                    %>





                </form>
            </div>
        </div>
    </body>
</html> 