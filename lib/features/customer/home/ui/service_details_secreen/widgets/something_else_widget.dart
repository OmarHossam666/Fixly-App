import 'package:fixly/core/helpers/spacing.dart';
import 'package:fixly/features/customer/home/logic/service_functions.dart';
import 'package:flutter/material.dart';

class SomethingElseWidget extends StatelessWidget {
  const SomethingElseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => handleUnsure(context),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF374151),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF4B5563),
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF6B7280),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.help_outline,
                size: 24,
                color: Colors.white,
              ),
            ),
            horizontalSpacing(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Something Else / Not Sure',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  verticalSpacing(4),
                  const Text(
                    'Let our assistant help you identify the problem',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF9CA3AF),
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, size: 20, color: Color(0xFF9CA3AF)),
          ],
        ),
      ),
    );
  }
}
