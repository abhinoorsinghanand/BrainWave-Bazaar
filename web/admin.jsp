<%-- 
    Document   : admin
    Created on : 03-May-2024, 4:36:30 pm
    Author     : ABHINOOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <title>ADMIN</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }

            th {
                background-color: #f2f2f2;
            }

            .users, .options, .heading, .categories {
                margin: 40px;
            }
            input{
                width: 250px;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">

            <!-- -------------------- Customary Buttons -------------------- -->


            <%
                String url_db = "jdbc:mysql://localhost/notes_organization_system";
                String username_db = "root";
                String password_db = "Biotechnology08";
            %>


            <section class="always_visible">
                <div class="heading">
                    <center>
                        <h1>Welcome BrainWave Bazaar Admin!</h1>
                    </center>
                </div>

                <div class="options" style="justify-content: space-between">
                    <center>
                        <button id="users" onclick="showUserSection()">Users</button>
                        <button id="categories" onclick="showCategoriesSection()">Categories</button>
                        <!--<button id="notes" onclick="showNotesSection()">Notes</button>-->
                        <button id="logout" onclick="./index.html">Log Out</button>

                    </center>
                </div>
            </section>


            <!-- -------------------- Users Section -------------------- -->


            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(url_db, username_db, password_db);
                    String view_users_query = "SELECT * FROM users";
                    PreparedStatement pstmt = conn.prepareStatement(view_users_query);
                    ResultSet rs = pstmt.executeQuery();
            %>
            <section class="section users" id="users">
                <h4>Available Users</h4>
                <table width="20" cellspacing="10">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Name of the User</th>
                            <th>UserName</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% while (rs.next()) {%>
                        <tr>
                            <td><%= rs.getInt("user_id")%></td>
                            <td><%= rs.getString("name")%></td>
                            <td><%= rs.getString("username")%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
                <br><br><br>
                <!-- Add User Form -->
                <form id="addUserForm" method="post" action="admin.jsp">
                    <input type="text" name="newUserName" placeholder="Enter username">
                    <input type="text" name="newUserFullName" placeholder="Enter full name">
                    &nbsp;
                    <button type="submit" name="action" value="addUser">Add User</button>
                </form>

                <!-- Remove User Form -->
                <form id="removeUserForm" method="post" action="admin.jsp">
                    <input type="text" name="removeUserName" placeholder="Enter username to remove">
                    &nbsp;
                    <button type="submit" name="action" value="removeUser">Remove User</button>
                </form>

                <%
                        String action = request.getParameter("action");

                        // Handle adding a new user
                        if ("addUser".equals(action)) {
                            String newUserName = request.getParameter("newUserName");
                            String newUserFullName = request.getParameter("newUserFullName");
                            String insertUserQuery = "INSERT INTO users (username, name) VALUES (?, ?)";

                            try {
                                PreparedStatement pstmtAdd = conn.prepareStatement(insertUserQuery);
                                pstmtAdd.setString(1, newUserName);
                                pstmtAdd.setString(2, newUserFullName);
                                int rowsAffected = pstmtAdd.executeUpdate();
                                if (rowsAffected > 0) {
                                    out.println("User added successfully.");
                                } else {
                                    out.println("Failed to add user.");
                                }
                                pstmtAdd.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                                out.println("Error: " + e.getMessage());
                            }
                        }

                        // Handle removing a user
                        if ("removeUser".equals(action)) {
                            String removeUserName = request.getParameter("removeUserName");
                            String deleteUserQuery = "DELETE FROM users WHERE username = ?";

                            try {
                                PreparedStatement pstmtRemove = conn.prepareStatement(deleteUserQuery);
                                pstmtRemove.setString(1, removeUserName);
                                int rowsAffected = pstmtRemove.executeUpdate();
                                if (rowsAffected > 0) {
                                    out.println("User removed successfully.");
                                } else {
                                    out.println("Failed to remove user.");
                                }
                                pstmtRemove.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                                out.println("Error: " + e.getMessage());
                            }
                        }

                        // Close database resources
                        rs.close();
                        pstmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>

            </section>


            <!-- -------------------- Categories Section -------------------- -->
            <section class="section categories" id="categories">
                <h4>Available Categories</h4>
                <table width="100%" cellspacing="10">
                    <thead>
                        <tr>
                            <th>Category Name</th>
                            <!-- Add more table headers if needed -->
                        </tr>
                    </thead>
                    <tbody>
                        <%                            try {
                                // Establish database connection
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection conn = DriverManager.getConnection(url_db, username_db, password_db);

                                // Query to fetch categories
                                String view_categories_query = "SELECT * FROM categories";
                                PreparedStatement pstmt = conn.prepareStatement(view_categories_query);
                                ResultSet rs = pstmt.executeQuery();

                                // Loop through the result set and display each category as a table row
                                while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString("category_name")%></td>
                            <!-- Add more table cells if needed -->
                        </tr>
                        <%
                                }
                                // Close database connections
                                rs.close();
                                pstmt.close();
                                conn.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>
                <br><br><br>
                <%-- Add a new Category Form --%>
                <form id="addCategoryForm" method="post" action="admin.jsp">
                    <input type="text" name="newCategoryName" placeholder="Enter name of category to add">
                    &nbsp;
                    <button type="submit" name="action" value="addCategory">Add</button>
                </form>

                <%-- Remove a Category Form --%>
                <form id="removeCategoryForm" method="post" action="admin.jsp">
                    <input type="text" name="removeCategoryName" placeholder="Enter name of category to remove">
                    &nbsp;
                    <button type="submit" name="action" value="removeCategory">Remove</button>
                </form>

                <%-- JDBC Code to Handle Category Operations --%>
                <%
                    String action = request.getParameter("action");

                    // Handle adding a new category
                    if ("addCategory".equals(action)) {
                        String newCategoryName = request.getParameter("newCategoryName");
                        String insertCategoryQuery = "INSERT INTO categories (category_name) VALUES (?)";

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection(url_db, username_db, password_db);
                            PreparedStatement pstmt = conn.prepareStatement(insertCategoryQuery);
                            pstmt.setString(1, newCategoryName);
                            int rowsAffected = pstmt.executeUpdate();
                            if (rowsAffected > 0) {
                                out.println("Category added successfully.");
                            } else {
                                out.println("Failed to add category.");
                            }
                            pstmt.close();
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("Error: " + e.getMessage());
                        }
                    }

                    // Handle removing a category
                    if ("removeCategory".equals(action)) {
                        String removeCategoryName = request.getParameter("removeCategoryName");
                        String deleteCategoryQuery = "DELETE FROM categories WHERE category_name = ?";

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection(url_db, username_db, password_db);
                            PreparedStatement pstmt = conn.prepareStatement(deleteCategoryQuery);
                            pstmt.setString(1, removeCategoryName);
                            int rowsAffected = pstmt.executeUpdate();
                            if (rowsAffected > 0) {
                                out.println("Category removed successfully.");
                            } else {
                                out.println("Failed to remove category.");
                            }
                            pstmt.close();
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("Error: " + e.getMessage());
                        }
                    }
                %>
            </section>
        </div>
        <script>
            //            function showUserSection() {
            //                document.getElementById("users").style.display = "block";
            //                document.getElementById("categories").style.display = "none";
            //                document.getElementById("notes").style.display = "none";
            //            }
            //
            //            function showCategoriesSection() {
            //                document.getElementById("users").style.display = "none";
            //                document.getElementById("categories").style.display = "block";
            //                document.getElementById("notes").style.display = "none";
            //            }
            //
            //            function showNotesSection() {
            //                document.getElementById("users").style.display = "none";
            //                document.getElementById("categories").style.display = "none";
            //                document.getElementById("notes").style.display = "block";
            //            }
        </script>
    </body>
</html>
