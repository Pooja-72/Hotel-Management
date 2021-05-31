using HotelBooking.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace HotelBooking.Controllers
{
    public class HotelController : ApiController
    {
        [Route("api/Hotels")]
        [HttpGet]
        public List<HotelModel> HotelList()
        {
            using(HotelAPIEntities entities= new HotelAPIEntities())
            {
                List<HotelModel> listOfHotel = new List<HotelModel>();
                foreach(Hotel hotel in entities.Hotels)
                {
                    HotelModel hm = new HotelModel(hotel.HotelID, hotel.City, hotel.HotelName, hotel.TotalRoomAvailable, hotel.PresentRoomAvailable, hotel.PricePerRoom,hotel.BookingsMade);
                    listOfHotel.Add(hm);
                }
                return listOfHotel;
            }
        }

        [Route("api/Hotels/Destination")]
        [HttpPost]
        public HttpResponseMessage HotelDetail(Hotel hotel)
        {
            HotelAPIEntities entities = new HotelAPIEntities();
            List<HotelModel> list = new List<HotelModel>();
            Hotel hotell = entities.Hotels.FirstOrDefault(hotelll => hotelll.City == hotel.City && hotelll.HotelName == hotel.HotelName && hotelll.PresentRoomAvailable>0);
            if (hotell != null)
            {
                HotelModel hm = new HotelModel(hotell.HotelID, hotell.City, hotell.HotelName, hotell.TotalRoomAvailable, hotell.PresentRoomAvailable, hotell.PricePerRoom, hotell.BookingsMade);
                list.Add(hm);
                return Request.CreateResponse(HttpStatusCode.OK, "Go to the booking page. Your Hotel ID is " + hotell.HotelID);
            }
            else
            {

                return Request.CreateResponse(HttpStatusCode.NotFound, "This hotel does not exist");

            }
        }
        
        //[Route("api/BookHotel/{City}/{HotelName}")]
        //[HttpPut]
        //public HttpResponseMessage BookHotel(string City,string HotelName)
        //{
        //    HotelAPIEntities entities = new HotelAPIEntities();
        //    Hotel hotel = entities.Hotels.FirstOrDefault(hotell => hotell.City == City && hotell.HotelName == HotelName);
        //    if (hotel == null)
        //    {
        //        return Request.CreateResponse(HttpStatusCode.NotFound, "This hotel does not exist");
        //    }
        //    else
        //    {
        //        hotel.PresentRoomAvailable = hotel.PresentRoomAvailable - 1;
        //        return Request.CreateResponse(HttpStatusCode.OK, "Hotel is booked at the price of " + hotel.PricePerRoom + " Per Room. Hotel has ID "+hotel.HotelID+" Add Booking Details Accordingly. Present Room available in hotel are "+hotel.PresentRoomAvailable);
        //    }
        //}

        [Route("api/AvailableHotels")]
        [HttpGet]
        public List<HotelModel> AvailableHotelsList()
        {
            HotelAPIEntities entities = new HotelAPIEntities();
            List<HotelModel> listOfHotel = new List<HotelModel>();
            List<Hotel> hotel = entities.Hotels.Where(h => h.PresentRoomAvailable>0).ToList();
            foreach(Hotel hotels in hotel)
            {
                HotelModel hm = new HotelModel(hotels.HotelID, hotels.City, hotels.HotelName, hotels.TotalRoomAvailable, hotels.PresentRoomAvailable,hotels.PricePerRoom, hotels.BookingsMade);
                listOfHotel.Add(hm);
            }
            return listOfHotel;
        }
    }
}


