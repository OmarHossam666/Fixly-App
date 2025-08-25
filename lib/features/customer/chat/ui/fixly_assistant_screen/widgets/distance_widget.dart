import 'package:fixly/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class DistanceWidget extends StatelessWidget {
  final String distance;
  const DistanceWidget({super.key, required this.distance});

  @override
  Widget build(BuildContext context) {
    return   Row(
            children: [
              const Icon(Icons.location_on, color: Colors.orange, size: 16),
              horizontalSpacing(4),
              Text(
                distance,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          );
  }
}