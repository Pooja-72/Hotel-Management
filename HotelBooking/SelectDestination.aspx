<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectDestination.aspx.cs" Inherits="HotelBooking.SelectDestination" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script>
        function SelectDestination() {
            var insert = {};
            insert.City = $("#cities").val();
            insert.HotelName = $("#hotels").val();
            

            $.ajax({
                url: "https://localhost:44385/api/Hotels/Destination",
                type: "POST",
                contentType: "Application/json;charset=utf-8",
                data: JSON.stringify(insert),
                dataType: "json",
                success: function (response) {
                    alert(response);
                    window.location.href = "Booking.aspx"
                }
                
            });
        }

        $(document).ready(function () {
            $("#submit").click(function (e) {
                SelectDestination();
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
       
        input[type=text], input[type=password], {   
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
            <h1 style="color:rosybrown; text-align:center; font-family:'Comic Sans MS' " > Chose Your Destinantion </h1>
            <label>Enter City : </label>
            <select name="City" id="cities" class="selection">
                <option value="Delhi">Delhi</option>
                <option value="Mumbai">Mumbai</option>
                <option value="Rohtak">Rohtak</option>
                <option value="Patna">Patna</option>
                <option value="Bihar">Bihar</option>
                <option value="Dehradun">Dehradun</option>
                <option value="Hisar">Hisar</option>
            </select>
            <label>Enter Hotel Name : </label>
             <select name="Hotel" id="hotels" class="selection">
                 <option value="OYO">OYO</option>
                 <option value="OYO Townhouse">OYO Townhouse</option>
                 <option value="Ramada">Ramada</option>
                 <option value="Riyasat">Riyasat</option>
                 <option value="Gazania">Gazania</option>
                <option value="Five Star">Five Star</option>
                <option value="Maharaja">Maharaja</option>
             </select>
            <button type="submit" id="submit">Book Hotel</button>
           
            

            <p style="text-align:center">To check only available hotel!<a href="AvailableHotels.aspx">Click Here!</a></p>
            
            <p style="text-align:center">If you want to sign out!<a href="CustomerSignIn.aspx">Click Here!</a></p>

        </div>
    </form>
</body>
</html>
