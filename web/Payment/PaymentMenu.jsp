<%-- 
    Document   : PaymentMenu.jsp
    Created on : Mar 29, 2022, 2:39:10 PM
    Author     : dotav
--%>

<%@page import="model.Reser"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/751531ee24.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <title>Payment Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-primary navbar-dark">
            <a class="navbar-brand" href="Home.html">
              <img src="" style="width:42px;height:42px;">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
              <ul class="navbar-nav ">
                <li class="nav-item">
                  <a class="nav-link" href="PaymentMenu.jsp">Thanh toán</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Xin chào</a>
                </li>    
            </div>  
        </nav>
        <div class ="row mt-4 ml-4">

                <div class="row">
                    <div class="ml-6">Enter client name:</div>
                    <div class="search_box ml-2">
                        <div class="search_field">
                            <input type="text" class="form-group" id="clientname">
                        </div>
                    </div>
                    <div class="ml-2">
                        <button onclick="loadReser()" ><i class="fa fa-search ml-"></i></button>
                    </div>
                </div>

        </div>
        <div id="content">
            <div>
                
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script>
                function loadReser() {
                    $.ajax({
                        url:"/RestaurantManagement/SearchReser",
                        type : "get",
                        data: {
                            clientname : document.querySelector('#clientname').value
                        },
                        success: function(data){
                            var row = document.getElementById("content");
                            row.innerHTML = data;
                        },
                        error: function(xhr){
                            
                        }
                    });
                }
            </script>
    </body>
</html>
