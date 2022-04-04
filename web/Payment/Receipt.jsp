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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/751531ee24.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <title>Receipt Page</title>
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
                  <a class="nav-link" href="Payment/PaymentMenu.jsp">Thanh toán</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Xin chào</a>
                </li>    
            </div>  
        </nav>
        <div>
            <h4>Receipt information</h4>
            <% Reser rs = (Reser) request.getAttribute("reser"); %>
            <p>Receipt ID: <%=rs.getId()%> </p>
            <p>Checkin time: <%=rs.getDate() +" "+ rs.getTime() %> </p>
        </div>
        <div>
            <h4>Customer information</h4>
            <p>Customer name:<%=rs.getName()%> </p>
            <p>Customer phone: <%=rs.getPhone()%> </p>
        </div>
        <div>
            <h4>List of ordered:</h4>
            <form action="SaveReceipt">
                <table class ="table mt-4">
                    <tr bgcolor="2684d1">
                        <th><b>Stt</b></th>
                        <th><b>Tên món</b></th>
                        <th><b>Đơn giá</b></th>
                        <th><b>Số lượng</b></th>
                        <th><b>Tổng tiền</b></th>
                        <th></th>
                    </tr>
                    <% List<DishOrdered> tbl = (ArrayList<DishOrdered>)request.getAttribute("list_dishordered");
                    if (tbl != null){
                        int i=0;
                        for (DishOrdered t: tbl){%>
                        <% i++; %>  
                            <tr>
                                <td><%=i%></td>
                                <td><%=t.getName()%></td>
                                <td><%= (float) t.getPrice() / t.getQuantity() %></td>
                                <td><%= t.getQuantity() %></td>
                                <td><%=t.getPrice() %></td>
                            </tr>
                        <%}
                    }%> 
                    
                    <tr>
                            <td>Tổng</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><%=request.getAttribute("receipt_amount")%></td>
                            <td></td>
                    </tr>
                </table>
                <div class="container">
                    <a href="Payment/PaymentMenu.jsp" class="btn btn-primary mr-auto">Back</a>
                    <button name="reser_id" value = "<%=rs.getId()%>"type="submit" class="btn btn-primary ml-auto">Xác nhận</button>
                </div>
            </form>
        </div>
    </body>
</html>
