
namespace Cognizant.HRS.DataAccessLayer
{
  public class DataManagerConstants
	{
		#region "Stored Procedures for Hotel management"

		public static const string USP_CREATE_HOTEL = "Usp_CreateHotel_i";
		public static const string USP_UPDATE_HOTELS = "Usp_UpdateHotel_s";
		public static const string USP_READ_HOTELS_BY_CITY = "Usp_ReadHotelsByCity_s";
		public static const string USP_READ_HOTELS_BY_COUNTRY = "Usp_ReadHotelsByCountry_s";

		#endregion

		#region "Stored Procedures for Booking management"

		public static const string USP_CREATE_BOOKING = "Usp_CreateBooking_s";
		public static const string USP_READ_BOOKING_BY_ID = "Usp_ReadBookingById_s";
		public static const string USP_UPDATE_BOOKING_BY_ID = "Usp_UpdateBookingById_u";
		public static const string USP_DELETE_BOOKING_BY_ID = "Usp_DeleteBookingById_d";
		public static const string USP_READ_BOOKINGS_BY_CUSTOMER_ID = "Usp_ReadBookingsByCustomerId_s";

		#endregion

		#region "Stored Procedures for Customer management"

		public static const string USP_CREATE_CUSTOMER = "Usp_CreateCustomer_i";
		public static const string USP_READ_CUSTOMER_BY_ID = "Usp_ReadCustomerById_s";
		public static const string USP_UPDATE_CUSTOMER_PASSWORD_BY_ID = "Usp_UpdateCustomerPasswordById_u";

		#endregion

		#region "Stored Procedures for Transaction management"

		public static const string USP_CREATE_TRANSACTION = "Usp_CreateTransaction_i";
		public static const string USP_READ_TRANSACTION_BY_ID = "Usp_ReadTransactionById_s";

		#endregion
	}
}
