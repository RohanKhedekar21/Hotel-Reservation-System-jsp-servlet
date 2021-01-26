<%-- 
    Document   : adminlogin
    Created on : Apr 1, 2020, 3:06:53 PM
    Author     : rohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="Javascript/Javascript.js" type="text/javascript"></script>
        <link href="Css/Css.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <title>Admin-Hotel Reservation System</title>
        <style>
            #background{
                padding: 130px 35% 0 35%;
            }
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
            input{
                width: 300px;
                height: 25px;
                margin: auto;
            }
            .button{
                border: none;
                outline: none;
                background: none;
                background-color: maroon;
                color: white;
                border: 1px solid black;
                border-radius: 30px;
                height: 35px;
                width: 70px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div id="background">
            <div>
                <h1>Hotel Reservation System</h1>
            </div>
            <div style="background-color: white;margin-top: 30px;">
                <div style="width: 40%;margin-left: 5%;padding: 40px">
                
                    <h1 style="text-align: left;">Login</h1>
                
                    <hr style="height: 3px;background-color: #f1cd8f;border: none;">
                    <br><br>
                
                    <label for="MobileNo">Enter Mobile Number:</label>
                    <br>
                    <input type="texx" id="username" name="username" maxlength="10" placeholder="Username" required/>
                    
                    <br><br>
                    <label for="MobileNo">Password:</label>
                    <br>
                    <input type="password" id="password" name="password" placeholder="Password" required/>
                    
                    <br><br>
                    <button class="button" onclick="adminlogin()">Login</button>
                </div>
            </div>
        </div>
    </body>
</html>
