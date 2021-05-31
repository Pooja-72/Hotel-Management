using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HotelBooking.Models
{
    public class CustomerModel
    {
        public int CustomerID { get; set; }

        public string CustomerName { get; set; }
        public string CustomerEmail { get; set; }
        public string CustomerPassword { get; set; }
        public CustomerModel(int CustomerID,string CustomerName,string CustomerEmail,string CustomerPassword)
        {
            this.CustomerID = CustomerID;
            this.CustomerName = CustomerName;
            this.CustomerEmail = CustomerEmail;
            this.CustomerPassword = CustomerPassword;
        }
    }
}