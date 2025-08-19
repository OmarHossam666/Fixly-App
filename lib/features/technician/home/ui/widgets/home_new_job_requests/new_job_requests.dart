import 'package:fixly/core/constants/app_strings.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/core/widgets/on_surface.dart';
import 'package:fixly/core/widgets/surface_dark.dart';
import 'package:fixly/features/technician/home/ui/widgets/home_new_job_requests/subwidgets/accept_reject_buttons.dart';
import 'package:fixly/features/technician/home/ui/widgets/home_new_job_requests/subwidgets/job_request_title_and_distance_and_rating.dart';
import 'package:fixly/features/technician/home/ui/widgets/home_new_job_requests/subwidgets/price_and_estearnings_and_time_left.dart';
import 'package:fixly/features/technician/home/ui/widgets/home_new_job_requests/subwidgets/urgent_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewJobRequests extends StatelessWidget {
  const NewJobRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: SurfaceDark(
            topRadius: 15.r,
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: Text(
                AppStrings.newJobReauests,
                style: AppStyles.dark.cardTitle,
              ),
            ),
          ),
        ),
        verticalSpacing(1),
        SurfaceDark(
          bottomRadius: 15,
          padding: EdgeInsets.all(15.r),
          child: OnSurface(
            padding: EdgeInsets.all(15.r),
            child: Column(
              spacing: 12,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const JobRequestTitleAndDistanceAndRating(),

                    horizontalSpacing(10),
                    const UrgentWidget(),
                    const PriceAndEstearningsAndTimeLeft(),
                  ],
                ),
                const AcceptRejectButtons(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
