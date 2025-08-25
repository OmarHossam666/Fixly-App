import 'package:fixly/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class AvailableNow extends StatelessWidget {
  final bool available;
  const AvailableNow({super.key, required this.available});

  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              Icon(
                available ? Icons.access_time : Icons.access_time_filled,
                color: available ? Colors.green : Colors.red,
                size: 16,
              ),
              horizontalSpacing(4),
              Text(
                available ? "Available Now" : "Not Available",
                style: TextStyle(
                  color: available ? Colors.green : Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
  }
}