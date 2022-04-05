<%-- 
    Document   : SelectFood
    Created on : Mar 20, 2022, 10:18:44 PM
    Author     : dotav
--%>
<%@page import="model.Dish"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Food</title>

        <!-- CSS only -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Pinyon+Script&family=Rubik:wght@400;500;700&display=swap"
            rel="stylesheet"
        />

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/general.css" />

        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        />

        

        <script src="https://kit.fontawesome.com/751531ee24.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </head>
    <body class="menu-page">
        <header class="header">
            <a href="ClientHomepage.jsp">
              <img src="${pageContext.request.contextPath}/css/img/Logo.png" class="logo" />
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
        
        <div class="container container-menu">
          <div class="search-order-box">
            <div class="search-box">
              <h1 class="search-text">Search dish</h1>
              <form class="form-search" action="<%=request.getContextPath()%>/SearchFood">
                <div class="search_field">
                  <input type="text" class="form-group" placeholder="Search" name="dishname">
                </div>
                <select class="select-type" id="times" name="type">
                  <option value="all">All</option>
                  <option value="appetit">Appetizer</option>
                  <option value="main">Main course</option>
                  <option value="dessert">Dessert</option>
                  <option value="drink">Drink</option>
                </select>
                <div>
                  <button class="search-icon" type="submit"><i class="fa fa-search "></i></button>
                </div>       
              </form>
            </div>

            <div class="order-box">
              <c:forEach items="${listDish}" var="o">
                <!-- <div class="col-12 col-md-6 col-lg-4"> -->
                  <div class="card-dish">
                    <img class="card-dish-img" src="${o.image}" alt="Card image cap">
                    <div class="card-dish-body">
                      <div class="card-dish-info">
                        <h4 class="card-dish-name">${o.name}</h4>
                        <p class="card-dish-text">${o.description}</p>       
                      </div>           
                      <p class="card-dish-price">${o.price}<sup>đ</sup></p>         
                      <form class="card-dish-form" action="OrderDish">                      
                        <div class="value-button" id="decrease" onclick="decreaseValue()" value="Decrease Value"></div>
                        <input class="dish-quantity" type="number" id="number" value="0" name="quantity"/>
                        <div class="value-button" id="increase" onclick="increaseValue()" value="Increase Value"></div>                      
                        <button name="food_id" value = "${o.id}" type = submit class="button btn-order">Order</button>
                      </form>
                    </div>
                  </div>
                <!-- </div> -->
              </c:forEach>
            </div>
          </div>

          <div class="order-list">
            <h1 class="order-text">Order list</h1>
            <div class="ordered-dishes">
              <c:forEach items="${list_order}" var="o">
                <div class="ordered-dish">                
                  <p>${o.name}</p>               
                  <p>${o.quantity}</p>               
                  <p>${o.price}<sup>đ</sup></p>
                </div>
              </c:forEach>
            </div>
            <form class="submit-form" action="<%=request.getContextPath()%>/SaveReser">
              <button name="reser_id" type = submit class="button btn-order" >Order</button>
            </form>
          </div>
        </div>
    </body>
</html>
