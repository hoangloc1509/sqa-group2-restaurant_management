<%-- Document : SaveReceiptSuccess Created on : Mar 30, 2022, 1:08:20 PM Author
: dotav --%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/general.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/css/staff.css"
    />
    <title>Successful</title>
  </head>
  <body class="notification">
    <div class="notification-container">
      <ion-icon
        class="notification-success"
        name="checkmark-circle-outline"
      ></ion-icon>
      <h1 class="notification-heading">Receipt saved successfully</h1>
      <a href="Payment/ReceptionistHomepage.jsp" class="btn btn-back"
        >Back to homepage</a
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
  </body>
</html>
