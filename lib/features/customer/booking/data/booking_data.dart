import 'package:fixly/features/customer/booking/models/booking_model.dart';

/// Sample booking data for demonstration
class BookingData {
  /// Sample technicians
  static final List<TechnicianInfo> _sampleTechnicians = [
    const TechnicianInfo(
      id: 'TECH001',
      name: 'Ahmed Hassan',
      phoneNumber: '+20123456789',
      rating: 4.8,
    ),
    const TechnicianInfo(
      id: 'TECH002',
      name: 'Mohamed Ali',
      phoneNumber: '+20123456790',
      rating: 4.6,
    ),
    const TechnicianInfo(
      id: 'TECH003',
      name: 'Sara Ahmed',
      phoneNumber: '+20123456791',
      rating: 4.9,
    ),
    const TechnicianInfo(
      id: 'TECH004',
      name: 'Hassan Mahmoud',
      phoneNumber: '+20123456792',
      rating: 4.7,
    ),
  ];

  /// Sample bookings data
  static final List<BookingModel> sampleBookings = [
    BookingModel(
      id: 'BK001',
      service: 'Electrical Repair',
      technician: _sampleTechnicians[0],
      status: BookingStatus.upcoming,
      date: 'Today, 2:30 PM',
      location: '123 Main St, Cairo',
      price: 45.0,
      estimatedTime: '1-2 hours',
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      scheduledAt: DateTime.now().add(const Duration(hours: 4)),
    ),
    BookingModel(
      id: 'BK002',
      service: 'Plumbing',
      technician: _sampleTechnicians[1],
      status: BookingStatus.inProgress,
      date: 'Now',
      location: '456 Oak Ave, Giza',
      price: 35.0,
      estimatedTime: '30 min remaining',
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      scheduledAt: DateTime.now().subtract(const Duration(minutes: 30)),
    ),
    BookingModel(
      id: 'BK003',
      service: 'AC Repair',
      technician: _sampleTechnicians[2],
      status: BookingStatus.completed,
      date: 'Yesterday, 10:00 AM',
      location: '789 Pine St, Alexandria',
      price: 60.0,
      estimatedTime: 'Completed in 45 min',
      createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
      scheduledAt: DateTime.now().subtract(const Duration(days: 1, hours: 1)),
      completedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    BookingModel(
      id: 'BK004',
      service: 'Carpentry',
      technician: _sampleTechnicians[3],
      status: BookingStatus.cancelled,
      date: '2 days ago, 3:00 PM',
      location: '321 Elm St, Cairo',
      price: 80.0,
      estimatedTime: 'Cancelled',
      createdAt: DateTime.now().subtract(const Duration(days: 2, hours: 3)),
      scheduledAt: DateTime.now().subtract(const Duration(days: 2, hours: 1)),
      notes: 'Cancelled due to technician unavailability',
    ),
    BookingModel(
      id: 'BK005',
      service: 'Painting',
      technician: _sampleTechnicians[0],
      status: BookingStatus.upcoming,
      date: 'Tomorrow, 9:00 AM',
      location: '654 Maple Ave, Giza',
      price: 120.0,
      estimatedTime: '2-3 hours',
      createdAt: DateTime.now().subtract(const Duration(hours: 6)),
      scheduledAt: DateTime.now().add(const Duration(days: 1, hours: -3)),
    ),
  ];

  /// Get bookings by status
  static List<BookingModel> getBookingsByStatus(BookingStatus status) {
    return sampleBookings.where((booking) => booking.status == status).toList();
  }

  /// Get all bookings
  static List<BookingModel> getAllBookings() {
    return List.from(sampleBookings);
  }

  /// Get booking by ID
  static BookingModel? getBookingById(String id) {
    try {
      return sampleBookings.firstWhere((booking) => booking.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Get upcoming bookings
  static List<BookingModel> getUpcomingBookings() {
    return getBookingsByStatus(BookingStatus.upcoming);
  }

  /// Get in-progress bookings
  static List<BookingModel> getInProgressBookings() {
    return getBookingsByStatus(BookingStatus.inProgress);
  }

  /// Get completed bookings
  static List<BookingModel> getCompletedBookings() {
    return getBookingsByStatus(BookingStatus.completed);
  }

  /// Get cancelled bookings
  static List<BookingModel> getCancelledBookings() {
    return getBookingsByStatus(BookingStatus.cancelled);
  }

  /// Get bookings count by status
  static int getBookingsCountByStatus(BookingStatus status) {
    return getBookingsByStatus(status).length;
  }

  /// Get service icon based on service type
  static String getServiceIcon(String service) {
    switch (service.toLowerCase()) {
      case 'electrical repair':
      case 'electricity':
        return 'Icons.electrical_services';
      case 'plumbing':
        return 'Icons.plumbing';
      case 'ac repair':
      case 'air conditioning':
        return 'Icons.ac_unit';
      case 'carpentry':
        return 'Icons.carpenter';
      case 'painting':
        return 'Icons.format_paint';
      default:
        return 'Icons.home_repair_service';
    }
  }

  /// Get service color based on service type
  static String getServiceColorHex(String service) {
    switch (service.toLowerCase()) {
      case 'electrical repair':
      case 'electricity':
        return '#FCD34D'; // Yellow
      case 'plumbing':
        return '#60A5FA'; // Blue
      case 'ac repair':
      case 'air conditioning':
        return '#34D399'; // Green
      case 'carpentry':
        return '#F59E0B'; // Orange
      case 'painting':
        return '#A78BFA'; // Purple
      default:
        return '#6B7280'; // Gray
    }
  }

  /// Update booking status
  static List<BookingModel> updateBookingStatus(
    String bookingId,
    BookingStatus newStatus,
  ) {
    final updatedBookings = sampleBookings.map((booking) {
      if (booking.id == bookingId) {
        return booking.updateStatus(newStatus);
      }
      return booking;
    }).toList();

    // Update the static list (in a real app, this would be handled by state management)
    sampleBookings.clear();
    sampleBookings.addAll(updatedBookings);

    return updatedBookings;
  }

  /// Get status-specific actions
  static List<String> getAvailableActions(BookingStatus status) {
    switch (status) {
      case BookingStatus.upcoming:
        return ['Call Technician', 'Cancel Booking'];
      case BookingStatus.inProgress:
        return ['Track Progress', 'Call Technician'];
      case BookingStatus.completed:
        return ['Book Again', 'Rate Service'];
      case BookingStatus.cancelled:
        return ['Book Again'];
    }
  }

  /// Get empty state message based on status
  static String getEmptyStateMessage(BookingStatus? status) {
    if (status == null) {
      return 'Your repair appointments will appear here';
    }

    switch (status) {
      case BookingStatus.upcoming:
        return 'You don\'t have any upcoming bookings.';
      case BookingStatus.inProgress:
        return 'No services are currently in progress.';
      case BookingStatus.completed:
        return 'You haven\'t completed any services yet.';
      case BookingStatus.cancelled:
        return 'You don\'t have any cancelled bookings.';
    }
  }
}
