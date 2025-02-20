import 'package:ai_app/Features/Home/presentation/view/pages/home_page.dart';
import 'package:ai_app/Features/Profile/presentation/views/pages/profile_page.dart';
import 'package:ai_app/Features/Settings/settings_page.dart';
import 'package:ai_app/core/basic_methods.dart';
import 'package:ai_app/core/config_size.dart';
import 'package:ai_app/core/riverpod_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarView extends ConsumerWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> pages = [
      const HomePage(),
      const ProfilePage(),
      const SettingsView()
    ];
    final selectedIndex = ref.watch(navBarIndexProvider);

    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: PhysicalModel(
      //   color: Colors.transparent, // Color for the PhysicalModel shadow
      //   shadowColor: Colors.black.withOpacity(0.4),
      //   elevation: 8, // Increase elevation for a more pronounced effect
      //   shape: BoxShape.circle,
      //   child: FloatingActionButton(
      //     shape:
      //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      //     backgroundColor: Colors.red,
      //     child: Icon(Icons.mic, size: 28),
      //     onPressed: () {},
      //   ),
      // ),
      bottomNavigationBar: Container(
        height: ConfigSize.defaultSize! * 10,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12, // Adjusted notch margin for balance
          color: Colors.white,
          child: BottomNavigationBar(
              selectedFontSize: ConfigSize.defaultSize! * 1.5,
              currentIndex: selectedIndex,
              onTap: (value) {
                ref.read(navBarIndexProvider.notifier).setIndex(value);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ]),
        ),
      ),
      body: pages.elementAt(selectedIndex),
    );
  }
}
