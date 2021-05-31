<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerSignUp.aspx.cs" Inherits="SignUpPage.CustomerSignUp" %>

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
  background-size: cover;
}  
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
        </style>
</head>
<body>
       <h1 style="color:red; text-align:center; font-family:Cambria"  > SignUp </h1>  
    <form id="form1" runat="server" action="CustomerSignIn.aspx">
        <div>
            <div class="container">   
            <label>Enter Full Name : </label>   
            <input type="text" placeholder="Enter FullName" name="FirstName Lastname" />  
            <label>Email or UserName : </label>   
            <input type="text" placeholder="Enter Email" name="UserName" />  
            <label>Password : </label>   
            <input type="password" placeholder="Enter Password" name="password" />  
            <button type="submit">SignUp</button>   
            <p style="text-align:center">Already a Customer?<a href="CustomerSignIn.aspx">SignIn</a></p>  
              
        </div>   
            
        </div>
    </form>
</body>
</html>
