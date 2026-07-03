import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_exam/core/constants/app_colors.dart';
import 'package:project_exam/core/routes/pages.dart';
import 'package:project_exam/feature/main_screen/presentation/widgets/player.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  final GoRouterState state;
  const MainScreen({super.key, required this.child, required this.state});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> pages = [
    Pages.homescreen,
    Pages.explorescreen,
    Pages.mylibrary,
  ];
  int getSelectedIndexFromUri(Uri uri) {
    final path = uri.path;
    if (path.startsWith(Pages.homescreen)) return 0;
    if (path.startsWith(Pages.explorescreen)) return 1;
    if (path.startsWith(Pages.mylibrary)) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();
    final isDetailScreen = currentLocation == Pages.detailscreen;
    return Scaffold(
      backgroundColor: AppColors.bgMain,
      body: widget.child,
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,

        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isDetailScreen) MiniPlayer(),

          BottomNavigationBar(
            backgroundColor: AppColors.bgDark,
            selectedItemColor: AppColors.accentGreen,
            unselectedItemColor: AppColors.gray2,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            currentIndex: getSelectedIndexFromUri(
              GoRouterState.of(context).uri,
            ),
            onTap: (index) {
              context.go(pages[index]);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                activeIcon: Icon(Icons.search),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music_outlined),
                activeIcon: Icon(Icons.library_music),
                label: 'Library',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
