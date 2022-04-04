<%-- 
    Document   : DetailReser
    Created on : Mar 22, 2022, 11:22:06 PM
    Author     : dotav
--%>

<%@page import="model.Reser"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
        <h1 class="heading-main">Detailed Orders:</h1>
        <form class="result" action="GetReceipt">
            <table class="table-result">
                <tr bgcolor="c5d9f1">
                    <th class="table-heading">No</th>
                    <th class="table-heading">Date</th>
                    <th class="table-heading">Spending</th>
                    <th class="table-heading">Action</th>
                </tr>
                <%! int i=0; %>  
                <% List<Reser> tbl = (ArrayList<Reser>)request.getAttribute("list_reser");
                if (tbl != null)
                for (Reser t: tbl){%>
                <% i++; %>  
                    <tr bgcolor="ffffff">
                        <td class="table-body"><%=i%></td>
                        <td class="table-body"><%=t.getDate()%></td>
                        <td class="table-body"><%=t.getAmount()%></td>
                        <td class="table-body"><button name="receipt_detail" value="<%=t.getId()%>" type="submit" class="btn-view-detail">Info</button></td>
                    </tr>
                <%}%>
                <tr>
                        <td class="table-total"></td>
                        <td class="table-total">Total spending:</td>
                        <td class="table-total"><%=request.getAttribute("indi_amount")%></td>
                        <td class="table-total"></td>
                </tr>
            </table>
        </form>
      </main>
    </body>
</html>
