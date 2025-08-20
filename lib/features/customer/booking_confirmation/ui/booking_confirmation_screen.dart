import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/booking_confirmation/data/booking_confirmation_data.dart';
import 'package:fixly/features/customer/booking_confirmation/models/booking_confirmation_model.dart';
import 'package:fixly/features/customer/booking_confirmation/ui/widgets/booking_action_buttons.dart';
import 'package:fixly/features/customer/booking_confirmation/ui/widgets/booking_confirmation_header.dart';
import 'package:fixly/features/customer/booking_confirmation/ui/widgets/live_tracking_card.dart';
import 'package:fixly/features/customer/booking_confirmation/ui/widgets/service_details_reminder_card.dart';
import 'package:fixly/features/customer/booking_confirmation/ui/widgets/technician_contact_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BookingConfirmationScreen extends StatefulWidget {
  final String? bookingId;
  final String? technicianName;
  final String? serviceName;

  const BookingConfirmationScreen({
    super.key,
    this.bookingId,
    this.technicianName,
    this.serviceName,
  });

  @override
  State<BookingConfirmationScreen> createState() =>
      _BookingConfirmationScreenState();
}

class _BookingConfirmationScreenState extends State<BookingConfirmationScreen> {
  late BookingConfirmationModel _booking;

  @override
  void initState() {
    super.initState();
    _initializeBooking();
    _startLocationUpdates();
  }

  void _initializeBooking() {
    // Create booking confirmation with provided data or defaults
    _booking = BookingConfirmationData.createBookingConfirmation(
      technicianName: widget.technicianName ?? 'Hassan Mahmoud',
      technicianTier: 'Master Plumber',
      technicianPhoto: '👨‍🔧',
      serviceName: widget.serviceName ?? 'Plumbing',
      visitFee: 50,
      address: '123 Main Street, Apartment 4B, Cairo',
      distance: '2.5 km',
      estimatedArrival: '20 min',
    );

    // Use provided booking ID if available
    if (widget.bookingId != null) {
      _booking = _booking.copyWith(bookingId: widget.bookingId);
    }
  }

  void _startLocationUpdates() {
    // Simulate technician location updates
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _booking = _booking.copyWith(
            distance: '2.2 km',
            estimatedArrival: '18 min',
            status: BookingStatus.technicianEnRoute,
          );
        });
      }
    });

    Future.delayed(const Duration(seconds: 8), () {
      if (mounted) {
        setState(() {
          _booking = _booking.copyWith(
            distance: '1.8 km',
            estimatedArrival: '15 min',
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
          'Call ${_booking.technicianName}?',
          style: context.textStyles.cardTitle,
        ),
        content: Text(
          'This will initiate a phone call to your technician.',
          style: context.textStyles.bodyTextSmall,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: context.textStyles.bodyText.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Simulate call functionality
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Calling ${_booking.technicianName}...',
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
          'Chat with ${_booking.technicianName}',
          style: context.textStyles.cardTitle,
        ),
        content: Text(
          'Chat functionality would open here to communicate with your technician.',
          style: context.textStyles.bodyTextSmall,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
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

  void _handleStartService() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text('Start Service', style: context.textStyles.cardTitle),
        content: Text(
          'This would transition to the service in progress screen.',
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
                _booking = _booking.copyWith(
                  status: BookingStatus.serviceInProgress,
                );
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Service started! Transitioning to service progress...',
                    style: context.textStyles.bodyTextSmall.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: context.colors.success,
                ),
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
              'Start',
              style: context.textStyles.primaryButton.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleCancelBooking() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          'Cancel Booking?',
          style: context.textStyles.cardTitle.copyWith(
            color: context.colors.error,
          ),
        ),
        content: Text(
          'Are you sure you want to cancel this booking? This action cannot be undone.',
          style: context.textStyles.bodyTextSmall,
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              'Keep Booking',
              style: context.textStyles.bodyText.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.pop();
              setState(() {
                _booking = _booking.copyWith(status: BookingStatus.cancelled);
              });

              // Show cancellation confirmation and navigate back
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Booking cancelled successfully',
                    style: context.textStyles.bodyTextSmall.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: context.colors.error,
                ),
              );
              context.pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.error,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              'Cancel Booking',
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
          // Header with confirmation message
          BookingConfirmationHeader(booking: _booking),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.r),
              child: Column(
                children: [
                  // Live Tracking Map
                  LiveTrackingCard(booking: _booking),
                  SizedBox(height: 24.h),

                  // Technician Contact Info
                  TechnicianContactCard(
                    booking: _booking,
                    onCallPressed: _handleCallTechnician,
                    onChatPressed: _handleChatTechnician,
                  ),
                  SizedBox(height: 24.h),

                  // Service Details Reminder
                  ServiceDetailsReminderCard(booking: _booking),
                  SizedBox(height: 24.h),

                  // Action Buttons
                  BookingActionButtons(
                    onStartService: _handleStartService,
                    onCancelBooking: _handleCancelBooking,
                    showStartService:
                        _booking.status != BookingStatus.cancelled,
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
