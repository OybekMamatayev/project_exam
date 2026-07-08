import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_exam/core/assets/icons/app_icons.dart';
import 'package:project_exam/core/constants/app_colors.dart';
import 'package:project_exam/core/routes/pages.dart';
import 'package:project_exam/feature/main_screen/presentation/widgets/mini_player.dart';

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
    final isaudioPlayerScreen = currentLocation == Pages.audioplayerFull;
    final isaccountscreen = currentLocation == Pages.accountFull;
    final ispaymentscreen = currentLocation == Pages.paymentFull;
    final isaddpayment = currentLocation == Pages.addpaymentFull;
    final isreading = currentLocation == Pages.readingFull;
    final ispremium = currentLocation == Pages.premiumplansFull;
    final ispremiumaddcard = currentLocation == Pages.premiumplansaddcardFull;
    final issubcription = currentLocation == Pages.subcriptionFull;
    final issucces = currentLocation == Pages.premiumsuccesFull;

    final ispremiumselectcard =
        currentLocation == Pages.premiumplansselectcardFull;

    return Scaffold(
      backgroundColor: AppColors.bgMain,
      body: widget.child,
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,

        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isDetailScreen &&
              !isaudioPlayerScreen &&
              !isaccountscreen &&
              !ispaymentscreen &&
              !isaddpayment &&
              !isreading &&
              !ispremium &&
              !ispremiumaddcard &&
              !ispremiumselectcard &&
              !issubcription &&
              !issucces)
            MiniPlayer(),

          if (!ispremium &&
              !ispremiumaddcard &&
              !ispremiumselectcard &&
              !issubcription &&
              !issucces)
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
                final currentIndex = getSelectedIndexFromUri(
                  GoRouterState.of(context).uri,
                );
                if (currentIndex == index) return;
                context.go(pages[index]);
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.home, width: 24, height: 24),

                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.search,
                    width: 24,
                    height: 24,
                  ),

                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.library,
                    width: 24,
                    height: 24,
                  ),

                  label: 'Library',
                ),
              ],
            ),
        ],
      ),
    );
  }
}
