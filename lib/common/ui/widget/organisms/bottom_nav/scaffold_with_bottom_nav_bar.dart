import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';

class OrganismScaffoldWithBottomNavBar extends StatefulWidget {
  const OrganismScaffoldWithBottomNavBar({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  State<OrganismScaffoldWithBottomNavBar> createState() =>
      _OrganismScaffoldWithBottomNavBarState();
}

class _OrganismScaffoldWithBottomNavBarState
    extends State<OrganismScaffoldWithBottomNavBar> {
  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index =
        tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    return index < 0 ? 0 : index;
  }

  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      context.go(tabs[tabIndex].initialLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferenceSettingsProvider>(
        builder: (context, prefSetProvider, _) {
      return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: prefSetProvider.systemUiOverlayStyle, child: widget.child),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: tabs,
          onTap: (index) => _onItemTapped(context, index),
        ),
      );
    });
  }
}

class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  const ScaffoldWithNavBarTabItem(
      {required this.initialLocation, required Widget icon, String? label})
      : super(icon: icon, label: label);

  final String initialLocation;
}

const tabs = [
  ScaffoldWithNavBarTabItem(
    initialLocation: '/home-view',
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  ScaffoldWithNavBarTabItem(
    initialLocation: '/quran-view',
    icon: Icon(Icons.menu_book_rounded),
    label: 'Quran',
  ),
  ScaffoldWithNavBarTabItem(
    initialLocation: '/settings-view',
    icon: Icon(Icons.settings),
    label: 'Settings',
  ),
];
