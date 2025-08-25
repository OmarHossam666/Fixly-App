import 'package:flutter/material.dart';

class ServicesWidget extends StatelessWidget {
  final List<String> services;
  const ServicesWidget({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return  // Services Tags
            Row(
              children: services
                  .map(
                    (service) => Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2196F3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        service,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );


  }
}