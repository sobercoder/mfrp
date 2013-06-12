// Hotels.cs


namespace Cognizant.HRS.BusinessEntities
{
  /// <summary>
	/// Representation of a Hotel as an entity
	/// </summary>
	public class Hotel
	{
		#region "Public Properties"

		public string HotelId { get; set; }
		public string HotelName { get; set; }
		public string CityId { get; set; }
		public string? HotelDescription { get; set; }
		public int AcRoomsCount { get; set; }
		public int NonAcRoomsCount { get; set; }
		public int TotalRoomsCount { get; set; }

		#endregion

		#region "Constructors"

		private Hotel() { }

		public Hotel(string hotelId, string hotelName, string cityId, int acRoomsCount, int nonAcRoomsCount, int totalRoomsCount)
		{
			this.HotelId = hotelId;
			this.HotelName = hotelName;
			this.CityId = cityId;
			this.HotelDescription = null;
			this.AcRoomsCount = acRoomsCount;
			this.NonAcRoomsCount = nonAcRoomsCount;
			this.TotalRoomsCount = totalRoomsCount;
		}

		public Hotel(string hotelId, string hotelName, string cityId, string hotelDescription, int acRoomsCount, int nonAcRoomsCount, int totalRoomsCount)
		{
			this.HotelId = hotelId;
			this.HotelName = hotelName;
			this.CityId = cityId;
			this.HotelDescription = hotelDescription;
			this.AcRoomsCount = acRoomsCount;
			this.NonAcRoomsCount = nonAcRoomsCount;
			this.TotalRoomsCount = totalRoomsCount;
		}

		#endregion
	}
}


