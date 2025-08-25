import 'package:flutter/material.dart';

class MenuItemModel {
  final String id;
  final IconData icon;
  final String title;
  final String subtitle;

  const MenuItemModel({
    required this.id,
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

class MenuSectionModel {
  final String title;
  final List<MenuItemModel> items;

  const MenuSectionModel({required this.title, required this.items});
}
