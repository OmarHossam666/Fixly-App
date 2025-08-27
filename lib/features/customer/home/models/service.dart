import 'package:flutter/material.dart';

class Service {
  final int id;
  final String name;
  final IconData icon;
  final Color color;
  final String description;
  final List<Map<String, dynamic>>? subservices;

  const Service(
   {
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.description,
    required this.subservices,
  });
}
