<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="HotelBooking.Booking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script>
        function Booking() {
            var insert = {};
          
            insert.BookedFrom = $("#dateCheckIn").val();
            insert.BookedUntil = $("#dateCheckOut").val();
            insert.BookingStatus = $("#hotels").val();
            insert.PaymentPaidStatus = $("#payment").val();
            insert.CustomerID = $("#customerID").val();
            insert.HotelID = $("#hotelID").val();
            insert.NoOfRoomsBook = $("#rooms").val();



            $.ajax({
                url: "https://localhost:44385/api/BookHotel",
                type: "POST",
                contentType: "Application/json;charset=utf-8",
                data: JSON.stringify(insert),
                dataType: "json",
                success: function (response) {
                    alert(response);
                    window.location.href = "RoomBookingID.aspx"
                }
                
            });
        }

        $(document).ready(function () {
            $("#submit").click(function (e) {
                Booking();
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
            <label> Check-In </label>
           <input type="date" id="dateCheckIn"  name="Date" />  
            <label> Check-Out </label>
           <input type="date" id="dateCheckOut"  name="Date" />  
             <label>Booking Status </label>
            <select name="Hotel" id="hotels" class="selection">
                 <option value="Confirmed">Confirmed</option>
                 <option value="Pending">Pending</option>                
             </select>
            <label>Payment Paid Status</label>
            <select name="Payment" id="payment" class="selection">
                 <option value="Paid">Paid</option>
                 <option value="Pending">Pending</option>                
             </select>
            <label>Enter Your Customer ID </label>   
            <input type="number" id="customerID" name="CustomerID" /> 
            <label>Enter Your Hotel ID </label>   
            <input type="number" id="hotelID" name="HotelID" /> 
            <label>No of Rooms </label>
            <select name="Rooms" id="rooms" class="selection">
                 <option value="1">1</option>
                 <option value="2">2</option>  
                 <option value="3">3</option>
                 <option value="4">4</option>  
                 <option value="5">5</option>
                 <option value="6">6</option>  
                
             </select>
            <button type="submit" id="submit">Booking Confirm</button> 
            <p style="text-align:center">If you want to sign out!<a href="CustomerSignIn.aspx">Click Here!</a></p>

        </div>
    </form>
</body>
</html>
