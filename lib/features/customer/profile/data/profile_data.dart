import 'package:fixly/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import '../models/profile_model.dart';
import '../models/menu_item_model.dart';

class ProfileData {
  static const ProfileModel profileData = ProfileModel(
    name: 'Omar Hossam',
    email: 'omar.hossam@example.com',
    phone: '+20 10 18 16 6147 ',
    address: '123 Main St, Cairo, Egypt',
    joinDate: 'Member since Jan 2024',
    completedServices: 12,
    rating: 5.0,
    image: AppAssets.customerProfileImage,
  );

  static const List<MenuSectionModel> menuSections = [
    MenuSectionModel(
      title: 'Account',
      items: [
        MenuItemModel(
          id: 'edit-profile',
          icon: Icons.edit,
          title: 'Edit Profile',
          subtitle: 'Update your personal information',
        ),
        MenuItemModel(
          id: 'addresses',
          icon: Icons.location_on,
          title: 'My Addresses',
          subtitle: 'Manage saved locations',
        ),
        MenuItemModel(
          id: 'payment',
          icon: Icons.credit_card,
          title: 'Payment Methods',
          subtitle: 'Cards and payment options',
        ),
      ],
    ),
    MenuSectionModel(
      title: 'Preferences',
      items: [
        MenuItemModel(
          id: 'notifications',
          icon: Icons.notifications,
          title: 'Notifications',
          subtitle: 'Manage your notifications',
        ),
        MenuItemModel(
          id: 'settings',
          icon: Icons.settings,
          title: 'App Settings',
          subtitle: 'Language, theme, and more',
        ),
      ],
    ),
    MenuSectionModel(
      title: 'Support',
      items: [
        MenuItemModel(
          id: 'service-history',
          icon: Icons.history,
          title: 'Service History',
          subtitle: 'View all past services',
        ),
        MenuItemModel(
          id: 'help',
          icon: Icons.help_outline,
          title: 'Help & Support',
          subtitle: 'Get help and contact us',
        ),
      ],
    ),
  ];
}
