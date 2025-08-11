import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:todoapp/features/dashboard/views/calendar_view.dart';
import 'package:todoapp/features/dashboard/views/home_view.dart';
import 'package:todoapp/features/dashboard/views/notification_view.dart';
import 'package:todoapp/features/dashboard/views/setting_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;
  bool _isAnimating = false;

  Future<void> _onItemTapped(int index) async {
    _isAnimating = true;
    await _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
    setState(() {
      _selectedIndex = index;
    });
    _isAnimating = false;
  }

  void _onPageChanged(int index) {
    if (!_isAnimating) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const [
          HomeView(),
          NotificationView(),
          CalendarView(),
          SettingView(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(FeatherIcons.home, color: _selectedIndex == 0 ? Colors.blue : Colors.grey),
              onPressed: () => _onItemTapped(0),
              style: IconButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
            ),
            IconButton(
              icon: Icon(FeatherIcons.bell, color: _selectedIndex == 1 ? Colors.blue : Colors.grey),
              onPressed: () => _onItemTapped(1),
              style: IconButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFF0075DC),
              child: IconButton(
                icon: const Icon(FeatherIcons.plus, color: Colors.white),
                onPressed: () {
                  //
                },
                style: IconButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                ),
              ),
            ),
            IconButton(
              icon: Icon(FeatherIcons.calendar,
                  color: _selectedIndex == 2 ? Colors.blue : Colors.grey),
              onPressed: () => _onItemTapped(2),
              style: IconButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
            ),
            IconButton(
              icon: Icon(FeatherIcons.settings,
                  color: _selectedIndex == 3 ? Colors.blue : Colors.grey),
              onPressed: () => _onItemTapped(3),
              style: IconButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
