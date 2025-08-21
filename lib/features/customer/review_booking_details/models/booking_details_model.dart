class BookingDetailsModel {
  final String address;
  final int visitFee;
  final String paymentMethod;
  final String? promoCode;
  final int? discount;

  const BookingDetailsModel({
    required this.address,
    required this.visitFee,
    required this.paymentMethod,
    this.promoCode,
    this.discount,
  });

  BookingDetailsModel copyWith({
    String? address,
    int? visitFee,
    String? paymentMethod,
    String? promoCode,
    int? discount,
  }) {
    return BookingDetailsModel(
      address: address ?? this.address,
      visitFee: visitFee ?? this.visitFee,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      promoCode: promoCode ?? this.promoCode,
      discount: discount ?? this.discount,
    );
  }
}

class ServiceDetailsModel {
  final String serviceName;
  final String serviceType;
  final String dateTime;
  final String estimatedArrival;

  const ServiceDetailsModel({
    required this.serviceName,
    required this.serviceType,
    required this.dateTime,
    required this.estimatedArrival,
  });
}
