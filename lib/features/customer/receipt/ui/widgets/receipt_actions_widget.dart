import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/receipt/data/receipt_data.dart';
import 'package:fixly/features/customer/receipt/models/receipt_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReceiptActionsWidget extends StatelessWidget {
  final Function(ReceiptAction) onActionPressed;

  const ReceiptActionsWidget({super.key, required this.onActionPressed});

  @override
  Widget build(BuildContext context) {
    final actions = ReceiptData.getReceiptActions();

    return Column(
      children: actions.map((action) {
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: _buildActionButton(context, action),
        );
      }).toList(),
    );
  }

  Widget _buildActionButton(BuildContext context, ReceiptAction action) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: () => onActionPressed(action),
        style: ElevatedButton.styleFrom(
          backgroundColor: _getButtonColor(context, action),
          foregroundColor: _getButtonTextColor(context, action),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_getButtonIcon(action), size: 20.r),
            SizedBox(width: 8.w),
            Text(
              action.label,
              style: context.textStyles.bodyTextBold.copyWith(
                color: _getButtonTextColor(context, action),
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getButtonColor(BuildContext context, ReceiptAction action) {
    switch (action) {
      case ReceiptAction.downloadPdf:
        return context.colors.primary;
      case ReceiptAction.sendEmail:
        return context.colors.accent;
      case ReceiptAction.backToHome:
        return context.colors.surfaceSecondary;
    }
  }

  Color _getButtonTextColor(BuildContext context, ReceiptAction action) {
    switch (action) {
      case ReceiptAction.downloadPdf:
      case ReceiptAction.sendEmail:
        return Colors.white;
      case ReceiptAction.backToHome:
        return context.colors.text;
    }
  }

  IconData _getButtonIcon(ReceiptAction action) {
    switch (action) {
      case ReceiptAction.downloadPdf:
        return Icons.download;
      case ReceiptAction.sendEmail:
        return Icons.email;
      case ReceiptAction.backToHome:
        return Icons.home;
    }
  }
}
