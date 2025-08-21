import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/features/technician/jobs/ui/job_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicianJobScreen extends StatefulWidget {
  const TechnicianJobScreen({super.key});

  @override
  State<TechnicianJobScreen> createState() => _JobTechnicianScreenState();
}

class _JobTechnicianScreenState extends State<TechnicianJobScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: context.colors.background,
        elevation: 0,
        title: Text("Job History", style: context.textStyles.screenTitle),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(75.h),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TabBar(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              controller: _tabController,
              indicator: BoxDecoration(
                color: context.colors.background,
                borderRadius: BorderRadius.circular(8),
              ),
              dividerColor: Colors
                  .transparent, // in Flutter 3.7+, removes tabbar bottom line
              splashBorderRadius: BorderRadius.circular(8),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: context.colors.textOnAccent,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(text: "Completed"),
                Tab(text: "Canceled"),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),

            children: [
              verticalSpacing(10),
              const JobCard(
                title: "AC Repair",
                worker: "Ahmed Hassan",
                time: "2 hours ago",
                price: "\$75",
                rating: "5",
                starsNumber: 5,
              ),
              verticalSpacing(12),
              const JobCard(
                title: "Plumbing Fix",
                worker: "Fatima Ali",
                time: "4 hours ago",
                price: "\$60",
                rating: "4",
                starsNumber: 4,
              ),
            ],
          ),

          // Canceled Tab
          Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpacing(10),
              const Center(child: Text("No Canceled Jobs")),
            ],
          ),
        ],
      ),
    );
  }
}
