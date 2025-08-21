import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/routing/routes/customer_routes.dart';
import 'package:fixly/features/customer/receipt/data/receipt_data.dart';
import 'package:fixly/features/customer/receipt/models/receipt_model.dart';
import 'package:fixly/features/customer/receipt/ui/widgets/receipt_actions_widget.dart';
import 'package:fixly/features/customer/receipt/ui/widgets/receipt_details_widget.dart';
import 'package:fixly/features/customer/receipt/ui/widgets/receipt_header_widget.dart';
import 'package:fixly/features/customer/receipt/ui/widgets/receipt_summary_widget.dart';
import 'package:fixly/features/customer/receipt/ui/widgets/thank_you_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ReceiptScreen extends StatefulWidget {
  final String? transactionId;
  final String? bookingId;

  const ReceiptScreen({super.key, this.transactionId, this.bookingId});

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  late ReceiptModel receipt;
  bool isProcessingAction = false;

  @override
  void initState() {
    super.initState();
    _initializeReceipt();
  }

  void _initializeReceipt() {
    // Try to get receipt data based on transaction ID or booking ID
    if (widget.transactionId != null) {
      receipt =
          ReceiptData.getReceiptByTransactionId(widget.transactionId!) ??
          ReceiptData.getDefaultReceipt();
    } else if (widget.bookingId != null) {
      receipt =
          ReceiptData.getReceiptByBookingId(widget.bookingId!) ??
          ReceiptData.getDefaultReceipt();
    } else {
      receipt = ReceiptData.getDefaultReceipt();
    }
  }

  Future<void> _handleAction(ReceiptAction action) async {
    setState(() {
      isProcessingAction = true;
    });

    try {
      switch (action) {
        case ReceiptAction.downloadPdf:
          await _downloadPdf();
          break;
        case ReceiptAction.sendEmail:
          await _sendEmail();
          break;
        case ReceiptAction.backToHome:
          _navigateToHome();
          break;
      }
    } catch (e) {
      if (mounted) {
        _showErrorDialog(
          'Failed to ${action.label.toLowerCase()}. Please try again.',
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          isProcessingAction = false;
        });
      }
    }
  }

  Future<void> _downloadPdf() async {
    // Simulate PDF download
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    _showSuccessDialog(
      'Receipt Downloaded!',
      'Your receipt has been saved to Downloads folder.',
    );
  }

  Future<void> _sendEmail() async {
    // Simulate email sending
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    _showSuccessDialog(
      'Email Sent!',
      'Receipt has been sent to your registered email address.',
    );
  }

  void _navigateToHome() {
    context.go(CustomerRoutes.mainScreen);
  }

  Future<void> _showSuccessDialog(String title, String message) async {
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
                Icons.check_circle,
                color: context.colors.success,
                size: 64.r,
              ),
              SizedBox(height: 16.h),
              Text(
                title,
                style: context.textStyles.cardTitle.copyWith(
                  color: context.colors.success,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                message,
                style: context.textStyles.bodyText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
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

  Future<void> _showErrorDialog(String message) async {
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
                'Action Failed',
                style: context.textStyles.cardTitle.copyWith(
                  color: context.colors.error,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              Text(
                message,
                style: context.textStyles.bodyText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
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
        title: Column(
          children: [
            Text('Service Receipt', style: context.textStyles.screenTitle),
            Text(
              'Transaction completed successfully',
              style: context.textStyles.bodyTextSmall.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ],
        ),
        centerTitle: true,
        toolbarHeight: 80.h,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Receipt header with logo
            const ReceiptHeaderWidget(),
            SizedBox(height: 24.h),

            // Transaction details
            ReceiptDetailsWidget(receipt: receipt),
            SizedBox(height: 24.h),

            // Payment summary
            ReceiptSummaryWidget(receipt: receipt),
            SizedBox(height: 24.h),

            // Action buttons
            ReceiptActionsWidget(
              onActionPressed: isProcessingAction ? (_) {} : _handleAction,
            ),
            SizedBox(height: 24.h),

            // Thank you message
            const ThankYouMessageWidget(),
          ],
        ),
      ),
    );
  }
}
