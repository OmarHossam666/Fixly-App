import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/receipt/data/receipt_data.dart';
import 'package:fixly/features/customer/receipt/models/receipt_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReceiptSummaryWidget extends StatelessWidget {
  final ReceiptModel receipt;

  const ReceiptSummaryWidget({super.key, required this.receipt});

  @override
  Widget build(BuildContext context) {
    final lineItems = ReceiptData.getReceiptLineItems(receipt);

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
          Text('Payment Summary', style: context.textStyles.sectionHeader),
          SizedBox(height: 16.h),

          // Line items
          ...lineItems.map((item) => _buildLineItem(context, item)),
        ],
      ),
    );
  }

  Widget _buildLineItem(BuildContext context, ReceiptLineItem item) {
    return Padding(
      padding: EdgeInsets.only(bottom: item.isTotal ? 0 : 8.h),
      child: Column(
        children: [
          if (item.isTotal) ...[
            Divider(
              color: context.colors.borderLight,
              thickness: 1.h,
              height: 24.h,
            ),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.label,
                style: item.isTotal
                    ? context.textStyles.bodyTextBold.copyWith(
                        fontSize: 18.sp,
                        color: context.colors.primary,
                      )
                    : item.isTip
                    ? context.textStyles.bodyText.copyWith(
                        color: context.colors.success,
                        fontWeight: FontWeight.w600,
                      )
                    : context.textStyles.bodyText.copyWith(
                        color: context.colors.textSecondary,
                      ),
              ),
              Text(
                item.formattedAmount,
                style: item.isTotal
                    ? context.textStyles.bodyTextBold.copyWith(
                        fontSize: 18.sp,
                        color: context.colors.accent,
                      )
                    : item.isTip
                    ? context.textStyles.bodyTextBold.copyWith(
                        color: context.colors.success,
                      )
                    : context.textStyles.bodyTextBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
