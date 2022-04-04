<%-- Document : ClientHomepage Created on : Jan 2, 2022, 8:26:09 PM Author :
dotav --%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
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
      <h1 class="heading-main">View statistics</h1>

      <div class="select-stat">
        <a class="stat-link stat-link-1" href="ClientStatistic.jsp"
          ><ion-icon class="bg-icon" name="id-card-outline"></ion-icon>
          <div class="description-box">
            <p class="stat-type">Customer</p>
            <p class="sub-text">by revenue</p>
          </div>
        </a>
        <a class="stat-link stat-link-2" href="#"
          ><ion-icon class="bg-icon" name="beer-outline"></ion-icon>
          <div class="description-box">
            <p class="stat-type">Dish</p>
            <p class="sub-text">by revenue</p>
          </div></a
        >
        <a class="stat-link stat-link-3" href="#"
          ><ion-icon class="bg-icon" name="storefront-outline"></ion-icon>
          <div class="description-box">
            <p class="stat-type">Supplier</p>
            <p class="sub-text">by revenue</p>
          </div></a
        >
        <a class="stat-link stat-link-4" href="#"
          ><ion-icon class="bg-icon" name="cash-outline"></ion-icon>
          <div class="description-box">
            <p class="stat-type">Revenue</p>
            <p class="sub-text">by time</p>
          </div></a
        >
      </div>
    </main>
  </body>
</html>
