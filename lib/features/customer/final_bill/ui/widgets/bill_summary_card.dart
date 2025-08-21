import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/final_bill/data/final_bill_data.dart';
import 'package:fixly/features/customer/final_bill/models/final_bill_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillSummaryCard extends StatelessWidget {
  final FinalBillModel finalBill;

  const BillSummaryCard({super.key, required this.finalBill});

  @override
  Widget build(BuildContext context) {
    final billItems = FinalBillData.getBillSummaryItems(finalBill);

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
          Text('Bill Summary', style: context.textStyles.sectionHeader),
          SizedBox(height: 16.h),

          // Bill items
          ...billItems.map((item) => _buildBillItem(context, item)),
        ],
      ),
    );
  }

  Widget _buildBillItem(BuildContext context, BillSummaryItem item) {
    return Padding(
      padding: EdgeInsets.only(bottom: item.isSubtotal ? 0 : 12.h),
      child: Column(
        children: [
          if (item.isSubtotal) ...[
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
                style: item.isSubtotal
                    ? context.textStyles.bodyTextBold.copyWith(
                        fontSize: 18.sp,
                        color: context.colors.primary,
                      )
                    : item.isDiscount
                    ? context.textStyles.bodyText.copyWith(
                        color: context.colors.success,
                      )
                    : context.textStyles.bodyText.copyWith(
                        color: context.colors.textSecondary,
                      ),
              ),
              Text(
                item.formattedAmount,
                style: item.isSubtotal
                    ? context.textStyles.bodyTextBold.copyWith(
                        fontSize: 18.sp,
                        color: context.colors.accent,
                      )
                    : item.isDiscount
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
