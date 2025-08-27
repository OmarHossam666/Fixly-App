import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/core/widgets/surface_dark.dart';
import 'package:fixly/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EarningHistoryJobCardsListView extends StatelessWidget {
  const EarningHistoryJobCardsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 8,
      separatorBuilder: (_, __) => verticalSpacing(10),
      itemBuilder: (context, index) {
        return SurfaceDark(
          borderRadiusAll: true,
          borderColorAll: true,
          allRadius: 12,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),

          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.blue.shade100,
                child: const Icon(Icons.work, color: Colors.blue),
              ),
              horizontalSpacing(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${LocaleKeys.navigation_labels_jobs} #${index + 1}",
                      style: context.textStyles.bodyTextBold.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      " ${index + 10}, 2025",
                      style: context.textStyles.bodyTextSmall.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "+ \$${50 + index * 10}",
                style: context.textStyles.green16Bold,
              ),
            ],
          ),
        );
      },
    );
  }
}
