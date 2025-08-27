import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/features/customer/home/ui/service_details_secreen/widgets/service_details_screen_header.dart';
import 'package:fixly/features/customer/home/ui/service_details_secreen/widgets/something_else_widget.dart';
import 'package:fixly/features/customer/home/ui/service_details_secreen/widgets/unsure_problem_fixly_assistant_widget.dart';
import 'package:fixly/features/customer/home/ui/widgets/build_service_item.dart';
import 'package:flutter/material.dart';
import 'package:fixly/features/customer/home/models/service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final Service service;

  const ServiceDetailsScreen({Key? key, required this.service})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Column(
        children: [
          // Header with status bar
          ServiceDetailsScreenHeader(service: service),

          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 100.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Chatbot Banner
                  const UnsureProblemFixlyAssistantWidget(),

                  // Service List
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Common Issues',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        verticalSpacing(16),

                        // Service Items
                        ...service.subservices!.map<Widget>(
                          (subservice) => buildServiceItem(
                            context,
                            subservice,
                            service.color,
                          ),
                        ),

                        // Something Else Option
                        verticalSpacing(8),
                        const SomethingElseWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
