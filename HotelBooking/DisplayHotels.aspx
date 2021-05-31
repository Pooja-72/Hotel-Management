<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisplayHotels.aspx.cs" Inherits="HotelBooking.DisplayHotels" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
               
                Body {  
  font-family: Calibri, Helvetica, sans-serif;
  background-image: url('hotelbg.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;}  

img {
  opacity: 0.5;
}

button {   
       background-color: #4CAF50;   
       width: 100%;  
        color: orange;   
        padding: 15px;   
        margin: 10px 0px;   
        border: none;   
        cursor: pointer;   
         }   
 form {   
        border: 3px solid #f1f1f1;   
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
  .cancelbtn {   
        width: auto;   
        padding: 10px 18px;  
        margin: 10px 5px;  
    }   
        
     
 .container {   
        padding: 25px;   
        background-color: lightyellow;  
    }  
 .selecting{
     width: 100%;   
        margin: 8px 0;  
        padding: 12px 20px;   
        display: inline-block;   
        border: 2px solid green;   
        box-sizing: border-box;   
    }
 .display{
     width: 60%;   
        margin: 8px 0;  
        padding: 12px 20px;   
        display: inline-block;   
        border: 2px solid green;   
        box-sizing: border-box;   
        background-color:antiquewhite;
        text-align:center;
 }
        </style>
 
    
</head>
<body>
    <form id="form1" runat="server" >
        <div class="container">
            <h1 style="text-align:center">Hotels List</h1>
            <hr />
            <center>
            <asp:GridView ID="GridView2" runat="server" class="display"></asp:GridView>
            </center>
            <p style="text-align:center">Want to Go Back to Booking Page?<a href="SelectDestination.aspx">Click Here</a></p> 
        </div>
    </form>
</body>
</html>
