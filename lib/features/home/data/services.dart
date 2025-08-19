import 'package:fixly/features/home/models/service.dart';
import 'package:flutter/material.dart';

class ServiceData {
  static const List<Service> popularServices = [
    Service(
      id: 1,
      name: "Plumbing",
      icon: Icons.water_drop_outlined,
      color: Color(0xFF3B82F6),
      description: "Pipes, faucets, leaks",
    ),
    Service(
      id: 2,
      name: "Electricity",
      icon: Icons.flash_on_outlined,
      color: Color(0xFFF59E0B),
      description: "Wiring, outlets, switches",
    ),
    Service(
      id: 3,
      name: "AC Repair",
      icon: Icons.ac_unit_outlined,
      color: Color(0xFF06B6D4),
      description: "Cooling, heating, maintenance",
    ),
    Service(
      id: 4,
      name: "Carpentry",
      icon: Icons.build_outlined,
      color: Color(0xFF8B5CF6),
      description: "Furniture, doors, repairs",
    ),
    Service(
      id: 5,
      name: "Home Appliances",
      icon: Icons.settings_outlined,
      color: Color(0xFF10B981),
      description: "Washing machine, fridge, oven",
    ),
    Service(
      id: 6,
      name: "Painting",
      icon: Icons.brush_outlined,
      color: Color(0xFFEF4444),
      description: "Interior, exterior, touch-ups",
    ),
  ];
}