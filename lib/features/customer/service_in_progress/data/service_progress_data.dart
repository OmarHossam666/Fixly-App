import '../models/service_progress_model.dart';

class ServiceProgressData {
  static const List<ServiceStep> serviceSteps = [
    ServiceStep(
      id: ServiceStatus.arrived,
      label: "Technician Arrived",
      icon: "location_on",
      description: "Hassan has arrived at your location",
    ),
    ServiceStep(
      id: ServiceStatus.diagnosing,
      label: "Diagnosing Problem",
      icon: "search",
      description: "Inspecting the problem and determining the solution",
    ),
    ServiceStep(
      id: ServiceStatus.repairing,
      label: "Repairing",
      icon: "build",
      description: "Working on fixing the issue",
    ),
    ServiceStep(
      id: ServiceStatus.completed,
      label: "Service Completed",
      icon: "check_circle",
      description: "Service has been completed successfully",
    ),
  ];

  static ServiceProgressModel createServiceProgress({
    required String bookingId,
    required String technicianName,
    required String technicianTier,
    required String technicianPhoto,
    ServiceStatus currentStatus = ServiceStatus.arrived,
  }) {
    return ServiceProgressModel(
      bookingId: bookingId,
      technicianName: technicianName,
      technicianTier: technicianTier,
      technicianPhoto: technicianPhoto,
      currentStatus: currentStatus,
      serviceSteps: serviceSteps,
      spareParts: [],
    );
  }

  static List<SparePart> getSampleSpareParts() {
    return const [
      SparePart(
        id: 1,
        name: "Pipe Joint Connector",
        price: 25,
        approved: false,
      ),
      SparePart(id: 2, name: "Rubber Gasket", price: 15, approved: false),
    ];
  }

  static String getStatusDescription(
    ServiceStatus status,
    String technicianName,
  ) {
    switch (status) {
      case ServiceStatus.arrived:
        return "$technicianName has arrived at your location";
      case ServiceStatus.diagnosing:
        return "Inspecting the problem and determining the solution";
      case ServiceStatus.repairing:
        return "Working on fixing the issue";
      case ServiceStatus.completed:
        return "Service has been completed successfully";
    }
  }
}
