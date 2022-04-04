<%-- 
    Document   : ClientHomepage
    Created on : Jan 2, 2022, 8:26:09 PM
    Author     : dotav
--%>

<%@page import="model.ClientStat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Manager Homepage</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- CSS only -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="css/general.css" />
    <link rel="stylesheet" href="css/admin.css" />

    <!-- JS Only -->
    <script
      type="module"
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"
    ></script>
    <script
      nomodule
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"
    ></script>
  </head>
    <body class="manager-container">
      <header class="side-bar-position">
        <p>Manager</p>
      </header>
  
      <nav class="banner">
        <button class="burger-btn">
          <ion-icon class="menu-icon" name="menu-outline"></ion-icon>
        </button>
        <p class="welcome-text">Have a nice day admin</p>
      </nav>
  
      <aside class="side-bar-main">
        <ul class="side-bar-list">
          <li class="side-bar-item">
            <a class="side-bar-link" href="#"
              ><ion-icon name="desktop-outline"></ion-icon>&nbsp;Dashboard</a
            >
          </li>
          <li class="side-bar-item">
            <a class="side-bar-link" href="#"
              ><ion-icon name="people-outline"></ion-icon>&nbsp;Manage customer</a
            >
          </li>
          <li class="side-bar-item">
            <a class="side-bar-link" href="#"
              ><ion-icon name="briefcase-outline"></ion-icon>&nbsp;Manage staff</a
            >
          </li>
          <li class="side-bar-item">
            <a class="side-bar-link" href="#"
              ><ion-icon name="storefront-outline"></ion-icon>&nbsp;Manage
              supplier</a
            >
          </li>
          <li class="side-bar-item">
            <a class="side-bar-link" href="#"
              ><ion-icon name="fast-food-outline"></ion-icon>&nbsp;Manage dish</a
            >
          </li>
          <li class="side-bar-item">
            <a class="side-bar-link" href="#"
              ><ion-icon name="restaurant-outline"></ion-icon>&nbsp;Manage
              combo</a
            >
          </li>
          <li class="side-bar-item">
            <a class="side-bar-link" href="MainStatistic.jsp"
              ><ion-icon name="podium-outline"></ion-icon>&nbsp;View statistics</a
            >
          </li>
          <li class="side-bar-item">
            <a class="side-bar-link" href="#"
              ><ion-icon name="person-circle-outline"></ion-icon>&nbsp;Profile</a
            >
          </li>
          <li class="side-bar-item">
            <a class="side-bar-link" href="#"
              ><ion-icon name="settings-outline"></ion-icon>&nbsp;Setting</a
            >
          </li>
          <li class="side-bar-item">
            <a class="side-bar-link" href="login.jsp"
              ><ion-icon name="log-out-outline"></ion-icon>&nbsp;Logout</a
            >
          </li>
        </ul>
      </aside>

      <main class="main">
        <h1 class="heading-main">Customer statistics</h1>
        <form class="form-date" action="GetStatistic">
            <div class="sd-group" >
                <label class="date-input-label" for="start-date">Start date:</label>
                <input name="begin_date" type="date" class="date-input" id="start-date">
            </div>
            <div class="ed-group">
                <label class="date-input-label" for="end-date">End date:</label>
                <input name="end_date" type="date" class="date-input" id="end-date">
            </div>
            <button type="submit" class="btn-view">View</button>
        </form>
        <form class="result" action="GetClientDetail">
            <table class="table-result">
                <tr bgcolor="c5d9f1">
                    <th class="table-heading">No</th>
                    <th class="table-heading">Customer name</th>
                    <th class="table-heading">Total spending</th>
                    <th class="table-heading">Action</th>
                </tr>
                <%! int i=0; %>  
                <% List<ClientStat> tbl = (ArrayList<ClientStat>)request.getAttribute("client_list");
                if (tbl != null)
                for (ClientStat t: tbl){%>
                <% i++; %>  
                    <tr bgcolor="ffffff">
                        <td class="table-body"><%=i%></td>
                        <td class="table-body"><%=t.getClient_name()%></td>
                        <td class="table-body"><%=t.getAmount()%></td>
                        <td class="table-body"><button name="client_detail" value="<%=t.getClient_id()%>" type="submit" class="btn-view-detail">Info</button></td>
                    </tr>
                <%}%>
                <tr>
                        <td class="table-total"></td>
                        <td class="table-total">Total amount:</td>
                        <td class="table-total amount"><%=request.getAttribute("total")%></td>
                        <td class="table-total"></td>
                </tr>
            </table>
        </form>
      </main>

      <script src="js/script.js"></script>
    </body>
</html>
