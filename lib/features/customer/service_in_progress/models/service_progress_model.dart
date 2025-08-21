enum ServiceStatus { arrived, diagnosing, repairing, completed }

class ServiceProgressModel {
  final String bookingId;
  final String technicianName;
  final String technicianTier;
  final String technicianPhoto;
  final ServiceStatus currentStatus;
  final List<ServiceStep> serviceSteps;
  final List<SparePart> spareParts;

  const ServiceProgressModel({
    required this.bookingId,
    required this.technicianName,
    required this.technicianTier,
    required this.technicianPhoto,
    required this.currentStatus,
    required this.serviceSteps,
    required this.spareParts,
  });

  ServiceProgressModel copyWith({
    String? bookingId,
    String? technicianName,
    String? technicianTier,
    String? technicianPhoto,
    ServiceStatus? currentStatus,
    List<ServiceStep>? serviceSteps,
    List<SparePart>? spareParts,
  }) {
    return ServiceProgressModel(
      bookingId: bookingId ?? this.bookingId,
      technicianName: technicianName ?? this.technicianName,
      technicianTier: technicianTier ?? this.technicianTier,
      technicianPhoto: technicianPhoto ?? this.technicianPhoto,
      currentStatus: currentStatus ?? this.currentStatus,
      serviceSteps: serviceSteps ?? this.serviceSteps,
      spareParts: spareParts ?? this.spareParts,
    );
  }
}

class ServiceStep {
  final ServiceStatus id;
  final String label;
  final String icon;
  final String? description;

  const ServiceStep({
    required this.id,
    required this.label,
    required this.icon,
    this.description,
  });
}

class SparePart {
  final int id;
  final String name;
  final int price;
  final bool approved;

  const SparePart({
    required this.id,
    required this.name,
    required this.price,
    required this.approved,
  });

  SparePart copyWith({int? id, String? name, int? price, bool? approved}) {
    return SparePart(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      approved: approved ?? this.approved,
    );
  }
}
