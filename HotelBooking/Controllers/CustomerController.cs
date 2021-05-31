using HotelBooking.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace HotelBooking.Controllers
{
    public class CustomerController : ApiController
    {
        [Route("api/Customer")]
        [HttpGet]
        public IEnumerable<CustomerModel> ListCustomers()
        {
            HotelAPIEntities entities = new HotelAPIEntities();
            List<CustomerModel> list = new List<CustomerModel>();
            foreach(Customer customer in entities.Customers)
            {
                CustomerModel cm = new CustomerModel(customer.CustomerID, customer.CustomerName, customer.CustomerEmail, customer.CustomerPassword);
                list.Add(cm);
            }
            return list;
        }

        [Route("api/Customers/SignIn")]
        [HttpPost]
        public HttpResponseMessage SignIn(Customer customer)
        {
            HotelAPIEntities entities = new HotelAPIEntities();
            List<CustomerModel> list = new List<CustomerModel>();
            Customer user = entities.Customers.FirstOrDefault(bookingg => bookingg.CustomerEmail == customer.CustomerEmail && bookingg.CustomerPassword==customer.CustomerPassword);
            if (user != null)
            {
                CustomerModel cm = new CustomerModel(user.CustomerID, user.CustomerName, user.CustomerEmail, user.CustomerPassword);
                list.Add(cm);
                return Request.CreateResponse(HttpStatusCode.OK,"User is being Logged in. Your CustomerID is "+user.CustomerID);
              
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, "Record doesnot exist");
            }
        }

        [Route("api/Customers")]
        [HttpPost]
        public HttpResponseMessage SignUp(Customer customer)
        {
            HotelAPIEntities entities = new HotelAPIEntities();
            Customer user = entities.Customers.FirstOrDefault(customerr => customerr.CustomerEmail == customer.CustomerEmail);
            if (user == null)
            {
                entities.Customers.Add(customer);
                entities.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, "Record Added Successfully. Your Customer ID is "+customer.CustomerID);
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.Found, "Already exists");
            }

        }
    }
}
