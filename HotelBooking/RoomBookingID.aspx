<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomBookingID.aspx.cs" Inherits="HotelBooking.RoomBookingID" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script>
        function BookingDetails() {
            var insert = {};
          
            insert.RoomBookingID = $("#booking").val();
           

            $.ajax({
                url: "https://localhost:44385/api/BookedHotel/CheckBookingDetails",
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
                BookingDetails();
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
       
        input[type=text], input[type=password], input[type=date],input[type=number]{   
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
         .selection{
             width: 100%;   
        margin: 8px 0;  
        padding: 12px 20px;   
        display: inline-block;   
        border: 2px solid green;   
        box-sizing: border-box;   
         }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
         <h1 style="color:rosybrown; text-align:center; font-family:'Comic Sans MS' " > Booking Details </h1> 

            <label>Enter Your BookingID To know the details</label>
            <input type="text" id="booking"  name="BookingID" />  
            
            <button type="submit" id="submit">Booking Details</button>
            
            <p style="text-align:center">If you want to sign out!<a href="CustomerSignIn.aspx">Click Here!</a></p>
            <b><p style="text-align:center; font-family:Arial">Cancel Booking? <a href="CancelBooking.aspx">Click here!</a></p></b>

        </div>
    </form>
</body>
</html>
