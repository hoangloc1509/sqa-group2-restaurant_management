<%-- 
    Document   : BookTableOnline
    Created on : Jan 3, 2022, 9:51:53 AM
    Author     : dotav
--%>
<%@page import="model.Table"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .vertical-center {
                margin: 0;
                position: absolute;
                top: 50%;
                -ms-transform: translateY(-50%);
                transform: translateY(-50%);
              }
        </style>
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/39e8541ce6.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="src/css/styles.css">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-primary navbar-dark">
            <a class="navbar-brand" href="Home.html">
              <img src="https://image.flaticon.com/icons/png/512/69/69524.png" style="width:42px;height:42px;">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
              <ul class="navbar-nav ">
                <li class="nav-item">
                  <a class="nav-link" href="MakeReser.jsp">Đặt bàn online</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="<%=request.getContextPath()%>/CheckReser">Đặt món online</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Xin chào</a>
                </li>    
              </ul>
              <ul class = "navbar-nav ml-auto">
                <li>
                    <button type="button" class="btn btn-info btn-round" data-toggle="modal" data-target="#loginModal">
                      Login
                    </button>
                </li>
              </ul>
            </div>  
          </nav>
        <div class="container" style="margin-top:30px">
            <form class="form-inline" action="SearchTable">
            <div class="form-group">
              <label for="email">Enter date</label>
              <input placeholder="yyyy-mm-dd" name ="date" type="text" class="form-control" id="email" >
            </div>
            <div class="form-group">
              <label for="pwd">Select time</label>
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
            <div class ="text-right" >
                <button type="submit"><i class="fa fa-search"></i></button>
            </div>
          </form>
        </div>
        <div class ="container">
            <form action = "BookTableConfirm" method = "post" >
                <table class ="table">
                    <tr bgcolor="2684d1">
                        <th><b>Stt</b></th>
                        <th><b>Bàn</b></th>
                        <th><b>Số chỗ</b></th>
                        <th></th>
                    </tr>
                    <%! int i=0; %>  
                    <% ArrayList<Table> tbl = (ArrayList<Table>)request.getAttribute("tablelist");
                    Object time = request.getAttribute("bookedTime");
                    if (time != null) {
                        out.println("<h1>Servlet test at " + time.toString() + "</h1>");
                        request.setAttribute("choosenTime", time);
                    }
                    if (tbl != null)
                    for (Table t: tbl){%>
                    <% i++; %>  
                        <tr>
                            <td><%=i%></td>
                            <td><%=t.getId()%></td>
                            <td><%=t.getCapacity()%></td>
                            <td><input type="checkbox" name="tableid" value= "<%= t.getId()%>"/>   </td>
                        </tr>
                    <%}%>
                </table>
                <div class ="container">
                    <div class="form-outline mb-4">
                         <label for="email">Name:</label>
                        <input type="text" id="typeEmailX-2" class="form-control form-control-lg" name="clientname" />
                    </div>
                    <div>
                         <label for="email">Phone:</label>
                        <input type="text" id="typeEmailX-3" class="form-control form-control-lg" name="clientphone" />
                    </div>
                    <div>
                         <label for="email">Booktime</label>
                        <input type="text" id="typeEmailX-3" class="form-control form-control-lg" name="timebooked" value ='<%=request.getAttribute("bookedTime")%>' readonly/>
                    </div>
                    <div>
                        <br>
                    </div>
                    <div class="row">
                        <div class="col text-center">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

    </body>
</html>
