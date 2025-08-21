/// Model for receipt data
class ReceiptModel {
  final String transactionId;
  final String bookingId;
  final String technicianName;
  final String serviceName;
  final String customerName;
  final DateTime transactionDate;
  final double visitFee;
  final double laborCost;
  final double sparePartsCost;
  final double tipAmount;
  final double totalAmount;
  final String paymentMethod;

  const ReceiptModel({
    required this.transactionId,
    required this.bookingId,
    required this.technicianName,
    required this.serviceName,
    required this.customerName,
    required this.transactionDate,
    required this.visitFee,
    required this.laborCost,
    required this.sparePartsCost,
    required this.tipAmount,
    required this.totalAmount,
    required this.paymentMethod,
  });

  /// Get formatted transaction date
  String get formattedDate {
    return '${transactionDate.day}/${transactionDate.month}/${transactionDate.year}';
  }

  /// Get formatted transaction time
  String get formattedTime {
    final hour = transactionDate.hour.toString().padLeft(2, '0');
    final minute = transactionDate.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  /// Get subtotal (before tip)
  double get subtotal {
    return visitFee + laborCost + sparePartsCost;
  }

  /// Check if tip was given
  bool get hasTip {
    return tipAmount > 0;
  }

  /// Get formatted amounts
  String get formattedVisitFee => '${visitFee.toStringAsFixed(0)} EGP';
  String get formattedLaborCost => '${laborCost.toStringAsFixed(0)} EGP';
  String get formattedSparePartsCost =>
      '${sparePartsCost.toStringAsFixed(0)} EGP';
  String get formattedTipAmount => '${tipAmount.toStringAsFixed(0)} EGP';
  String get formattedTotalAmount => '${totalAmount.toStringAsFixed(0)} EGP';

  /// Copy with method for updating the model
  ReceiptModel copyWith({
    String? transactionId,
    String? bookingId,
    String? technicianName,
    String? serviceName,
    String? customerName,
    DateTime? transactionDate,
    double? visitFee,
    double? laborCost,
    double? sparePartsCost,
    double? tipAmount,
    double? totalAmount,
    String? paymentMethod,
  }) {
    return ReceiptModel(
      transactionId: transactionId ?? this.transactionId,
      bookingId: bookingId ?? this.bookingId,
      technicianName: technicianName ?? this.technicianName,
      serviceName: serviceName ?? this.serviceName,
      customerName: customerName ?? this.customerName,
      transactionDate: transactionDate ?? this.transactionDate,
      visitFee: visitFee ?? this.visitFee,
      laborCost: laborCost ?? this.laborCost,
      sparePartsCost: sparePartsCost ?? this.sparePartsCost,
      tipAmount: tipAmount ?? this.tipAmount,
      totalAmount: totalAmount ?? this.totalAmount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }
}

/// Model for receipt line items
class ReceiptLineItem {
  final String label;
  final double amount;
  final bool isTotal;
  final bool isTip;

  const ReceiptLineItem({
    required this.label,
    required this.amount,
    this.isTotal = false,
    this.isTip = false,
  });

  /// Get formatted amount string
  String get formattedAmount {
    return '${amount.toStringAsFixed(0)} EGP';
  }
}

/// Enum for receipt actions
enum ReceiptAction { downloadPdf, sendEmail, backToHome }

/// Extension for ReceiptAction to get display properties
extension ReceiptActionExtension on ReceiptAction {
  String get label {
    switch (this) {
      case ReceiptAction.downloadPdf:
        return 'Download Receipt (PDF)';
      case ReceiptAction.sendEmail:
        return 'Send to Email';
      case ReceiptAction.backToHome:
        return 'Back to Home';
    }
  }

  String get icon {
    switch (this) {
      case ReceiptAction.downloadPdf:
        return 'download';
      case ReceiptAction.sendEmail:
        return 'email';
      case ReceiptAction.backToHome:
        return 'home';
    }
  }

  bool get isPrimary {
    switch (this) {
      case ReceiptAction.downloadPdf:
        return true;
      case ReceiptAction.sendEmail:
        return false;
      case ReceiptAction.backToHome:
        return false;
    }
  }
}
