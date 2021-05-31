using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HotelBooking.Models;
using System.Net.Http;

namespace HotelBooking
{
    public partial class DisplayHotels : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IEnumerable<HotelModel> hotels = null;
            HttpClient hc = new HttpClient();
            hc.BaseAddress = new Uri("https://localhost:44385/api/");


            var consumeapi = hc.GetAsync("Hotels");
            consumeapi.Wait();
            var readData = consumeapi.Result;
            if (readData.IsSuccessStatusCode)
            {
                var displayRecord = readData.Content.ReadAsAsync<IList<HotelModel>>();
                displayRecord.Wait();
                hotels = displayRecord.Result;
                GridView2.DataSource = hotels;
                GridView2.DataBind();
            }
        }
    }
}