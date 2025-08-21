import 'package:fixly/features/customer/receipt/models/receipt_model.dart';

/// Sample receipt data for demonstration
class ReceiptData {
  /// Sample receipt instances
  static final List<ReceiptModel> sampleReceipts = [
    ReceiptModel(
      transactionId: 'TXN123456789',
      bookingId: 'FX123456789',
      technicianName: 'Hassan Mahmoud',
      serviceName: 'Plumbing',
      customerName: 'Ahmed',
      transactionDate: DateTime.now().subtract(const Duration(hours: 1)),
      visitFee: 50.0,
      laborCost: 120.0,
      sparePartsCost: 40.0,
      tipAmount: 20.0,
      totalAmount: 230.0,
      paymentMethod: 'Visa **** 1234',
    ),
    ReceiptModel(
      transactionId: 'TXN987654321',
      bookingId: 'FX987654321',
      technicianName: 'Mohamed Hassan',
      serviceName: 'Electricity',
      customerName: 'Ahmed',
      transactionDate: DateTime.now().subtract(const Duration(hours: 2)),
      visitFee: 50.0,
      laborCost: 80.0,
      sparePartsCost: 0.0,
      tipAmount: 0.0,
      totalAmount: 130.0,
      paymentMethod: 'Cash Payment',
    ),
  ];

  /// Get default receipt (first in the list)
  static ReceiptModel getDefaultReceipt() {
    return sampleReceipts.first;
  }

  /// Get receipt by transaction ID
  static ReceiptModel? getReceiptByTransactionId(String transactionId) {
    try {
      return sampleReceipts.firstWhere(
        (receipt) => receipt.transactionId == transactionId,
      );
    } catch (e) {
      return null;
    }
  }

  /// Get receipt by booking ID
  static ReceiptModel? getReceiptByBookingId(String bookingId) {
    try {
      return sampleReceipts.firstWhere(
        (receipt) => receipt.bookingId == bookingId,
      );
    } catch (e) {
      return null;
    }
  }

  /// Create receipt from payment data
  static ReceiptModel createReceipt({
    required String bookingId,
    required String technicianName,
    required String serviceName,
    required String customerName,
    required double visitFee,
    required double laborCost,
    required double sparePartsCost,
    required double tipAmount,
    required String paymentMethod,
  }) {
    final transactionId = generateTransactionId();
    final totalAmount = visitFee + laborCost + sparePartsCost + tipAmount;

    return ReceiptModel(
      transactionId: transactionId,
      bookingId: bookingId,
      technicianName: technicianName,
      serviceName: serviceName,
      customerName: customerName,
      transactionDate: DateTime.now(),
      visitFee: visitFee,
      laborCost: laborCost,
      sparePartsCost: sparePartsCost,
      tipAmount: tipAmount,
      totalAmount: totalAmount,
      paymentMethod: paymentMethod,
    );
  }

  /// Generate unique transaction ID
  static String generateTransactionId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return 'TXN${timestamp.toString().substring(7)}';
  }

  /// Get receipt line items for display
  static List<ReceiptLineItem> getReceiptLineItems(ReceiptModel receipt) {
    final items = <ReceiptLineItem>[
      ReceiptLineItem(label: 'Visit & Inspection', amount: receipt.visitFee),
      ReceiptLineItem(label: 'Labor Cost', amount: receipt.laborCost),
      ReceiptLineItem(label: 'Spare Parts', amount: receipt.sparePartsCost),
    ];

    // Add tip if present
    if (receipt.hasTip) {
      items.add(
        ReceiptLineItem(label: 'Tip', amount: receipt.tipAmount, isTip: true),
      );
    }

    // Add total
    items.add(
      ReceiptLineItem(
        label: 'Total Paid',
        amount: receipt.totalAmount,
        isTotal: true,
      ),
    );

    return items;
  }

  /// Get receipt details for display
  static List<ReceiptDetailItem> getReceiptDetails(ReceiptModel receipt) {
    return [
      ReceiptDetailItem(label: 'Transaction ID', value: receipt.transactionId),
      ReceiptDetailItem(label: 'Date', value: receipt.formattedDate),
      ReceiptDetailItem(label: 'Time', value: receipt.formattedTime),
      ReceiptDetailItem(label: 'Booking ID', value: receipt.bookingId),
      ReceiptDetailItem(label: 'Technician', value: receipt.technicianName),
      ReceiptDetailItem(
        label: 'Service',
        value: '${receipt.serviceName} Repair',
      ),
      ReceiptDetailItem(label: 'Customer', value: receipt.customerName),
    ];
  }

  /// Get available receipt actions
  static List<ReceiptAction> getReceiptActions() {
    return [
      ReceiptAction.downloadPdf,
      ReceiptAction.sendEmail,
      ReceiptAction.backToHome,
    ];
  }

  /// Get thank you message
  static String getThankYouMessage() {
    return 'We hope you\'re satisfied with our service. Feel free to book again anytime!';
  }

  /// Validate receipt data
  static bool validateReceiptData(ReceiptModel receipt) {
    // Check required fields
    if (receipt.transactionId.isEmpty ||
        receipt.bookingId.isEmpty ||
        receipt.technicianName.isEmpty ||
        receipt.serviceName.isEmpty ||
        receipt.customerName.isEmpty) {
      return false;
    }

    // Check amounts are non-negative
    if (receipt.visitFee < 0 ||
        receipt.laborCost < 0 ||
        receipt.sparePartsCost < 0 ||
        receipt.tipAmount < 0 ||
        receipt.totalAmount < 0) {
      return false;
    }

    // Check total calculation
    final expectedTotal =
        receipt.visitFee +
        receipt.laborCost +
        receipt.sparePartsCost +
        receipt.tipAmount;

    if ((receipt.totalAmount - expectedTotal).abs() > 0.01) {
      return false;
    }

    return true;
  }
}

/// Model for receipt detail items
class ReceiptDetailItem {
  final String label;
  final String value;

  const ReceiptDetailItem({required this.label, required this.value});
}
