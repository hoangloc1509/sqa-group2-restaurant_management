<%-- 
    Document   : AddStaff
    Created on : Mar 19, 2022, 12:12:59 AM
    Author     : dotav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Staff</title>
    </head>
    <body>
        <form action="upload" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" name="description" />
            </div>
            <br>
            <div class="form-group">
                <label for="photo">Photo:</label>
                <input type="file" name="file" />
            </div>
            <br>
            <input type="submit" />
        </form>
    </body>
</html>
