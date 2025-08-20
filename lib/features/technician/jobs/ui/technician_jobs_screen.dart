import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/technician/jobs/ui/job_card.dart';
import 'package:flutter/material.dart';

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
          preferredSize: const Size.fromHeight(50),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TabBar(
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
          // Completed Tab
          ListView(
            padding: const EdgeInsets.all(16),
            children: const [
              JobCard(
                title: "AC Repair",
                worker: "Ahmed Hassan",
                time: "2 hours ago",
                price: "\$75",
                rating: "5",
                starsNumber: 5,
              ),
              SizedBox(height: 12),
              JobCard(
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
          const Center(child: Text("No Canceled Jobs")),
        ],
      ),
    );
  }
}
