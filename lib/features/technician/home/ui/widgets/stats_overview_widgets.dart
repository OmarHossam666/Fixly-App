import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_strings.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/widgets/surface_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//TODO: removing temporary constant values when start implementing the actual logic

class StatsOverviewWidgets extends StatelessWidget {
  final List<String> statsStrings = const [
    AppStrings.todaysEarnings,
    AppStrings.completedJobs,
    AppStrings.averageRating,
  ];
  final List<String> tempoNumberStrings = const ["\$250", '3', '4.8'];
  final List<Color> numberColors = [
    AppColors.darkColors.success,
    AppColors.darkColors.facebook,
    AppColors.darkColors.warning,
  ];
  StatsOverviewWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(statsStrings.length, (index) {
        final isLast = index == statsStrings.length - 1;
        return SurfaceDark(
          borderColorAll: true,
          alignment: Alignment.center,
          height: 105.w,
          width: 105.w,
          margin: EdgeInsets.only(right: isLast ? 0 : 15.w),
          borderRadiusAll: true,
          allRadius: 15,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: tempoNumberStrings[index],
                  style: AppStyles.dark.statisticsWidgetText.copyWith(
                    color: numberColors[index],
                  ),
                ),
                TextSpan(
                  text: "\n${statsStrings[index]}",
                  style: AppStyles.dark.bodyText,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        );
      }),
    );
  }
}
