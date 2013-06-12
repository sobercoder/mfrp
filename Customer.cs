using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Cognizant.HRS.BusinessEntities {
  /// <summary>
	/// Representation of a Customer as an entity
	/// </summary>
	public class Customer {
		#region "Public Properties"

		public string CustomerId { get; set; }
		public string Password { get; set; }
		public string CustomerName { get; set; }
		public DateTime DateOfBirth { get; set; }
		public int Age { get; set; }
		public string CustomerType { get; set; }
		public string Email { get; set; }
		public string Phone { get; set; }
		public string City { get; set; }
		public string State { get; set; }
		public string Country { get; set; }
		public int PinCode { get; set; }

		#endregion
	}
}
