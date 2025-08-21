import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/routing/routes/customer_routes.dart';
import 'package:fixly/features/customer/service_in_progress/data/service_progress_data.dart';
import 'package:fixly/features/customer/service_in_progress/models/service_progress_model.dart';
import 'package:fixly/features/customer/service_in_progress/ui/widgets/service_action_button.dart';
import 'package:fixly/features/customer/service_in_progress/ui/widgets/service_progress_header.dart';
import 'package:fixly/features/customer/service_in_progress/ui/widgets/service_status_card.dart';
import 'package:fixly/features/customer/service_in_progress/ui/widgets/spare_parts_card.dart';
import 'package:fixly/features/customer/service_in_progress/ui/widgets/technician_contact_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ServiceInProgressScreen extends StatefulWidget {
  final String? bookingId;
  final String? technicianName;

  const ServiceInProgressScreen({
    super.key,
    this.bookingId,
    this.technicianName,
  });

  @override
  State<ServiceInProgressScreen> createState() =>
      _ServiceInProgressScreenState();
}

class _ServiceInProgressScreenState extends State<ServiceInProgressScreen> {
  late ServiceProgressModel _serviceProgress;

  @override
  void initState() {
    super.initState();
    _initializeServiceProgress();
    _simulateServiceProgression();
  }

  void _initializeServiceProgress() {
    _serviceProgress = ServiceProgressData.createServiceProgress(
      bookingId: widget.bookingId ?? 'FX12345',
      technicianName: widget.technicianName ?? 'Hassan Mahmoud',
      technicianTier: 'Master Plumber',
      technicianPhoto: '👨‍🔧',
      currentStatus: ServiceStatus.arrived,
    );
  }

  void _simulateServiceProgression() {
    // Simulate service progression
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _serviceProgress = _serviceProgress.copyWith(
            currentStatus: ServiceStatus.diagnosing,
          );
        });
      }
    });

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _serviceProgress = _serviceProgress.copyWith(
            currentStatus: ServiceStatus.repairing,
            spareParts: ServiceProgressData.getSampleSpareParts(),
          );
        });
      }
    });
  }

  void _handleCallTechnician() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          'Call ${_serviceProgress.technicianName}?',
          style: context.textStyles.cardTitle,
        ),
        content: Text(
          'This will initiate a phone call to your technician.',
          style: context.textStyles.bodyTextSmall,
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              'Cancel',
              style: context.textStyles.bodyText.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Calling ${_serviceProgress.technicianName}...',
                    style: context.textStyles.bodyTextSmall.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: context.colors.success,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.accent,
              foregroundColor: context.colors.textOnAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text('Call', style: context.textStyles.primaryButton),
          ),
        ],
      ),
    );
  }

  void _handleChatTechnician() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          'Chat with ${_serviceProgress.technicianName}',
          style: context.textStyles.cardTitle,
        ),
        content: Text(
          'Chat functionality would open here to communicate with your technician.',
          style: context.textStyles.bodyTextSmall,
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              'Close',
              style: context.textStyles.bodyText.copyWith(
                color: context.colors.accent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleApproveSpare(int spareId) {
    setState(() {
      final updatedSpareParts = _serviceProgress.spareParts.map((part) {
        if (part.id == spareId) {
          return part.copyWith(approved: true);
        }
        return part;
      }).toList();

      _serviceProgress = _serviceProgress.copyWith(
        spareParts: updatedSpareParts,
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Spare part approved',
          style: context.textStyles.bodyTextSmall.copyWith(color: Colors.white),
        ),
        backgroundColor: context.colors.success,
      ),
    );
  }

  void _handleRejectSpare(int spareId) {
    setState(() {
      final updatedSpareParts = _serviceProgress.spareParts
          .where((part) => part.id != spareId)
          .toList();

      _serviceProgress = _serviceProgress.copyWith(
        spareParts: updatedSpareParts,
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Spare part rejected',
          style: context.textStyles.bodyTextSmall.copyWith(color: Colors.white),
        ),
        backgroundColor: context.colors.error,
      ),
    );
  }

  void _handleCompleteService() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text('Complete Service?', style: context.textStyles.cardTitle),
        content: Text(
          'Mark this service as completed? This will proceed to the final bill.',
          style: context.textStyles.bodyTextSmall,
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              'Cancel',
              style: context.textStyles.bodyText.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.pop();
              setState(() {
                _serviceProgress = _serviceProgress.copyWith(
                  currentStatus: ServiceStatus.completed,
                );
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Service completed! Proceeding to final bill...',
                    style: context.textStyles.bodyTextSmall.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: context.colors.success,
                ),
              );
              context.pushReplacement(
                CustomerRoutes.finalBillScreen,
                extra: widget.bookingId,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.success,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              'Complete',
              style: context.textStyles.primaryButton.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Column(
        children: [
          // Header
          ServiceProgressHeader(bookingId: _serviceProgress.bookingId),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.r),
              child: Column(
                spacing: 24.h,
                children: [
                  // Service Status Progress
                  ServiceStatusCard(serviceProgress: _serviceProgress),

                  // Technician Contact Info
                  TechnicianContactInfo(
                    serviceProgress: _serviceProgress,
                    onCallPressed: _handleCallTechnician,
                    onChatPressed: _handleChatTechnician,
                  ),

                  // Spare Parts (if any)
                  SparePartsCard(
                    spareParts: _serviceProgress.spareParts,
                    onApprove: _handleApproveSpare,
                    onReject: _handleRejectSpare,
                  ),

                  // Complete Service Button
                  ServiceActionButton(
                    currentStatus: _serviceProgress.currentStatus,
                    onCompleteService: _handleCompleteService,
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
