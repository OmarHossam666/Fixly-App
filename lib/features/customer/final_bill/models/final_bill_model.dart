import 'package:fixly/features/customer/service_in_progress/models/service_progress_model.dart';

/// Enum for payment methods
enum PaymentMethod { card, cash }

/// Extension for PaymentMethod to get display names
extension PaymentMethodExtension on PaymentMethod {
  String get displayName {
    switch (this) {
      case PaymentMethod.card:
        return 'Card Payment';
      case PaymentMethod.cash:
        return 'Cash Payment';
    }
  }

  String get icon {
    switch (this) {
      case PaymentMethod.card:
        return 'fab fa-cc-visa';
      case PaymentMethod.cash:
        return 'fas fa-money-bill-wave';
    }
  }
}

/// Model for final bill data
class FinalBillModel {
  final String bookingId;
  final String technicianName;
  final String serviceName;
  final double visitFee;
  final double laborCost;
  final double sparePartsCost;
  final double discount;
  final double total;
  final List<SparePart> approvedSpareParts;
  final PaymentMethod selectedPaymentMethod;
  final String paymentMethodDetails;
  final DateTime serviceDate;
  final String customerName;
  final String serviceAddress;

  const FinalBillModel({
    required this.bookingId,
    required this.technicianName,
    required this.serviceName,
    required this.visitFee,
    required this.laborCost,
    required this.sparePartsCost,
    required this.discount,
    required this.total,
    required this.approvedSpareParts,
    required this.selectedPaymentMethod,
    required this.paymentMethodDetails,
    required this.serviceDate,
    required this.customerName,
    required this.serviceAddress,
  });

  /// Calculate total with tip
  double getTotalWithTip(double tipAmount) {
    return total + tipAmount;
  }

  /// Get formatted service date
  String get formattedServiceDate {
    return '${serviceDate.day}/${serviceDate.month}/${serviceDate.year}';
  }

  /// Get formatted service time
  String get formattedServiceTime {
    final hour = serviceDate.hour.toString().padLeft(2, '0');
    final minute = serviceDate.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  /// Copy with method for updating the model
  FinalBillModel copyWith({
    String? bookingId,
    String? technicianName,
    String? serviceName,
    double? visitFee,
    double? laborCost,
    double? sparePartsCost,
    double? discount,
    double? total,
    List<SparePart>? approvedSpareParts,
    PaymentMethod? selectedPaymentMethod,
    String? paymentMethodDetails,
    DateTime? serviceDate,
    String? customerName,
    String? serviceAddress,
  }) {
    return FinalBillModel(
      bookingId: bookingId ?? this.bookingId,
      technicianName: technicianName ?? this.technicianName,
      serviceName: serviceName ?? this.serviceName,
      visitFee: visitFee ?? this.visitFee,
      laborCost: laborCost ?? this.laborCost,
      sparePartsCost: sparePartsCost ?? this.sparePartsCost,
      discount: discount ?? this.discount,
      total: total ?? this.total,
      approvedSpareParts: approvedSpareParts ?? this.approvedSpareParts,
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
      paymentMethodDetails: paymentMethodDetails ?? this.paymentMethodDetails,
      serviceDate: serviceDate ?? this.serviceDate,
      customerName: customerName ?? this.customerName,
      serviceAddress: serviceAddress ?? this.serviceAddress,
    );
  }
}

/// Model for receipt data
class ReceiptModel {
  final String transactionId;
  final FinalBillModel billData;
  final double tipAmount;
  final DateTime paymentDate;
  final PaymentMethod paymentMethod;

  const ReceiptModel({
    required this.transactionId,
    required this.billData,
    required this.tipAmount,
    required this.paymentDate,
    required this.paymentMethod,
  });

  /// Get total amount paid including tip
  double get totalPaid => billData.total + tipAmount;

  /// Get formatted payment date
  String get formattedPaymentDate {
    return '${paymentDate.day}/${paymentDate.month}/${paymentDate.year}';
  }

  /// Get formatted payment time
  String get formattedPaymentTime {
    final hour = paymentDate.hour.toString().padLeft(2, '0');
    final minute = paymentDate.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
