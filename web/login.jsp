<%-- Document : login Created on : Jan 2, 2022, 8:29:57 PM Author : dotav --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Login</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- CSS only -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/general.css" />

    <!-- JS only -->
    <script
      type="module"
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"
    ></script>
    <script
      nomodule
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"
    ></script>
    <script
      src="https://kit.fontawesome.com/39e8541ce6.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <section class="section-login">
      <h1 class="slogan__text">Welcome to our restaurant</h1>
      <h2 class="subslogan__text">Become our user to receive many offers</h2>
      <div class="container__login">
        <div class="login-title">
          <ion-icon class="login__icon" name="lock-closed-outline"></ion-icon>
          <h3 class="login__text">Sign in</h3>
        </div>
        <form class="login-form" action="ControlLogin" method="post">
          <div class="form-input">
            <label for="typeEmailX-2">Username:</label>
            <input
              type="text"
              id="typeEmailX-2"
              class="form-control form-control-lg"
              name="username"
            />
          </div>
          <div class="form-input">
            <label for="typePasswordX-2">Password:</label>
            <input
              type="password"
              id="typePasswordX-2"
              class="form-control form-control-lg"
              name="password"
            />
          </div>

          <button class="btn btn-login" type="submit">Login</button>
        </form>
      </div>
    </section>
  </body>
</html>
