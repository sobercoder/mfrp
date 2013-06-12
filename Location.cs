
namespace Cognizant.HRS.BusinessEntities
{
  /// <summary>
	/// Representation of a Location as an entity
	/// </summary>
	public class Location
	{
		#region "Public Properties"

		public string CityId { get; set; }
		public string Country { get; set; }
		public string State { get; set; }
		public string City { get; set; }

		#endregion

		#region "Constructors"

		private Location() { }

		public Location(string cityId, string country, string state, string city)
		{
			this.CityId = cityId;
			this.Country = country;
			this.State = state;
			this.City = city;
		}

		#endregion
	}
}
