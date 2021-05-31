<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerSignIn.aspx.cs" Inherits="HotelBooking.CustomerSignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script>
        function SignIn() {
            var insert = {};
          
            insert.CustomerEmail = $("#email").val();
            insert.CustomerPassword = $("#password").val();

            $.ajax({
                url: "https://localhost:44385/api/Customers/SignIn",
                type: "POST",
                contentType: "Application/json;charset=utf-8",
                data: JSON.stringify(insert),
                dataType: "json",
                success: function (response) {
                    alert(response);
                   // Response.Redirect("SelectDestination.aspx");
                    window.location.href = "SelectDestination.aspx";
                },
                fail: function (response) {
                    alert(response);
                }
                
                //success: Response.Redirect("SelectDestination.aspx");
            });
        }

        $(document).ready(function () {
            $("#submit").click(function (e) {
                SignIn();
                e.preventDefault();
            });
        });
    </script>
    <style>
        Body {  
             font-family: Calibri, Helvetica, sans-serif;
             background-image: url('hotelbg.jpg');
             background-repeat: no-repeat;
             background-attachment: fixed;  
             background-size: cover;
            } 
        image{
            opacity:0.3
        }
        button {   
             background-color: greenyellow;   
             width: 100%;  
             color: orangered;   
             padding: 15px;   
             margin: 10px 0px;   
            border: none;   
            cursor: pointer;   
         }   
       
        input[type=text], input[type=password] {   
        width: 100%;   
        margin: 8px 0;  
        padding: 12px 20px;   
        display: inline-block;   
        border: 2px solid green;   
        box-sizing: border-box;   
    }  
         button:hover {   
        opacity: 0.7;   
    }   
         .container {   
        padding: 25px;   
        background-color: lightyellow;
        width:60%;
       
        border: 3px solid green;
        margin:auto
    }  
    </style>
    <script>
        function myFunction() {
            var x = document.getElementById("password");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server" action="SelectDestination.aspx">
        <div class="container">
            <h1 style="color:rosybrown; text-align:center; font-family:'Comic Sans MS' " > SignIn Page </h1> 
           
            <label>Enter Email or UserName : </label>   
            <input type="text" id="email" placeholder="Enter Email" name="UserName" />  
            <label>Enter Password : </label>   
            <input type="password" id="password" placeholder="Enter Password" name="password" />  
            <input type="checkbox" onclick="myFunction()" />Show Password

            <button type="submit" id="submit">SignIn</button>   
            <p style="text-align:center">Not a Customer?<a href="CustomerSignUp.aspx">SignUp</a></p> 
            
            <b><p style="text-align:center; font-family:Arial">If Already Booked and to know the details, <a href="RoomBookingID.aspx">Click here!</a></p></b>
            <p style="text-align:center">To check all hotels and their destinations!<a href="DisplayHotels.aspx">Click Here!</a></p>

        </div>
    </form>
</body>
</html>
