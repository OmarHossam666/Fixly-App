class BookingConfirmationModel {
  final String bookingId;
  final String technicianName;
  final String technicianTier;
  final String technicianPhoto;
  final String serviceName;
  final String serviceType;
  final int visitFee;
  final String address;
  final String distance;
  final String estimatedArrival;
  final TechnicianLocationModel technicianLocation;
  final BookingStatus status;

  const BookingConfirmationModel({
    required this.bookingId,
    required this.technicianName,
    required this.technicianTier,
    required this.technicianPhoto,
    required this.serviceName,
    required this.serviceType,
    required this.visitFee,
    required this.address,
    required this.distance,
    required this.estimatedArrival,
    required this.technicianLocation,
    required this.status,
  });

  BookingConfirmationModel copyWith({
    String? bookingId,
    String? technicianName,
    String? technicianTier,
    String? technicianPhoto,
    String? serviceName,
    String? serviceType,
    int? visitFee,
    String? address,
    String? distance,
    String? estimatedArrival,
    TechnicianLocationModel? technicianLocation,
    BookingStatus? status,
  }) {
    return BookingConfirmationModel(
      bookingId: bookingId ?? this.bookingId,
      technicianName: technicianName ?? this.technicianName,
      technicianTier: technicianTier ?? this.technicianTier,
      technicianPhoto: technicianPhoto ?? this.technicianPhoto,
      serviceName: serviceName ?? this.serviceName,
      serviceType: serviceType ?? this.serviceType,
      visitFee: visitFee ?? this.visitFee,
      address: address ?? this.address,
      distance: distance ?? this.distance,
      estimatedArrival: estimatedArrival ?? this.estimatedArrival,
      technicianLocation: technicianLocation ?? this.technicianLocation,
      status: status ?? this.status,
    );
  }
}

class TechnicianLocationModel {
  final double latitude;
  final double longitude;
  final DateTime? lastUpdated;

  const TechnicianLocationModel({
    required this.latitude,
    required this.longitude,
    required this.lastUpdated,
  });

  TechnicianLocationModel copyWith({
    double? latitude,
    double? longitude,
    DateTime? lastUpdated,
  }) {
    return TechnicianLocationModel(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}

enum BookingStatus {
  confirmed,
  technicianEnRoute,
  technicianArrived,
  serviceInProgress,
  serviceCompleted,
  cancelled,
}
