<%-- Document : OrderSuccess Created on : Mar 22, 2022, 1:06:19 PM Author :
dotav --%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Make Reservation Successful</title>

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
  </head>

  <body class="notification">
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
          <a class="dropdown-item" href="../login.jsp">Sign-out</a>
        </div>
      </div>
    </header>

    <div class="notification-container">
      <ion-icon
        class="notification-success"
        name="checkmark-circle-outline"
      ></ion-icon>
      <h1 class="notification-heading">Reserved successfully</h1>
      <a class="btn btn-back" href="ClientHomepage.jsp"
        >&larr; Back to homepage</a
      >
    </div>

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
  </body>
</html>
