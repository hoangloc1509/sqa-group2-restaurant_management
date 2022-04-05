<%-- 
    Document   : ClientHomepage
    Created on : Jan 2, 2022, 8:26:09 PM
    Author     : dotav
--%>
<%@page import="model.Reser"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Select Reservation</title>

    <!-- CSS only -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Pinyon+Script&family=Rubik:wght@400;500;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/general.css" />

    <!-- JS Only -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </head>

    <body class="booked-page">
      <header class="header">
      <a href="ClientHomepage.jsp">
        <img src="css/img/Logo.png" class="logo" />
      </a>
      <nav class="main-nav">
        <ul class="main-nav-list">
          <li>
            <a class="main-nav-link" href="#">Specialities</a>
          </li>
          <li>
            <a class="main-nav-link" href="MakeReser.jsp">Reservation</a>
          </li>
          <li>
            <a
              class="main-nav-link"
              href="<%=request.getContextPath()%>/CheckReser"
              >Menu</a
            >
          </li>
          <li>
            <a class="main-nav-link" href="#">Events</a>
          </li>
          <li>
            <a class="main-nav-link" href="#">Contact</a>
          </li>
        </ul>
      </nav>
      <div class="dropdown user-box">
        <a
          class="btn dropdown-toggle user"
          href="#"
          role="button"
          id="dropdownMenuLink"
          data-toggle="dropdown"
          aria-expanded="false"
        >
          <span class="username"><%=session.getAttribute("username")%></span>
        </a>

        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
          <a class="dropdown-item" href="#">Biography</a>
          <a class="dropdown-item" href="#">Deal history</a>
          <a class="dropdown-item" href="login.jsp">Sign-out</a>
        </div>
      </div>
      </header>
        
        <div class ="booked-container">
          <h1 class="select-reservation-heading"> Booked table list </h1>
            <table class ="table">
                <tr bgcolor="f0b10f">
                    <th><b>Booked user</b></th>
                    <th><b>Phone number</b></th>
                    <th><b>Guest number</b></th>
                    <th><b>Date</b></th>
                    <th><b>Time</b></th>
                    <th></th>
                </tr>
                <%! int i=0; %>  
                    <% ArrayList<Reser> tbl = (ArrayList<Reser>)request.getAttribute("listreser");
                    if (tbl != null)
                    for (Reser t: tbl){%>
                    <% i++; %>  
                    <tr>
                            <td><%=t.getName()%></td>
                            <td><%=t.getPhone()%></td>
                            <td class="text-center"><%=t.getQuantity()%></td>
                            <td><%=t.getDate()%></td>
                            <td><%=t.getTime()%></td>
                            <td>
                                <form action="<%=request.getContextPath()%>/PassReserId">
                                    <button name="reser_id" value = "<%=t.getId()%>" type = submit class="btn btn-order" >Order</button>
                                </form>
                            </td>
                        </tr>
                    <%}%>
            </table>
        </div>
    </body>
</html>
