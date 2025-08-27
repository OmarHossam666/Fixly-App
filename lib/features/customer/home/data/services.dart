
import 'package:fixly/features/customer/home/models/service.dart';
import 'package:flutter/material.dart';

class ServiceData {
  static const List<Service> popularServices = [
    Service(
      id: 1,
      name: "plumber",
      icon: Icons.water_drop_outlined,
      color: Color(0xFF3B82F6),
      description: "Pipes, faucets, leaks", subservices:  [
          {
            'id': 'faucet-repair',
            'name': 'Faucet Repair & Installation',
            'description': 'Fixing leaks, drips, or installing new faucets',
            'icon': Icons.water_drop,
          },
          {
            'id': 'drain-cleaning',
            'name': 'Drain Cleaning',
            'description': 'Unclogging sinks, tubs, and floor drains',
            'icon': Icons.water_drop,
          },
          {
            'id': 'toilet-repair',
            'name': 'Toilet Repair',
            'description': 'Fixing running toilets, clogs, and installations',
            'icon': Icons.water_drop,
          },
          {
            'id': 'pipe-repair',
            'name': 'Pipe Repair',
            'description': 'Fixing leaky or burst pipes',
            'icon': Icons.water_drop,
          },
          {
            'id': 'water-heater',
            'name': 'Water Heater Service',
            'description': 'Repair and maintenance of water heaters',
            'icon': Icons.water_drop,
          },
        ],
    ),
    Service(
      id: 2,
      name: "electrician",
      icon: Icons.flash_on_outlined,
      color: Color(0xFFF59E0B),
      description: "Wiring, outlets, switches", subservices: [
          {
            'id': 'outlet-repair',
            'name': 'Outlet & Switch Repair',
            'description': 'Fixing non-working outlets and switches',
            'icon': Icons.bolt,
          },
          {
            'id': 'light-installation',
            'name': 'Light Fixture Installation',
            'description': 'Installing ceiling fans, chandeliers, and lights',
            'icon': Icons.bolt,
          },
          {
            'id': 'circuit-breaker',
            'name': 'Circuit Breaker Issues',
            'description': 'Fixing tripped breakers and electrical panels',
            'icon': Icons.bolt,
          },
          {
            'id': 'wiring-repair',
            'name': 'Wiring Repair',
            'description': 'Fixing faulty or damaged electrical wiring',
            'icon': Icons.bolt,
          },
          {
            'id': 'electrical-safety',
            'name': 'Electrical Safety Check',
            'description': 'Complete electrical system inspection',
            'icon': Icons.bolt,
          },
        ],
    ),
    Service(
      id: 3,
      name: "AC Repair",
      icon: Icons.ac_unit_outlined,
      color: Color(0xFF06B6D4),
      description: "Cooling, heating, maintenance", subservices:  [
          {
            'id': 'ac-not-cooling',
            'name': 'AC Not Cooling',
            'description': 'Diagnosing and fixing cooling issues',
            'icon': Icons.ac_unit,
          },
          {
            'id': 'ac-maintenance',
            'name': 'AC Maintenance',
            'description': 'Regular cleaning and tune-up services',
            'icon': Icons.ac_unit,
          },
          {
            'id': 'ac-installation',
            'name': 'AC Installation',
            'description': 'Installing new air conditioning units',
            'icon': Icons.ac_unit,
          },
          {
            'id': 'thermostat-repair',
            'name': 'Thermostat Issues',
            'description': 'Fixing and calibrating thermostats',
            'icon': Icons.ac_unit,
          },
          {
            'id': 'duct-cleaning',
            'name': 'Duct Cleaning',
            'description': 'Air duct cleaning and maintenance',
            'icon': Icons.ac_unit,
          },
        ],
    ),
    Service(
      id: 4,
      name: "Carpentry",
      icon: Icons.build_outlined,
      color: Color(0xFF8B5CF6),
      description: "Furniture, doors, repairs", subservices: [
          {
            'id': 'door-repair',
            'name': 'Door Repair & Installation',
            'description': 'Fixing doors that stick, squeak, or won\'t close',
            'icon': Icons.build,
          },
          {
            'id': 'furniture-repair',
            'name': 'Furniture Repair',
            'description': 'Fixing broken chairs, tables, and cabinets',
            'icon': Icons.build,
          },
          {
            'id': 'shelf-installation',
            'name': 'Shelf & Cabinet Installation',
            'description': 'Mounting shelves and installing cabinets',
            'icon': Icons.build,
          },
          {
            'id': 'window-repair',
            'name': 'Window Repair',
            'description': 'Fixing window frames and mechanisms',
            'icon': Icons.build,
          },
          {
            'id': 'custom-carpentry',
            'name': 'Custom Carpentry',
            'description': 'Built-in storage and custom woodwork',
            'icon': Icons.build,
          },
        ],
    ),
    Service(
      id: 5,
      name: "Home Appliances",
      icon: Icons.settings_outlined,
      color: Color(0xFF10B981),
      description: "Washing machine, fridge, oven", subservices:  [
          {
            'id': 'washer-repair',
            'name': 'Washing Machine Repair',
            'description': 'Fixing washing machines that won\'t spin or drain',
            'icon': Icons.settings,
          },
          {
            'id': 'refrigerator-repair',
            'name': 'Refrigerator Repair',
            'description': 'Not cooling, strange noises, or ice maker issues',
            'icon': Icons.settings,
          },
          {
            'id': 'oven-repair',
            'name': 'Oven & Stove Repair',
            'description': 'Fixing gas and electric ovens and stoves',
            'icon': Icons.settings,
          },
          {
            'id': 'dishwasher-repair',
            'name': 'Dishwasher Repair',
            'description': 'Not cleaning, draining, or starting properly',
            'icon': Icons.settings,
          },
          {
            'id': 'microwave-repair',
            'name': 'Microwave Repair',
            'description': 'Not heating or electrical issues',
            'icon': Icons.settings,
          },
        ],
    ),
    Service(
      id: 6,
      name: "Painting",
      icon: Icons.brush_outlined,
      color: Color(0xFFEF4444),
      description: "Interior, exterior, touch-ups", subservices: [
          {
            'id': 'interior-painting',
            'name': 'Interior Painting',
            'description': 'Painting walls, ceilings, and trim',
            'icon': Icons.brush,
          },
          {
            'id': 'exterior-painting',
            'name': 'Exterior Painting',
            'description': 'Painting house exteriors and outdoor surfaces',
            'icon': Icons.brush,
          },
          {
            'id': 'touch-up-painting',
            'name': 'Touch-up & Repair',
            'description': 'Small paint repairs and touch-ups',
            'icon': Icons.brush,
          },
          {
            'id': 'wallpaper-removal',
            'name': 'Wallpaper Removal',
            'description': 'Removing old wallpaper and preparing walls',
            'icon': Icons.brush,
          },
          {
            'id': 'cabinet-painting',
            'name': 'Cabinet Painting',
            'description': 'Refinishing kitchen and bathroom cabinets',
            'icon': Icons.brush,
          },
        ],
    ),
  ];
}