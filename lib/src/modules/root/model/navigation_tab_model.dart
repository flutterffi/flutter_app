import 'package:flutter/material.dart';

class NavigationTabModel {
  const NavigationTabModel({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
}
