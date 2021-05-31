using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HotelBooking.Models
{
    public class BookingDetailModel
    {
        public int RoomBookingID { get; set; }
        public DateTime? BookedFrom { get; set; }
        public DateTime? BookedUntil { get; set; }
        public string BookingStatus { get; set; }
        public string PaymentPaidStatus { get; set; }

        public int NoOfRoomsBook { get; set; }
        public BookingDetailModel(int RoomBookingID,DateTime? BookedFrom,DateTime? BookedUntil, int NoOfRoomsBook,string BookingStatus,string PaypentPaidStatus)
        {
            this.RoomBookingID = RoomBookingID;
            this.BookedFrom = BookedFrom;
            this.BookedUntil = BookedUntil;
            this.BookingStatus = BookingStatus;
            this.PaymentPaidStatus = PaymentPaidStatus;
            this.NoOfRoomsBook = NoOfRoomsBook;
        }
    }
}