/// Enum for booking status
enum BookingStatus {
  upcoming,
  inProgress,
  completed,
  cancelled;

  /// Get display name for the status
  String get displayName {
    switch (this) {
      case BookingStatus.upcoming:
        return 'Upcoming';
      case BookingStatus.inProgress:
        return 'In Progress';
      case BookingStatus.completed:
        return 'Completed';
      case BookingStatus.cancelled:
        return 'Cancelled';
    }
  }

  /// Get status from string
  static BookingStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'upcoming':
        return BookingStatus.upcoming;
      case 'in-progress':
      case 'inprogress':
        return BookingStatus.inProgress;
      case 'completed':
        return BookingStatus.completed;
      case 'cancelled':
        return BookingStatus.cancelled;
      default:
        return BookingStatus.upcoming;
    }
  }
}

/// Model for technician information
class TechnicianInfo {
  final String id;
  final String name;
  final String? phoneNumber;
  final double? rating;
  final String? profileImage;

  const TechnicianInfo({
    required this.id,
    required this.name,
    this.phoneNumber,
    this.rating,
    this.profileImage,
  });

  /// Copy with method for updating technician info
  TechnicianInfo copyWith({
    String? id,
    String? name,
    String? phoneNumber,
    double? rating,
    String? profileImage,
  }) {
    return TechnicianInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      rating: rating ?? this.rating,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}

/// Model for booking data
class BookingModel {
  final String id;
  final String service;
  final TechnicianInfo technician;
  final BookingStatus status;
  final String date;
  final String location;
  final double price;
  final String estimatedTime;
  final DateTime createdAt;
  final DateTime? scheduledAt;
  final DateTime? completedAt;
  final String? notes;

  const BookingModel({
    required this.id,
    required this.service,
    required this.technician,
    required this.status,
    required this.date,
    required this.location,
    required this.price,
    required this.estimatedTime,
    required this.createdAt,
    this.scheduledAt,
    this.completedAt,
    this.notes,
  });

  /// Get formatted price string
  String get formattedPrice {
    return '${price.toStringAsFixed(0)} EGP';
  }

  /// Check if booking can be cancelled
  bool get canBeCancelled {
    return status == BookingStatus.upcoming;
  }

  /// Check if booking can be tracked
  bool get canBeTracked {
    return status == BookingStatus.inProgress;
  }

  /// Check if booking can be rebooked
  bool get canBeRebooked {
    return status == BookingStatus.completed ||
        status == BookingStatus.cancelled;
  }

  /// Check if technician can be called
  bool get canCallTechnician {
    return (status == BookingStatus.upcoming ||
            status == BookingStatus.inProgress) &&
        technician.phoneNumber != null;
  }

  /// Copy with method for updating booking
  BookingModel copyWith({
    String? id,
    String? service,
    TechnicianInfo? technician,
    BookingStatus? status,
    String? date,
    String? location,
    double? price,
    String? estimatedTime,
    DateTime? createdAt,
    DateTime? scheduledAt,
    DateTime? completedAt,
    String? notes,
  }) {
    return BookingModel(
      id: id ?? this.id,
      service: service ?? this.service,
      technician: technician ?? this.technician,
      status: status ?? this.status,
      date: date ?? this.date,
      location: location ?? this.location,
      price: price ?? this.price,
      estimatedTime: estimatedTime ?? this.estimatedTime,
      createdAt: createdAt ?? this.createdAt,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      completedAt: completedAt ?? this.completedAt,
      notes: notes ?? this.notes,
    );
  }

  /// Update booking status
  BookingModel updateStatus(BookingStatus newStatus) {
    return copyWith(
      status: newStatus,
      completedAt: newStatus == BookingStatus.completed
          ? DateTime.now()
          : completedAt,
    );
  }
}
