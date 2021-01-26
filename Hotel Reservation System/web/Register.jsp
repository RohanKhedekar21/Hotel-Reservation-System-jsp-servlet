<%-- 
    Document   : Register
    Created on : Mar 30, 2020, 7:13:13 PM
    Author     : rohan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel Reservation System</title>
        <style>
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
            input{
                width: 100%;
                height: 25px;
                margin: auto;
            }
            #button{
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
        <div style="background-color: white;margin-top: 30px;display: inline-flex;width: 100%;">
            <div style="width: 40%;margin-left: 5%;padding: 40px;">
                
                <h1 style="text-align: left;">Registration</h1>
                
                <hr style="height: 3px;background-color: #f1cd8f;border: none;"> 
                <br>
                
                <form  action="UserRegistration" method="post" onsubmit="return UserRegistrationValidation();">
                    <label for="Name">Enter Your Name:</label>
                    <br>
                    <input type="Text" id="Name" name="Name" required/>
                
                    <br><br>
                    <label for="Email">Enter Your Email:</label>
                    <br>
                    <input type="Email" id="Email" name="Email" required/>
                
                    <br><br>
                    <label for="MobileNo">Enter Your Number:</label>
                    <br>
                    <input type="number" id="number" name="number" oninput="javascript: if (this.value.length > 10) this.value = this.value.slice(0, 10);" required autocomplete="off" />
                
                    <br><br>
                    <label for="Password">Enter Password:</label>
                    <br>
                    <input type="password" id="password" required/>
                
                    <br><br>
                    <label for="Confirmpassword">Confirm Password:</label>
                    <br>
                    <input type="password" id="confirmpass" name="confirmpass" required/>
                
                    <br><br>
                    <button id="button" type="submit" value="Submit">Submit</button>
                    
                </form>
                
            </div>
            <div style="margin: auto;">
                <img src="images/hotel-booking.jpg" alt=""/>
            </div>
        </div>
    </body>
</html>
