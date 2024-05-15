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
        <title>My Dashboard</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="./dashboard.css">
        <script src="./dashboard.js"></script>

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
                                <a href="./dashboard.jsp">
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

            <!-- DASHBOARD WIDGETS -->
            <div class="grid-container">
                <!-- Welcome Pane -->
                <div class="welcome_pane">
                    <div class="welcome_one">

                        <span> 
                            <%
                                // Retrieve username from the query parameter
                                String username = request.getParameter("username");

                                // Check if username is not null
                                if (username != null && !username.isEmpty()) {
                            %>
                            <h1>Welcome Back, <%= username%></h1>
                            <%
                            } else {
                            %>
                            <h1>Welcome to the Dashboard</h1>
                            <%
                                }
                            %>

                        </span>
                        <h4>We're always here to help you stay organized.</h4>

                    </div>
                    <div class="welcome_two">
                        <img src="./Assets/Images/Dashboard/welcome.svg" alt="">

                    </div> 
                </div>
                <!-- My Notes -->
                <div class="block">
                    <a href="./WriteNotes.jsp" class="link">
                        <i class='bx bx-pen'></i>
                        <span>Write Notes</span>
                    </a>
                </div>
                <!-- Upload Notes -->
                <div class="block">
                    <a href="./UploadNotesNew.jsp" class="link">
                        <i class='bx bx-upload'></i>
                        <span>Upload Notes</span>
                    </a>
                </div>
                <!-- Read Notes -->
                <div class="block">
                    <a href="./ReadNotes.jsp" class="link">
                        <i class='bx bx-book-reader'></i>
                        <span>Read Notes</span>
                    </a>
                </div>
                <!-- Profile -->
                <div class="block">
                    <a href="./Profile.jsp" class="link">
                        <i class='bx bxs-face'></i>
                        <span>Profile</span>
                    </a>
                </div>
                <!--<div id="ww_2128dafd4dd15" class="block" v='1.3' loc='id' a='{"t":"horizontal","lang":"en","sl_lpl":1,"ids":[],"font":"Arial","sl_ics":"one_a","sl_sot":"celsius","cl_bkg":"image","cl_font":"#FFFFFF","cl_cloud":"#FFFFFF","cl_persp":"#81D4FA","cl_sun":"#FFC107","cl_moon":"#FFC107","cl_thund":"#FF5722"}'>More forecasts: <a href="https://oneweather.org/fr/paris/30_jours/" id="ww_2128dafd4dd15_u" target="_blank">oneweather.org/fr/paris/30_jours</a></div><script async src="https://app2.weatherwidget.org/js/?id=ww_2128dafd4dd15"></script>-->
                <!-- Calendar -->
                <div class="calendar">
                    <section class="ftco-section">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="content w-100">
                                        <div class="calendar-container">
                                            <div class="calendar"> 
                                                <div class="year-header"> 
                                                    <span class="left-button fa fa-chevron-left" id="prev"> </span> 
                                                    <span class="year" id="label"></span> 
                                                    <span class="right-button fa fa-chevron-right" id="next"> </span>
                                                </div> 
                                                <table class="months-table w-100"> 
                                                    <tbody>
                                                        <tr class="months-row">
                                                            <td class="month">Jan</td> 
                                                            <td class="month">Feb</td> 
                                                            <td class="month">Mar</td> 
                                                            <td class="month">Apr</td> 
                                                            <td class="month">May</td> 
                                                            <td class="month">Jun</td> 
                                                            <td class="month">Jul</td>
                                                            <td class="month">Aug</td> 
                                                            <td class="month">Sep</td> 
                                                            <td class="month">Oct</td>          
                                                            <td class="month">Nov</td>
                                                            <td class="month">Dec</td>
                                                        </tr>
                                                    </tbody>
                                                </table> 

                                                <table class="days-table w-100"> 
                                                    <td class="day">Sun</td> 
                                                    <td class="day">Mon</td> 
                                                    <td class="day">Tue</td> 
                                                    <td class="day">Wed</td> 
                                                    <td class="day">Thu</td> 
                                                    <td class="day">Fri</td> 
                                                    <td class="day">Sat</td>
                                                </table> 
                                                <div class="frame"> 
                                                    <table class="dates-table w-100"> 
                                                        <tbody class="tbody">             
                                                        </tbody> 
                                                    </table>
                                                </div> 
                                                <!-- <button class="button" id="add-button">Add Event</button> -->
                                            </div>
                                        </div>
                                        <!-- <div class="events-container">
                                        </div>
                                        <div class="dialog" id="dialog">
                                            <h2 class="dialog-header"> Add New Event </h2>
                                            <form class="form" id="form">
                                              <div class="form-container" align="center">
                                                <label class="form-label" id="valueFromMyButton" for="name">Event name</label>
                                                <input class="input" type="text" id="name" maxlength="36">
                                                <label class="form-label" id="valueFromMyButton" for="count">Number of people to invite</label>
                                                <input class="input" type="number" id="count" min="0" max="1000000" maxlength="7">
                                                <input type="button" value="Cancel" class="button" id="cancel-button">
                                                <input type="button" value="OK" class="button button-white" id="ok-button">
                                              </div>
                                            </form>
                                          </div>
                                      </div> -->
                                    </div>
                                </div>
                            </div>
                    </section>

                    <script src="./calendar-08/calendar-08/js/jquery.min.js"></script>
                    <script src="./calendar-08/calendar-08/js/bootstrap.min.js"></script>
                    <script src="./calendar-08/calendar-08/js/popper.js"></script>
                    <script src="./calendar-08/calendar-08/js/main.js"></script>
                    <!-- <iframe src="https://calendar.google.com/calendar/embed?src=04778bfe29ae043c130d7e168e7f089529eb938e524194e14bec3af5d22c4e8c%40group.calendar.google.com&ctz=Asia%2FKolkata" style="border: 0" width="100%" height=100% frameborder="0" scrolling="no"></iframe> -->
                </div>
            </div>


        </div>

    </body>

</html>