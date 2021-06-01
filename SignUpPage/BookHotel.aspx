<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookHotel.aspx.cs" Inherits="SignUpPage.BookHotel" %>

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
  opacity: 0.6;
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
        </style>
 
    

</head>
<body>
    <p style="text-align:center"> Enter Your Destination </p>
    <form id="form1" runat="server">
        <div>
            <div class="container">  
                   <label>Chose City : </label>
                    <select id="City" name="cities" class="selecting">
                         <option value="Delhi">Delhi</option>
                         <option value="Dehradun">Dehradun</option>
                         <option value="Mumbai">Mumbai</option>
                         <option value="Rohtak">Rohtak</option>
                         <option value="Patna">Patna</option>
                         <option value="Bihar">Bihar</option>
                         <option value="Hisar">Hisar</option>

                    </select>
                <label>Chose Hotel :</label>
                <select id="Hotel" name="hotels" class="selecting">
                         <option value="Oyo">OYO</option>
                         <option value="Riyasat">Riyasat</option>
                         <option value="Ramada">Ramada</option>
                         <option value="OYO Townhouse">OYO Townhouse</option>
                         <option value="Gazania">Gazania</option>
                         <option value="Five Star">Five Star</option>
                         <option value="Maharaja">Maharaja</option>

                    </select>
                <button type="submit" >Check Availability</button>
            </div>
        </div>
    </form>
</body>
</html>
