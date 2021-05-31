using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HotelBooking.Models
{
    public class HotelModel
    {
        public int HotelID { get; set; }
        public string City { get; set; }
        public string HotelName { get; set; }
        public int? TotalRoomAvailable { get; set; }
        public int? PresentRoomAvailable { get; set; }
        public int? PricePerRoom { get; set; }

        public int? BookingsMade { get; set; }
        public HotelModel(int HotelID, string City,string HotelName,int? TotalRoomAvailable,int? PresentRoomAvailable,int? PricePerRoom, int? BookingsMade)
        {
            this.HotelID = HotelID;
            this.City = City;
            this.HotelName = HotelName;
            this.TotalRoomAvailable = TotalRoomAvailable;
            this.PresentRoomAvailable = PresentRoomAvailable;
            this.PricePerRoom = PricePerRoom;
            this.BookingsMade = BookingsMade;
        }
    }
}