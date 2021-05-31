<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancelBooking.aspx.cs" Inherits="HotelBooking.CancelBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script>
        function Delete() {
            var insert = {};
            insert.RoomBookingID = $("#booking").val();
            //insert.CustomerEmail = $("#email").val();
            //insert.CustomerPassword = $("#password").val();

            $.ajax({
                url: "https://localhost:44385/api/CancelBooking",
                type: "POST",
                contentType: "Application/json;charset=utf-8",
                data: JSON.stringify(insert),
                dataType: "json",
                success: function (response) {
                    alert(response);
                }
                
            });
        }

        $(document).ready(function () {
            $("#submit").click(function (e) {
                Delete();
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
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
       <h1 style="color:rosybrown; text-align:center; font-family:'Comic Sans MS' " > Cancel Booking Page </h1> 
            <label>Enter RoomBookingID : </label>   
            <input type="number" id="booking" placeholder="Enter ID" name="BookingID" />  
            <button type="submit" id="submit">Cancel Booking</button>   
            <p style="text-align:center">To Sign Out,<a href="CustomerSignIn.aspx">Click Here!</a></p>

        </div>
    </form>
</body>
</html>
