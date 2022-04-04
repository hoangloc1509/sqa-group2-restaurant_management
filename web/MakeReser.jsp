<%-- Document : BookTableOnline Created on : Jan 3, 2022, 9:51:53 AM Author :
dotav --%> <%@page import="model.Table"%> <%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Make Reservation</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

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
    <script
      type="module"
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"
    ></script>
    <script
      nomodule
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"
    ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </head>
  <body class="reser">
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

    <h1 class="reservation-heading">Online Reservation</h1>

    <div class="reservation-container">
      <h2 class="booking-info">Booking Information</h2>
      <form class="reservation-form" action="GetReser">
        <div class="group-form">
          <label for="typeEmailX-2">Name:</label>
          <input
            type="text"
            id="typeEmailX-2"
            class="input input-name"
            name="name"
            required
          />
        </div>

        <div class="group-form">
          <label for="typeEmailX-3">Phone number:</label>
          <input
            type="number"
            id="typeEmailX-3"
            class="input input-phone"
            name="phone"
            required
          />
        </div>

        <div class="group-form">
          <label for="typeEmailX-3">Guest number:</label>
          <input
            type="number"
            id="typeEmailX-3"
            class="input input-guest-number"
            name="quantity"
            required
          />
        </div>

        <div class="group-form">
          <label for="date">Date: </label>
          <input
            id="date"
            name="date"
            type="date"
            class="input input-date"
            id="email"
            required
          />
        </div>

        <div class="group-form">
          <label for="times">Time: </label>
          <select id="times" name="time">
            <option value="08:00:00">8:00</option>
            <option value="09:00:00">9:00</option>
            <option value="10:00:00">10:00</option>
            <option value="11:00:00">11:00</option>
            <option value="12:00:00">12:00</option>
            <option value="13:00:00">13:00</option>
            <option value="14:00:00">14:00</option>
            <option value="15:00:00">15:00</option>
            <option value="16:00:00">16:00</option>
            <option value="17:00:00">17:00</option>
            <option value="18:00:00">18:00</option>
            <option value="19:00:00">19:00</option>
            <option value="20:00:00">20:00</option>
            <option value="21:00:00">21:00</option>
          </select>
        </div>

        <button type="submit" class="btn btn-submit">Submit</button>
      </form>
    </div>
  </body>
</html>
