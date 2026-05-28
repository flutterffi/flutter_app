import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/src/modules/discover/page/discover_page.dart';
import 'package:flutter_app/src/modules/home/page/home_page.dart';
import 'package:flutter_app/src/modules/notifications/page/notifications_page.dart';
import 'package:flutter_app/src/modules/profile/page/profile_page.dart';
import 'package:flutter_app/src/modules/root/model/navigation_tab_model.dart';
import 'package:flutter_app/src/modules/root/view/root_bottom_navigation_view.dart';
import 'package:flutter_app/src/modules/root/viewmodel/root_tab_viewmodel.dart';
import 'package:flutter_app/src/modules/workspace/page/workspace_page.dart';

class RootPage extends ConsumerWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selectedIndex = ref.watch(rootTabViewmodelProvider);

    final tabs = [
      NavigationTabModel(
        label: l10n.tabHome,
        icon: Icons.home_outlined,
        selectedIcon: Icons.home,
      ),
      NavigationTabModel(
        label: l10n.tabDiscover,
        icon: Icons.explore_outlined,
        selectedIcon: Icons.explore,
      ),
      NavigationTabModel(
        label: l10n.tabWorkspace,
        icon: Icons.dashboard_customize_outlined,
        selectedIcon: Icons.dashboard_customize,
      ),
      NavigationTabModel(
        label: l10n.tabNotifications,
        icon: Icons.notifications_outlined,
        selectedIcon: Icons.notifications,
      ),
      NavigationTabModel(
        label: l10n.tabProfile,
        icon: Icons.person_outline,
        selectedIcon: Icons.person,
      ),
    ];

    final pages = const [
      HomePage(),
      DiscoverPage(),
      WorkspacePage(),
      NotificationsPage(),
      ProfilePage(),
    ];

    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: RootBottomNavigationView(
        tabs: tabs,
        currentIndex: selectedIndex,
        onDestinationSelected: (index) {
          ref.read(rootTabViewmodelProvider.notifier).selectTab(index);
        },
      ),
    );
  }
}
