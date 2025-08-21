import 'package:flutter/material.dart';

class Service {
  final int id;
  final String name;
  final IconData icon;
  final Color color;
  final String description;

  const Service({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.description,
  });
}