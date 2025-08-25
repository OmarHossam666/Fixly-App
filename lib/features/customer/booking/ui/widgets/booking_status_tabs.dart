import 'package:fixly/core/constants/app_colors.dart';
import 'package:fixly/core/constants/app_styles.dart';
import 'package:fixly/features/customer/booking/models/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingStatusTabs extends StatelessWidget {
  final BookingStatus? selectedStatus;
  final Function(BookingStatus?) onStatusChanged;
  final Map<BookingStatus, int> statusCounts;

  const BookingStatusTabs({
    super.key,
    required this.selectedStatus,
    required this.onStatusChanged,
    required this.statusCounts,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = [
      _TabData(
        status: null,
        label: 'All',
        count: statusCounts.values.fold(0, (sum, count) => sum + count),
      ),
      _TabData(
        status: BookingStatus.upcoming,
        label: 'Upcoming',
        count: statusCounts[BookingStatus.upcoming] ?? 0,
      ),
      _TabData(
        status: BookingStatus.inProgress,
        label: 'Active',
        count: statusCounts[BookingStatus.inProgress] ?? 0,
      ),
      _TabData(
        status: BookingStatus.completed,
        label: 'Completed',
        count: statusCounts[BookingStatus.completed] ?? 0,
      ),
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: tabs.asMap().entries.map((entry) {
            final index = entry.key;
            final tab = entry.value;
            final isSelected = selectedStatus == tab.status;
            final isLast = index == tabs.length - 1;

            return Padding(
              padding: EdgeInsets.only(right: isLast ? 0 : 12.w),
              child: _buildTab(context, tab, isSelected),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTab(BuildContext context, _TabData tab, bool isSelected) {
    return GestureDetector(
      onTap: () => onStatusChanged(tab.status),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? context.colors.accent : context.colors.surface,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected
                ? context.colors.accent
                : context.colors.borderLight,
            width: 1.w,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              tab.label,
              style: context.textStyles.bodyTextBold.copyWith(
                color: isSelected ? Colors.white : context.colors.text,
                fontSize: 14.sp,
              ),
            ),
            if (tab.count > 0) ...[
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.white.withValues(alpha: 0.2)
                      : context.colors.accent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  tab.count.toString(),
                  style: context.textStyles.caption.copyWith(
                    color: isSelected ? Colors.white : context.colors.accent,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _TabData {
  final BookingStatus? status;
  final String label;
  final int count;

  const _TabData({
    required this.status,
    required this.label,
    required this.count,
  });
}
