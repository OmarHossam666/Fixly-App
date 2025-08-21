import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/routing/routes/customer_routes.dart';
import 'package:fixly/features/customer/final_bill/data/final_bill_data.dart';
import 'package:fixly/features/customer/final_bill/models/final_bill_model.dart';
import 'package:fixly/features/customer/final_bill/ui/widgets/bill_summary_card.dart';
import 'package:fixly/features/customer/final_bill/ui/widgets/cash_payment_confirmation.dart';
import 'package:fixly/features/customer/final_bill/ui/widgets/payment_action_button.dart';
import 'package:fixly/features/customer/final_bill/ui/widgets/payment_method_card.dart';
import 'package:fixly/features/customer/final_bill/ui/widgets/service_completion_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FinalBillScreen extends StatefulWidget {
  final String? bookingId;

  const FinalBillScreen({super.key, this.bookingId});

  @override
  State<FinalBillScreen> createState() => _FinalBillScreenState();
}

class _FinalBillScreenState extends State<FinalBillScreen> {
  late FinalBillModel finalBill;
  PaymentMethod selectedPaymentMethod = PaymentMethod.card;
  bool isProcessingPayment = false;

  @override
  void initState() {
    super.initState();
    _initializeFinalBill();
  }

  void _initializeFinalBill() {
    // Get final bill data based on booking ID or use default
    if (widget.bookingId != null) {
      finalBill =
          FinalBillData.getFinalBillByBookingId(widget.bookingId!) ??
          FinalBillData.getDefaultFinalBill();
    } else {
      finalBill = FinalBillData.getDefaultFinalBill();
    }

    // Set initial payment method from the bill data
    selectedPaymentMethod = finalBill.selectedPaymentMethod;
  }

  void _onPaymentMethodChanged(PaymentMethod method) {
    setState(() {
      selectedPaymentMethod = method;
    });
  }

  Future<void> _processPayment() async {
    setState(() {
      isProcessingPayment = true;
    });
    // Simulate payment processing
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // Generate transaction ID and create receipt
    final transactionId = FinalBillData.generateTransactionId();
    final receiptData = ReceiptModel(
      transactionId: transactionId,
      billData: finalBill,
      tipAmount: 0.0, // No tip for now, can be extended later
      paymentDate: DateTime.now(),
      paymentMethod: selectedPaymentMethod,
    );

    // Show Errpr dialog
    await _showPaymentErrorDialog();

    // Show success dialog
    await _showPaymentSuccessDialog(receiptData);

    setState(() {
      isProcessingPayment = false;
    });
  }

  Future<void> _showPaymentSuccessDialog(ReceiptModel receipt) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: context.colors.success,
                size: 64.r,
              ),
              SizedBox(height: 16.h),
              Text(
                'Payment Successful!',
                style: context.textStyles.cardTitle.copyWith(
                  color: context.colors.success,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                'Transaction ID: ${receipt.transactionId}',
                style: context.textStyles.bodyTextSmall.copyWith(
                  color: context.colors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                'Thank you for using Fixly! Your payment has been processed successfully.',
                style: context.textStyles.bodyText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
                context.pushReplacement(CustomerRoutes.ratingAndReviewScreen);
              },
              child: Text(
                'Continue',
                style: context.textStyles.bodyTextBold.copyWith(
                  color: context.colors.accent,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showPaymentErrorDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                color: context.colors.error,
                size: 64.r,
              ),
              SizedBox(height: 16.h),
              Text(
                'Payment Failed',
                style: context.textStyles.cardTitle.copyWith(
                  color: context.colors.error,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                'There was an issue processing your payment. Please try again.',
                style: context.textStyles.bodyText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                'Try Again',
                style: context.textStyles.bodyTextBold.copyWith(
                  color: context.colors.accent,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: context.colors.primary,
            size: 24.r,
          ),
        ),
        title: Text('Final Bill', style: context.textStyles.screenTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Service completion header
                  ServiceCompletionHeader(finalBill: finalBill),
                  SizedBox(height: 24.h),

                  // Bill summary
                  BillSummaryCard(finalBill: finalBill),
                  SizedBox(height: 24.h),

                  // Payment method selection
                  PaymentMethodCard(
                    selectedPaymentMethod: selectedPaymentMethod,
                    paymentMethodDetails: finalBill.paymentMethodDetails,
                    onPaymentMethodChanged: _onPaymentMethodChanged,
                  ),
                  SizedBox(height: 16.h),

                  // Cash payment confirmation (only show for cash)
                  if (selectedPaymentMethod == PaymentMethod.cash)
                    CashPaymentConfirmation(
                      totalAmount: finalBill.total,
                      technicianName: finalBill.technicianName,
                    ),

                  // Add some bottom padding for the fixed button
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),

          // Fixed payment button
          Container(
            padding: EdgeInsets.all(24.r),
            decoration: BoxDecoration(
              color: context.colors.surface,
              border: Border(
                top: BorderSide(color: context.colors.borderLight, width: 1.w),
              ),
            ),
            child: SafeArea(
              child: PaymentActionButton(
                paymentMethod: selectedPaymentMethod,
                onPressed: _processPayment,
                isLoading: isProcessingPayment,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
