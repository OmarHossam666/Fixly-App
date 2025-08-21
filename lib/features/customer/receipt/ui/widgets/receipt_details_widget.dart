import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/receipt/data/receipt_data.dart';
import 'package:fixly/features/customer/receipt/models/receipt_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReceiptDetailsWidget extends StatelessWidget {
  final ReceiptModel receipt;

  const ReceiptDetailsWidget({super.key, required this.receipt});

  @override
  Widget build(BuildContext context) {
    final details = ReceiptData.getReceiptDetails(receipt);

    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.colors.borderLight, width: 2.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Transaction Details', style: context.textStyles.sectionHeader),
          SizedBox(height: 16.h),

          // Transaction details
          ...details.map((detail) => _buildDetailRow(context, detail)),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, ReceiptDetailItem detail) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${detail.label}:',
            style: context.textStyles.bodyText.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              detail.value,
              style: context.textStyles.bodyTextBold,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
