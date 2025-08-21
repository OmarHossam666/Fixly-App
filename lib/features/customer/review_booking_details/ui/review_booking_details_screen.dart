import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/core/routing/routes/customer_routes.dart';
import 'package:fixly/features/customer/review_booking_details/data/booking_details_data.dart';
import 'package:fixly/features/customer/review_booking_details/models/booking_details_model.dart';
import 'package:fixly/features/customer/review_booking_details/ui/widgets/confirm_booking_button.dart';
import 'package:fixly/features/customer/review_booking_details/ui/widgets/payment_method_card.dart';
import 'package:fixly/features/customer/review_booking_details/ui/widgets/price_details_card.dart';
import 'package:fixly/features/customer/review_booking_details/ui/widgets/review_booking_app_bar.dart';
import 'package:fixly/features/customer/review_booking_details/ui/widgets/service_details_card.dart';
import 'package:fixly/features/customer/review_booking_details/ui/widgets/technician_info_card.dart';
import 'package:fixly/features/customer/technician_profile/data/technicians_data.dart';
import 'package:fixly/features/customer/technician_profile/models/technician_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ReviewBookingDetailsScreen extends StatefulWidget {
  final int? technicianId;
  final String? serviceName;

  const ReviewBookingDetailsScreen({
    super.key,
    this.technicianId,
    this.serviceName,
  });

  @override
  State<ReviewBookingDetailsScreen> createState() =>
      _ReviewBookingDetailsScreenState();
}

class _ReviewBookingDetailsScreenState
    extends State<ReviewBookingDetailsScreen> {
  late BookingDetailsModel _bookingDetails;
  late TechnicianModel _selectedTechnician;
  late ServiceDetailsModel _serviceDetails;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    // Get technician data - using first technician as default for demo
    _selectedTechnician = widget.technicianId != null
        ? TechniciansData.availableTechnicians.firstWhere(
            (tech) => tech.id == widget.technicianId,
            orElse: () => TechniciansData.availableTechnicians.first,
          )
        : TechniciansData.availableTechnicians.first;

    // Initialize booking details
    _bookingDetails = BookingDetailsData.defaultBookingDetails;

    // Initialize service details
    _serviceDetails = BookingDetailsData.getServiceDetails(
      serviceName: widget.serviceName ?? 'Plumbing',
      arrivalTime: _selectedTechnician.arrivalTime,
    );
  }

  void _handlePromoCodeChanged(String promoCode) {
    setState(() {
      _bookingDetails = _bookingDetails.copyWith(promoCode: promoCode);
    });
  }

  void _handleEditLocation() {
    // Show location edit dialog or navigate to location selection
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text('Edit Location', style: context.textStyles.cardTitle),
        content: Text(
          'Location editing functionality would be implemented here.',
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

  void _handleChangePaymentMethod() {
    // Show payment method selection dialog
    showModalBottomSheet(
      context: context,
      backgroundColor: context.colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Payment Method',
              style: context.textStyles.sectionHeader,
            ),
            SizedBox(height: 16.h),
            ...BookingDetailsData.availablePaymentMethods.map(
              (method) => ListTile(
                leading: Icon(
                  method.toLowerCase().contains('cash')
                      ? Icons.payments
                      : Icons.credit_card,
                  color: context.colors.primary,
                ),
                title: Text(method, style: context.textStyles.bodyText),
                trailing: _bookingDetails.paymentMethod == method
                    ? Icon(Icons.check_circle, color: context.colors.accent)
                    : null,
                onTap: () {
                  setState(() {
                    _bookingDetails = _bookingDetails.copyWith(
                      paymentMethod: method,
                    );
                  });
                  context.pop();
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }

  void _handleConfirmBooking() {
    setState(() {
      _isLoading = true;
    });

    // Simulate booking confirmation
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        // Show success dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            backgroundColor: context.colors.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 64.w,
                  height: 64.h,
                  decoration: BoxDecoration(
                    color: context.colors.success.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    color: context.colors.success,
                    size: 32.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Booking Confirmed!',
                  style: context.textStyles.cardTitle.copyWith(
                    color: context.colors.success,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Text(
                  '${_selectedTechnician.name} is on the way to your location.',
                  style: context.textStyles.bodyTextSmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.pop(); // Close dialog
                    context.push(
                      CustomerRoutes.bookingConfirmationScreen,
                      extra: widget.technicianId,
                    ); // Go back to previous screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colors.accent,
                    foregroundColor: context.colors.textOnAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Text(
                    'Track Technician',
                    style: context.textStyles.primaryButton,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Column(
        children: [
          // Custom App Bar
          ReviewBookingAppBar(onBackPressed: () => context.pop()),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24.r),
              child: Column(
                children: [
                  // Technician Info Card
                  TechnicianInfoCard(technician: _selectedTechnician),
                  SizedBox(height: 24.h),

                  // Service Details Card
                  ServiceDetailsCard(
                    serviceDetails: _serviceDetails,
                    bookingDetails: _bookingDetails,
                    onEditLocation: _handleEditLocation,
                  ),
                  SizedBox(height: 24.h),

                  // Price Details Card
                  PriceDetailsCard(
                    bookingDetails: _bookingDetails,
                    onPromoCodeChanged: _handlePromoCodeChanged,
                  ),
                  SizedBox(height: 24.h),

                  // Payment Method Card
                  PaymentMethodCard(
                    bookingDetails: _bookingDetails,
                    onChangePaymentMethod: _handleChangePaymentMethod,
                  ),
                  SizedBox(height: 100.h), // Space for sticky button
                ],
              ),
            ),
          ),
        ],
      ),

      // Sticky Confirm Button
      bottomNavigationBar: ConfirmBookingButton(
        onPressed: _handleConfirmBooking,
        isLoading: _isLoading,
      ),
    );
  }
}
