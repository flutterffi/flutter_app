import 'package:flutter/material.dart';

import 'package:flutter_app/src/modules/root/model/navigation_tab_model.dart';

class RootBottomNavigationView extends StatelessWidget {
  const RootBottomNavigationView({
    required this.tabs,
    required this.currentIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final List<NavigationTabModel> tabs;
  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: tabs
          .map(
            (tab) => NavigationDestination(
              icon: Icon(tab.icon),
              selectedIcon: Icon(tab.selectedIcon),
              label: tab.label,
            ),
          )
          .toList(),
    );
  }
}
