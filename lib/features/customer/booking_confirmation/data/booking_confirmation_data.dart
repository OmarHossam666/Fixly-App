import '../models/booking_confirmation_model.dart';

class BookingConfirmationData {
  static BookingConfirmationModel createBookingConfirmation({
    required String technicianName,
    required String technicianTier,
    required String technicianPhoto,
    required String serviceName,
    required int visitFee,
    required String address,
    required String distance,
    required String estimatedArrival,
  }) {
    final bookingId = _generateBookingId();

    return BookingConfirmationModel(
      bookingId: bookingId,
      technicianName: technicianName,
      technicianTier: technicianTier,
      technicianPhoto: technicianPhoto,
      serviceName: serviceName,
      serviceType: '$serviceName Repair',
      visitFee: visitFee,
      address: address,
      distance: distance,
      estimatedArrival: estimatedArrival,
      technicianLocation: const TechnicianLocationModel(
        latitude: 30.0444,
        longitude: 31.2357,
        lastUpdated: null,
      ),
      status: BookingStatus.confirmed,
    );
  }

  static String _generateBookingId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = (timestamp % 100000).toString().padLeft(5, '0');
    return 'FX$random';
  }

  static List<TechnicianLocationModel> getLocationUpdates() {
    return [
      TechnicianLocationModel(
        latitude: 30.0444,
        longitude: 31.2357,
        lastUpdated: DateTime.now(),
      ),
      TechnicianLocationModel(
        latitude: 30.0454,
        longitude: 31.2367,
        lastUpdated: DateTime.now().add(const Duration(minutes: 3)),
      ),
      TechnicianLocationModel(
        latitude: 30.0464,
        longitude: 31.2377,
        lastUpdated: DateTime.now().add(const Duration(minutes: 6)),
      ),
    ];
  }

  static const List<String> trackingMessages = [
    "Your technician is preparing to leave",
    "Technician is on the way to your location",
    "Technician is nearby, arriving soon",
    "Technician has arrived at your location",
  ];
}
