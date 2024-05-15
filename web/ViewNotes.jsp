<%-- 
    Document   : ViewNotes
    Created on : 10-May-2024, 12:12:38 pm
    Author     : ABHINOOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
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
        <link rel="stylesheet" href="./ViewNotes.css">
        <!--<script src="./ReadNotes.js"></script>-->

        <!-- Box Icon CSS -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <!--        <div class="container-fluid">
        
                    <h1><%= request.getParameter("title")%></h1>
                    <p><%= request.getParameter("content")%></p>
                    <h1><%= URLDecoder.decode(request.getParameter("title"), "UTF-8")%></h1>
                    <p><%= URLDecoder.decode(request.getParameter("content"), "UTF-8")%></p>
        
                </div>-->

        <div class="container-fluid">
            <form class="mx-auto" id="loginForm">
                <h1 class="text-center"><%= URLDecoder.decode(request.getParameter("title"), "UTF-8")%></h1>
                <div class="mb-3 mt-5">
                    <p><%= URLDecoder.decode(request.getParameter("content"), "UTF-8")%></p>
                        <%
//                        Connection conn = null;
//                        PreparedStatement stmt = null;
//                        ResultSet rs = null;
//                        try {
//                            // Load the JDBC driver
//                            Class.forName("com.mysql.cj.jdbc.Driver");
//
//                            // Establish connection to the database
//                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/notes_organization_system", "root", "Biotechnology08");
//
//                            // Assuming you have a table called 'files' with columns 'id', 'filename', and 'filedata'
//                            String selectedCategory = (String) session.getAttribute("selectedCategory");
//                            String title = Integer.parseInt(request.getParameter("URLDecoder.decode(request.getParameter('title'), 'UTF-8'"));
//                            
////                            String title = URLDecoder.decode(request.getParameter("title"), "UTF-8";
//                            
//                            stmt = conn.prepareStatement("SELECT content FROM notes WHERE title = ?");
//                            stmt.setText(1, title);
//                            rs = stmt.executeQuery();
//
//                            if (rs.next()) {
//                                String filename = rs.getString("title");
//                                String fileBlob = rs.getText("content");
//
//                                // Check if the file is PDF or text
//                                String contentType = "application/octet-stream"; // default content type
//                                if (filename.toLowerCase().endsWith(".pdf")) {
//                                    contentType = "application/pdf";
//                                } else if (filename.toLowerCase().endsWith(".txt")) {
//                                    contentType = "text/plain";
//                                }
//
//                                // Set response content type
//                                response.setContentType(contentType);
//                                response.setHeader("Content-Disposition", "inline; filename=\"" + filename + "\"");
//
//                                // Read file data from database and write it to response output stream
//                                InputStream inputStream = fileBlob.getBinaryStream();
//                                OutputStream outputStream = response.getOutputStream();
//                                byte[] buffer = new byte[4096];
//                                int bytesRead = -1;
//                                while ((bytesRead = inputStream.read(buffer)) != -1) {
//                                    outputStream.write(buffer, 0, bytesRead);
//                                }
//                                inputStream.close();
//                                outputStream.close();
//                            } else {
//                                out.println("File not found.");
//                            }
//                        } catch (Exception e) {
//                            out.println("Error: " + e.getMessage());
//                        } finally {
//                            // Close JDBC objects
//                            if (rs != null) {
//                                rs.close();
//                            }
//                            if (stmt != null) {
//                                stmt.close();
//                            }
//                            if (conn != null) {
//                                conn.close();
//                            }
//                        }
                        %>
                    <!--</p>-->
                </div>
            </form>
        </div>
    </body>
</html>
