import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/features/technician/earnings/ui/widgets/earning_history_job_card_list_view.dart';
import 'package:fixly/features/technician/earnings/ui/widgets/total_balance_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicianEarningsScreen extends StatelessWidget {
  const TechnicianEarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Earnings", style: context.textStyles.screenTitle),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacing(10),
            const TotalBalanceWidget(),

            verticalSpacing(60),

            const Text(
              "Earnings History",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            verticalSpacing(12),

            const Expanded(child: EarningHistoryJobCardsListView()),
          ],
        ),
      ),
    );
  }
}
