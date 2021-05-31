using HotelBooking.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Globalization;

namespace HotelBooking.Controllers
{
    public class BookingController : ApiController
    {
        //[Route("api/BookHotel/")]
        //[HttpPost]
        //public HttpResponseMessage BookingHotel(BookingDetail booking)
        //{
        //    HotelAPIEntities entities = new HotelAPIEntities();
        //    BookingDetail detail = entities.BookingDetails.FirstOrDefault(bookingg => bookingg.HotelID == booking.HotelID);
        //    //Hotel hotel = entities.Hotels.FirstOrDefault(h => h.HotelID == booking.HotelID);

        //    if (detail == null)
        //    {
        //        return Request.CreateResponse(HttpStatusCode.NotFound, "This hotel does not exist");
        //    }
        //    else
        //    {

        //        entities.BookingDetails.Add(booking);
        //        entities.SaveChanges();
        //        return Request.CreateResponse(HttpStatusCode.OK, booking);
        //    }

        //}
        [Route("api/BookHotel")]
        [HttpPost]
        public HttpResponseMessage BookingHotel(BookingDetail booking)
        {
            HotelAPIEntities entities = new HotelAPIEntities();
            BookingDetailModel detail = null;
            
            Hotel hotel = entities.Hotels.FirstOrDefault(h => h.HotelID == booking.HotelID );
            if (hotel != null)
            {
                hotel.BookingsMade += booking.NoOfRoomsBook;
                hotel.PresentRoomAvailable -= booking.NoOfRoomsBook;
                entities.BookingDetails.Add(booking);
                entities.SaveChanges();
                detail = new BookingDetailModel(booking.RoomBookingID, booking.BookedFrom, booking.BookedUntil, booking.NoOfRoomsBook, booking.BookingStatus, booking.PaymentPaidStatus);
                return Request.CreateResponse(HttpStatusCode.OK, "Booking Has Been Made. Your Booking ID is " +detail.RoomBookingID);
               
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, "This hotel does not exist or donot have the capacity");
            }

        }
        [Route("api/BookedHotel/CheckBookingDetails")]
        [HttpPost]
        public HttpResponseMessage BookingDetail(BookingDetail booking1)
        {
            HotelAPIEntities entities = new HotelAPIEntities();
            List<BookingDetailModel> list = new List<BookingDetailModel>();
            BookingDetail booking = entities.BookingDetails.FirstOrDefault(b => b.RoomBookingID == booking1.RoomBookingID);
            if (booking != null)
            {
               BookingDetailModel bdm = new BookingDetailModel(booking.RoomBookingID, booking.BookedFrom, booking.BookedUntil, booking.NoOfRoomsBook, booking.BookingStatus, booking.PaymentPaidStatus);
               list.Add(bdm);
                return Request.CreateResponse(HttpStatusCode.OK, "Your Booking ID is "+booking.RoomBookingID+"...\nYour Check in is from "+booking.BookedFrom+"...\nYour Check Out Date is "+booking.BookedUntil+"....\nNumber of rooms you have booked are "+booking.NoOfRoomsBook);
                
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, "You have not booked yet");
            }
        }

        [Route("api/BookedHotelList/{CustomerID}")]
        [HttpGet]
        public List<BookingDetailModel> BookedHotelList(int CustomerID)
        {
            HotelAPIEntities entities = new HotelAPIEntities();
            List<BookingDetailModel> list = new List<BookingDetailModel>();
            List<BookingDetail> booking = entities.BookingDetails.Where(b => b.CustomerID == CustomerID).ToList();
            foreach(BookingDetail detail in booking)
            {
                BookingDetailModel bd = new BookingDetailModel(detail.RoomBookingID, detail.BookedFrom, detail.BookedUntil, detail.NoOfRoomsBook, detail.BookingStatus, detail.PaymentPaidStatus);
                list.Add(bd);
            }
            return list;
        }
        
        [Route("api/CancelBooking/")]
        [HttpPost]
        public HttpResponseMessage CancelBooking(BookingDetail bookingDetail)
        {
            HotelAPIEntities entities = new HotelAPIEntities();
            BookingDetail booking = entities.BookingDetails.FirstOrDefault(b => b.RoomBookingID == bookingDetail.RoomBookingID);
            
            if (booking == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, "This booking does not exist");
            }
            else
            {
                Hotel hotel = entities.Hotels.FirstOrDefault(h => h.HotelID == booking.HotelID);
                hotel.PresentRoomAvailable += booking.NoOfRoomsBook;
                hotel.BookingsMade -= booking.NoOfRoomsBook;
                entities.BookingDetails.Remove(booking);
                entities.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, "Booking has been cancelled");
            }
        }

        

    }
}