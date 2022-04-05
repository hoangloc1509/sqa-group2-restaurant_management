<%-- Document : PaymentMenu.jsp Created on : Mar 29, 2022, 2:39:10 PM Author :
dotav --%> <%@page import="model.Reser"%> <%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@page
contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Search Client</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- CSS only -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/general.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/staff.css"
    />

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
  <body class="staff-container">
    <header class="side-bar-position">
      <p>Receptionist</p>
    </header>

    <nav class="banner">
      <button class="burger-btn">
        <ion-icon class="menu-icon" name="menu-outline"></ion-icon>
      </button>
      <p class="welcome-text">Have a nice day staff</p>
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
            ><ion-icon name="person-circle-outline"></ion-icon>&nbsp;Profile</a
          >
        </li>
        <li class="side-bar-item">
          <a class="side-bar-link" href="PaymentMenu.jsp"
            ><ion-icon name="calculator-outline"></ion-icon>&nbsp;Payment</a
          >
        </li>
        <li class="side-bar-item">
          <a class="side-bar-link" href="#"
            ><ion-icon name="settings-outline"></ion-icon>&nbsp;Setting</a
          >
        </li>
        <li class="side-bar-item">
          <a class="side-bar-link" href="../login.jsp"
            ><ion-icon name="log-out-outline"></ion-icon>&nbsp;Logout</a
          >
        </li>
      </ul>
    </aside>

    <main class="main">
      <p class="heading-main">Receive payment</p>

      <div class="search-field">
        <label for="clientname">Search client name:</label>
        <input type="text" id="clientname" />
        <button onclick="loadReser()">
          <i class="fa fa-search ml-"></i>
        </button>
      </div>

      <div id="content">
        <div></div>
      </div>
    </main>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
      function loadReser() {
        $.ajax({
          url: "/RestaurantManagement/SearchReser",
          type: "get",
          data: {
            clientname: document.querySelector("#clientname").value,
          },
          success: function (data) {
            var row = document.getElementById("content");
            row.innerHTML = data;
          },
          error: function (xhr) {},
        });
      }
    </script>
  </body>
</html>
