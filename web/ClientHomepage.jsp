<%-- Document : ClientHomepage Created on : Jan 2, 2022, 8:26:09 PM Author :
dotav --%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Home</title>
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
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/general.css" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
      crossorigin="anonymous"
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </head>
  <body>
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

    <section class="section-hero">
      <h1 class="heading-pinyon">Welcome</h1>
      <h2 class="subheading">HoangLoc</h2>
      <p class="heading-slogan">Where taste meets the myth</p>
    </section>

    <section class="section-about">
      <div class="about-box">
        <h1 class="about-pinyon">Discover</h1>
        <h2 class="about-subtitle">About us</h2>
        <span class="stars">★★★</span>
        <div class="about-description">
          <p>
            “Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
            eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
            ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
            aliquip ex ea commodo consequat.”
          </p>
          <p class="signature">HoangLoc</p>
        </div>
      </div>
      <img src="css/img/AboutUsImage.png" alt="A man preparing a dish" />
    </section>

    <!-- <section class="section-specialities">
      <h1 class="special-pinyon">Discover</h1>
      <h2 class="special-subtitle">Our Specialties</h2>
      <p class="special-description">
        Top dishes that customers experience the most
      </p>
      <div class="carousel">
        <button class="arrow left">
          <ion-icon class="left-arrow" name="chevron-back-outline"></ion-icon>
        </button>
        <div class="cards">
          <div class="card-dish">
            <img
              class="card-dish-img"
              src="https://meta.vn/Data/image/2019/11/09/cach-lam-ga-ham-thuoc-bac-3.jpg"
              alt="Chicken soup"
            />
            <p class="card-dish-name">Canh ga tan</p>
            <p class="card-dish-price">125.000<sup>đ</sup></p>
            <button class="btn">Order</button>
          </div>
          <div class="card-dish">
            <img
              class="card-dish-img"
              src="https://meta.vn/Data/image/2019/11/09/cach-lam-ga-ham-thuoc-bac-3.jpg"
              alt="Chicken soup"
            />
            <p class="card-dish-name">Canh ga tan</p>
            <p class="card-dish-price">125.000<sup>đ</sup></p>
            <button class="btn">Order</button>
          </div>
          <div class="card-dish">
            <img
              class="card-dish-img"
              src="https://meta.vn/Data/image/2019/11/09/cach-lam-ga-ham-thuoc-bac-3.jpg"
              alt="Chicken soup"
            />
            <p class="card-dish-name">Canh ga tan</p>
            <p class="card-dish-price">125.000<sup>đ</sup></p>
            <button class="btn">Order</button>
          </div>
          <div class="card-dish">
            <img
              class="card-dish-img"
              src="https://meta.vn/Data/image/2019/11/09/cach-lam-ga-ham-thuoc-bac-3.jpg"
              alt="Chicken soup"
            />
            <p class="card-dish-name">Canh ga tan</p>
            <p class="card-dish-price">125.000<sup>đ</sup></p>
            <button class="btn">Order</button>
          </div>
        </div>
        <button class="arrow right">
          <ion-icon
            class="right-arrow"
            name="chevron-forward-outline"
          ></ion-icon>
        </button>
      </div>
      <div class="dots">
        <div class="dot">&nbsp;</div>
        <div class="dot">&nbsp;</div>
      </div>
    </section> -->
  </body>
</html>
