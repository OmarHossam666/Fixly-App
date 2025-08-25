import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/booking/data/booking_data.dart';
import 'package:fixly/features/customer/booking/models/booking_model.dart';
import 'package:fixly/features/customer/booking/ui/widgets/booking_card.dart';
import 'package:fixly/features/customer/booking/ui/widgets/booking_status_tabs.dart';
import 'package:fixly/features/customer/booking/ui/widgets/empty_bookings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  BookingStatus? _selectedStatus;
  List<BookingModel> _bookings = [];
  List<BookingModel> _filteredBookings = [];
  Map<BookingStatus, int> _statusCounts = {};

  @override
  void initState() {
    super.initState();
    _loadBookings();
  }

  void _loadBookings() {
    setState(() {
      _bookings = BookingData.getAllBookings();
      _updateStatusCounts();
      _filterBookings();
    });
  }

  void _updateStatusCounts() {
    _statusCounts = {
      BookingStatus.upcoming: BookingData.getBookingsCountByStatus(
        BookingStatus.upcoming,
      ),
      BookingStatus.inProgress: BookingData.getBookingsCountByStatus(
        BookingStatus.inProgress,
      ),
      BookingStatus.completed: BookingData.getBookingsCountByStatus(
        BookingStatus.completed,
      ),
      BookingStatus.cancelled: BookingData.getBookingsCountByStatus(
        BookingStatus.cancelled,
      ),
    };
  }

  void _filterBookings() {
    if (_selectedStatus == null) {
      _filteredBookings = List.from(_bookings);
    } else {
      _filteredBookings = _bookings
          .where((booking) => booking.status == _selectedStatus)
          .toList();
    }

    // Sort bookings by date (most recent first)
    _filteredBookings.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  void _onStatusChanged(BookingStatus? status) {
    setState(() {
      _selectedStatus = status;
      _filterBookings();
    });
  }

  void _onActionPressed(String action, BookingModel booking) {
    switch (action) {
      case 'Call':
        _handleCallTechnician(booking);
        break;
      case 'Cancel':
        _handleCancelBooking(booking);
        break;
      case 'Track Progress':
        _handleTrackProgress(booking);
        break;
      case 'Book Again':
        _handleBookAgain(booking);
        break;
    }
  }

  void _handleCallTechnician(BookingModel booking) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text('Call Technician', style: context.textStyles.cardTitle),
        content: Text(
          'Do you want to call ${booking.technician.name}?',
          style: context.textStyles.bodyText,
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
              _showSnackBar('Calling ${booking.technician.name}...');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.accent,
              foregroundColor: Colors.white,
            ),
            child: Text(
              'Call',
              style: context.textStyles.bodyTextBold.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleCancelBooking(BookingModel booking) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text('Cancel Booking', style: context.textStyles.cardTitle),
        content: Text(
          'Are you sure you want to cancel this booking? This action cannot be undone.',
          style: context.textStyles.bodyText,
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
              _cancelBooking(booking);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.error,
              foregroundColor: Colors.white,
            ),
            child: Text(
              'Cancel Booking',
              style: context.textStyles.bodyTextBold.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleTrackProgress(BookingModel booking) {
    _showSnackBar('Opening service progress for ${booking.service}...');
    // In a real app, navigate to service progress screen
    // context.push('/service-progress/${booking.id}');
  }

  void _handleBookAgain(BookingModel booking) {
    _showSnackBar('Booking ${booking.service} service again...');
    // In a real app, navigate to booking flow with pre-filled service
    // context.push('/book-service?service=${booking.service}');
  }

  void _cancelBooking(BookingModel booking) {
    setState(() {
      final updatedBookings = BookingData.updateBookingStatus(
        booking.id,
        BookingStatus.cancelled,
      );
      _bookings = updatedBookings;
      _updateStatusCounts();
      _filterBookings();
    });

    _showSnackBar('Booking cancelled successfully');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: context.textStyles.bodyText.copyWith(color: Colors.white),
        ),
        backgroundColor: context.colors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    );
  }

  void _onBookServicePressed() {
    _showSnackBar('Navigating to service booking...');
    // In a real app, navigate to service selection screen
    // context.push('/services');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildHeader(context),

            // Status Tabs
            BookingStatusTabs(
              selectedStatus: _selectedStatus,
              onStatusChanged: _onStatusChanged,
              statusCounts: _statusCounts,
            ),

            // Bookings List
            Expanded(
              child: _filteredBookings.isEmpty
                  ? EmptyBookingsWidget(
                      filterStatus: _selectedStatus,
                      onBookServicePressed: _selectedStatus == null
                          ? _onBookServicePressed
                          : null,
                    )
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      itemCount: _filteredBookings.length,
                      itemBuilder: (context, index) {
                        final booking = _filteredBookings[index];
                        return BookingCard(
                          booking: booking,
                          onActionPressed: _onActionPressed,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Bookings', style: context.textStyles.headline),
          Text(
            'Track your repair service appointments',
            style: context.textStyles.bodyText,
          ),
        ],
      ),
    );
  }
}
