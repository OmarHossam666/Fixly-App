import 'package:fixly/features/customer/final_bill/models/final_bill_model.dart';
import 'package:fixly/features/customer/service_in_progress/models/service_progress_model.dart';

/// Sample final bill data for demonstration
class FinalBillData {
  /// Sample approved spare parts
  static final List<SparePart> _sampleApprovedSpareParts = [
    const SparePart(
      id: 1,
      name: 'Pipe Joint Connector',
      price: 25, approved: true,
    ),
    const SparePart(
      id: 2,
      name: 'Rubber Gasket',
      price: 15, approved: true,
    ),
  ];

  /// Sample final bill instances
  static final List<FinalBillModel> sampleFinalBills = [
    FinalBillModel(
      bookingId: 'FX123456789',
      technicianName: 'Hassan Mahmoud',
      serviceName: 'Plumbing',
      visitFee: 50.0,
      laborCost: 120.0,
      sparePartsCost: 40.0,
      discount: 0.0,
      total: 210.0,
      approvedSpareParts: _sampleApprovedSpareParts,
      selectedPaymentMethod: PaymentMethod.card,
      paymentMethodDetails: 'Visa **** 1234',
      serviceDate: DateTime.now().subtract(const Duration(hours: 2)),
      customerName: 'Ahmed',
      serviceAddress: '123 Main Street, Apartment 4B, Cairo',
    ),
    FinalBillModel(
      bookingId: 'FX987654321',
      technicianName: 'Mohamed Hassan',
      serviceName: 'Electricity',
      visitFee: 50.0,
      laborCost: 80.0,
      sparePartsCost: 0.0,
      discount: 10.0,
      total: 120.0,
      approvedSpareParts: [],
      selectedPaymentMethod: PaymentMethod.cash,
      paymentMethodDetails: 'Cash Payment',
      serviceDate: DateTime.now().subtract(const Duration(hours: 1)),
      customerName: 'Ahmed',
      serviceAddress: '456 Oak Avenue, Floor 2, Giza',
    ),
  ];

  /// Get default final bill (first in the list)
  static FinalBillModel getDefaultFinalBill() {
    return sampleFinalBills.first;
  }

  /// Get final bill by booking ID
  static FinalBillModel? getFinalBillByBookingId(String bookingId) {
    try {
      return sampleFinalBills.firstWhere((bill) => bill.bookingId == bookingId);
    } catch (e) {
      return null;
    }
  }

  /// Generate transaction ID
  static String generateTransactionId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return 'TXN${timestamp.toString().substring(7)}';
  }

  /// Common tip amounts
  static const List<double> commonTipAmounts = [10.0, 20.0, 30.0, 50.0];

  /// Get bill summary items for display
  static List<BillSummaryItem> getBillSummaryItems(FinalBillModel bill) {
    return [
      BillSummaryItem(
        label: 'Visit and Inspection Fee',
        amount: bill.visitFee,
        isSubtotal: false,
      ),
      BillSummaryItem(
        label: 'Labor Cost',
        amount: bill.laborCost,
        isSubtotal: false,
      ),
      BillSummaryItem(
        label: 'Spare Parts Cost',
        amount: bill.sparePartsCost,
        isSubtotal: false,
      ),
      if (bill.discount > 0)
        BillSummaryItem(
          label: 'Discount',
          amount: -bill.discount,
          isSubtotal: false,
          isDiscount: true,
        ),
      BillSummaryItem(label: 'Total', amount: bill.total, isSubtotal: true),
    ];
  }
}

/// Model for bill summary items
class BillSummaryItem {
  final String label;
  final double amount;
  final bool isSubtotal;
  final bool isDiscount;

  const BillSummaryItem({
    required this.label,
    required this.amount,
    this.isSubtotal = false,
    this.isDiscount = false,
  });

  /// Get formatted amount string
  String get formattedAmount {
    final absAmount = amount.abs();
    final prefix = isDiscount ? '-' : '';
    return '$prefix${absAmount.toStringAsFixed(0)} EGP';
  }
}
