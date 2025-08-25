import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/features/customer/chat/ui/fixly_assistant_screen/widgets/technician_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FixlyAssistantChatProvidersDetailsScreen extends StatefulWidget {
  final List<Map<String, dynamic>>? providersList;

  const FixlyAssistantChatProvidersDetailsScreen({
    super.key,
    required this.providersList,
  });

  @override
  State<FixlyAssistantChatProvidersDetailsScreen> createState() =>
      _FixlyAssistantChatProvidersDetailsScreenState();
}

class _FixlyAssistantChatProvidersDetailsScreenState
    extends State<FixlyAssistantChatProvidersDetailsScreen>
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.h),
        child: AppBar(
          backgroundColor: context.colors.background,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Available Technicians",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Near your location",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C3E),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TabBar(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                indicator: BoxDecoration(
                  color: context.colors.accent,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                tabs: const [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.list, size: 18),
                        SizedBox(width: 8),
                        Text("List View"),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_pin, size: 18),
                        SizedBox(width: 8),
                        Text("Map View"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // List View Tab
          (widget.providersList != null && widget.providersList!.isNotEmpty)
              ? ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: widget.providersList?.length,
                  itemBuilder: (context, index) {
                    final tech = widget.providersList![index];
                    return TechnicianCard(
                      firstName: tech["first_name"] ?? "Unknown",
                      lastName: tech["last_name"] ?? "",
                      distance: "${index + 1}.${(index * 3 + 1) % 9} km away",
                      rating: (tech["rating"] as num?)?.toDouble() ?? 0.0,
                      flash: index % 2 == 0,
                      verified: true,
                      available: true,
                      services:
                          (tech["services_offered"] as List?)?.cast<String>() ??
                          [],
                    );
                  },
                )
              : const Center(
                  child: Text(
                    "No available technicians found nearby.",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
          // Map View Tab
          const Center(
            child: Text(
              "🗺 Map View Coming Soon...",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
