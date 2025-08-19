import '../models/booking_details_model.dart';

class BookingDetailsData {
  static const BookingDetailsModel defaultBookingDetails = BookingDetailsModel(
    address: "123 Main Street, Apartment 4B, Cairo",
    visitFee: 50,
    paymentMethod: "Visa **** 1234",
  );

  static const List<String> availablePaymentMethods = [
    "Visa **** 1234",
    "Mastercard **** 5678",
    "Cash on Delivery",
  ];

  static ServiceDetailsModel getServiceDetails({
    required String serviceName,
    required String arrivalTime,
  }) {
    return ServiceDetailsModel(
      serviceName: serviceName,
      serviceType: "$serviceName Repair",
      dateTime: "Now",
      estimatedArrival: "Approx. arrival in $arrivalTime",
    );
  }
}
