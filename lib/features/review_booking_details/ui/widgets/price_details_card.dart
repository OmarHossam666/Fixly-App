import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/review_booking_details/models/booking_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceDetailsCard extends StatefulWidget {
  final BookingDetailsModel bookingDetails;
  final Function(String) onPromoCodeChanged;

  const PriceDetailsCard({
    super.key,
    required this.bookingDetails,
    required this.onPromoCodeChanged,
  });

  @override
  State<PriceDetailsCard> createState() => _PriceDetailsCardState();
}

class _PriceDetailsCardState extends State<PriceDetailsCard> {
  final TextEditingController _promoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _promoController.text = widget.bookingDetails.promoCode ?? '';
  }

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          Text('Price Details', style: context.textStyles.sectionHeader),
          SizedBox(height: 16.h),

          // Visit Fee
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Visit and Inspection Fee:',
                style: context.textStyles.bodyText.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              Text(
                '${widget.bookingDetails.visitFee} EGP',
                style: context.textStyles.bodyText.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Info Box
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: context.colors.primary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: context.colors.primary,
                  size: 16.sp,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    'This fee covers the visit and initial inspection. The technician will determine the total cost of the repair after the assessment.',
                    style: context.textStyles.caption.copyWith(height: 1.5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // Promo Code Section
          Container(
            padding: EdgeInsets.only(top: 16.h),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: context.colors.borderLight, width: 1.w),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _promoController,
                    onChanged: widget.onPromoCodeChanged,
                    decoration: InputDecoration(
                      hintText: 'Enter promo code',
                      hintStyle: context.textStyles.bodyTextSmall.copyWith(
                        color: context.colors.textTertiary,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: context.colors.border,
                          width: 1.w,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: context.colors.border,
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: context.colors.accent,
                          width: 2.w,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.h,
                      ),
                    ),
                    style: context.textStyles.bodyTextSmall,
                  ),
                ),
                SizedBox(width: 8.w),
                ElevatedButton(
                  onPressed: () {
                    // Handle apply promo code
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Promo code applied!',
                          style: context.textStyles.bodyTextSmall.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: context.colors.primary,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colors.primary,
                    foregroundColor: context.colors.textOnAccent,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    'Apply',
                    style: context.textStyles.bodyTextSmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.colors.textOnAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
