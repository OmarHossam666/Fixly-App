import 'package:fixly/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class ProfilePhotoNameFixlyFlashWidgets extends StatelessWidget {
  final String firstName;
  final String lastName;
  final double rating;
  final bool flash;
  final bool verified;

  const ProfilePhotoNameFixlyFlashWidgets({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.rating,
    required this.flash,
    required this.verified,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xFF2C2C3E),
                    radius: 30,
                    child: Text(
                      "${firstName[0]}${lastName.isNotEmpty ? lastName[0] : ''}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (verified)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFF4CAF50),
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ),
                ],
              ),
              horizontalSpacing(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$firstName $lastName",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    verticalSpacing(4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 16),
                        horizontalSpacing(4),
                        Text(
                          rating.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (flash)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.flash_on, color: Colors.white, size: 12),
                      SizedBox(width: 4),
                      Text(
                        "FIXLY FLASH",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
  }
}