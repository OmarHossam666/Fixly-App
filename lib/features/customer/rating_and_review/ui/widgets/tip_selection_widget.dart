import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/rating_and_review/data/rating_review_data.dart';
import 'package:fixly/features/customer/rating_and_review/models/rating_review_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TipSelectionWidget extends StatefulWidget {
  final String technicianName;
  final double currentTipAmount;
  final Function(double) onTipAmountChanged;

  const TipSelectionWidget({
    super.key,
    required this.technicianName,
    required this.currentTipAmount,
    required this.onTipAmountChanged,
  });

  @override
  State<TipSelectionWidget> createState() => _TipSelectionWidgetState();
}

class _TipSelectionWidgetState extends State<TipSelectionWidget> {
  late TextEditingController _customAmountController;
  bool _isCustomAmountFocused = false;

  @override
  void initState() {
    super.initState();
    _customAmountController = TextEditingController();

    // Set initial custom amount if it's not one of the preset amounts
    final presetAmounts = RatingReviewData.commonTipAmounts
        .map((tip) => tip.amount)
        .toList();
    if (widget.currentTipAmount > 0 &&
        !presetAmounts.contains(widget.currentTipAmount)) {
      _customAmountController.text = widget.currentTipAmount.toStringAsFixed(0);
    }
  }

  @override
  void dispose() {
    _customAmountController.dispose();
    super.dispose();
  }

  void _onPresetTipSelected(double amount) {
    widget.onTipAmountChanged(amount);
    _customAmountController.clear();
    setState(() {
      _isCustomAmountFocused = false;
    });
  }

  void _onCustomAmountChanged(String value) {
    final amount = double.tryParse(value) ?? 0.0;
    widget.onTipAmountChanged(amount);
  }

  @override
  Widget build(BuildContext context) {
    final tipAmounts = RatingReviewData.getTipAmountsWithSelection(
      widget.currentTipAmount,
    );
    final hasCustomAmount =
        widget.currentTipAmount > 0 &&
        !RatingReviewData.commonTipAmounts.any(
          (tip) => tip.amount == widget.currentTipAmount,
        );

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
          Text(
            'Add a tip for ${widget.technicianName}? (Optional)',
            style: context.textStyles.sectionHeader,
          ),
          SizedBox(height: 16.h),

          // Preset tip amounts
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
            childAspectRatio: 2.5,
            children: tipAmounts.map((tip) {
              return _buildTipAmountButton(context, tip);
            }).toList(),
          ),
          SizedBox(height: 16.h),

          // Custom amount input
          TextField(
            controller: _customAmountController,
            onChanged: _onCustomAmountChanged,
            onTap: () {
              setState(() {
                _isCustomAmountFocused = true;
              });
            },
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4), // Max 9999 EGP
            ],
            decoration: InputDecoration(
              hintText: 'Custom amount',
              hintStyle: context.textStyles.bodyText.copyWith(
                color: context.colors.textSecondary,
              ),
              suffixText: 'EGP',
              suffixStyle: context.textStyles.bodyText.copyWith(
                color: context.colors.textSecondary,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: context.colors.borderLight,
                  width: 1.w,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  color: hasCustomAmount || _isCustomAmountFocused
                      ? context.colors.accent
                      : context.colors.borderLight,
                  width: hasCustomAmount || _isCustomAmountFocused ? 2.w : 1.w,
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
                horizontal: 16.w,
                vertical: 12.h,
              ),
            ),
            style: context.textStyles.bodyText,
          ),
        ],
      ),
    );
  }

  Widget _buildTipAmountButton(BuildContext context, TipAmount tip) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      child: InkWell(
        onTap: () => _onPresetTipSelected(tip.amount),
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          decoration: BoxDecoration(
            color: tip.isSelected
                ? context.colors.accent
                : context.colors.surfaceSecondary,
            borderRadius: BorderRadius.circular(12.r),
            border: tip.isSelected
                ? null
                : Border.all(color: context.colors.borderLight, width: 1.w),
          ),
          child: Center(
            child: Text(
              tip.formattedAmount,
              style: context.textStyles.bodyTextBold.copyWith(
                color: tip.isSelected ? Colors.white : context.colors.text,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
