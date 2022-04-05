<%-- 
    Document   : Receipt
    Created on : Mar 30, 2022, 1:13:33 AM
    Author     : dotav
--%>
<%@page import="model.DishOrdered"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Reser"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Detail Receipt</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
        <!-- CSS only -->
        <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
        />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/general.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/staff.css" />
    
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
            <h1 class="heading-main">Receipt</h1>
            <div class="receipt-information-box">
                <p class="receipt-title">Receipt information</p>               
                <% Reser rs = (Reser) request.getAttribute("reser"); %>
                <p>Receipt ID: <%=rs.getId()%> </p>
                <p>Checkin time: <%=rs.getDate() +" "+ rs.getTime() %> </p>
            </div>
            <div class="receipt-customer-info-box">
                <p class="customer-title">Customer information</p>
                <p>Customer name: <%=rs.getName()%> </p>
                <p>Customer phone: <%=rs.getPhone()%> </p>
            </div>
            <div class="list-title">
                <h4>List of ordered:</h4>
                <form action="SaveReceipt">
                    <table class ="table-receipt">
                        <tr bgcolor="c5d9f1">
                            <th><strong>No</strong></th>
                            <th><strong>Dish</strong></th>
                            <th><strong>Price</strong></th>
                            <th><strong>Quantity</strong></th>
                            <th><strong>Total</stro></th>
                        </tr>
                        <% List<DishOrdered> tbl = (ArrayList<DishOrdered>)request.getAttribute("list_dishordered");
                        if (tbl != null){
                            int i=0;
                            for (DishOrdered t: tbl){%>
                            <% i++; %>  
                                <tr class="table-receipt-body">
                                    <td><%=i%></td>
                                    <td><%=t.getName()%></td>
                                    <td><%= (float) t.getPrice() / t.getQuantity() %></td>
                                    <td><%= t.getQuantity() %></td>
                                    <td><%=t.getPrice() %></td>
                                </tr>
                            <%}
                        }%> 
                        
                        <tr>
                                <td>Total amount:</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><%=request.getAttribute("receipt_amount")%></td>
                        </tr>
                    </table>
                    <div class="container-button">
                        <a href="Payment/PaymentMenu.jsp" class="btn btn-back">Back</a>
                        <button name="reser_id" value="<%=rs.getId()%>" type="submit" class="btn btn-confirm">Confirm</button>
                    </div>
                </form>
            </div>
        </main>
    </body>
</html>
