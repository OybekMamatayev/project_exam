import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_exam/core/routes/pages.dart';
import 'package:project_exam/feature/account/presentation/screens/account_screen.dart';
import 'package:project_exam/feature/account/presentation/screens/add_payment_screen.dart';
import 'package:project_exam/feature/account/presentation/screens/payment_screen.dart';
import 'package:project_exam/feature/account/presentation/screens/profil_details_screen.dart';
import 'package:project_exam/feature/auth/presentation/screens/forgot_password_screen.dart';
import 'package:project_exam/feature/auth/presentation/screens/genre_percense_screen.dart';
import 'package:project_exam/feature/auth/presentation/screens/log_in_email.dart';
import 'package:project_exam/feature/auth/presentation/screens/login_in_password_screen.dart';
import 'package:project_exam/feature/auth/presentation/screens/set_password_screen.dart';
import 'package:project_exam/feature/auth/presentation/screens/sign_up_screen.dart';
import 'package:project_exam/feature/auth/presentation/screens/verify_code_creen.dart';
import 'package:project_exam/feature/detail/presentation/screens/detail_screen.dart';
import 'package:project_exam/feature/explore/presentation/screens/explore_screen.dart';
import 'package:project_exam/feature/explore/presentation/screens/product_screen.dart';
import 'package:project_exam/feature/home/presentation/screens/audio_payer_screen.dart';
import 'package:project_exam/feature/home/presentation/screens/home_screen.dart';
import 'package:project_exam/feature/home/presentation/widgets/reading_detail.dart';
import 'package:project_exam/feature/main_screen/presentation/screens/main_screen_screen.dart';
import 'package:project_exam/feature/my_library/presentation/screens/my_library_screen.dart';
import 'package:project_exam/feature/premium_plans/presentation/screens/premium_plans_add_card_screen.dart';
import 'package:project_exam/feature/premium_plans/presentation/screens/premium_plans_screen.dart';
import 'package:project_exam/feature/premium_plans/presentation/screens/premmium_plans_select_card.dart';
import 'package:project_exam/feature/subcribtion/presentation/screens/subcribtion_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

class Routes {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Pages.homescreen,
    routes: [
      GoRoute(
        path: Pages.logininemail,
        builder: (context, state) => LogInEmail(),
      ),
      GoRoute(path: Pages.signup, builder: (context, state) => SignUpScreen()),
      GoRoute(
        path: Pages.logininpassword,
        builder: (context, state) => LoginInPasswordScreen(),
      ),
      GoRoute(
        path: Pages.verifycode,
        builder: (context, state) => VerifyCodeCreen(),
      ),
      GoRoute(
        path: Pages.forgotpassword,
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
        path: Pages.genrepercenseScreen,
        builder: (context, state) => GenrePercenseScreen(),
      ),
      GoRoute(
        path: Pages.setpassword,
        builder: (context, state) => SetPasswordScreen(),
      ),

      ShellRoute(
        builder: (context, state, child) =>
            MainScreen(state: state, child: child),
        routes: [
          GoRoute(
            path: Pages.homescreen,
            builder: (context, state) => HomeScreen(),
            routes: [
              GoRoute(
                path: Pages.account,
                builder: (context, state) => AccountScreen(),
                routes: [
                  GoRoute(
                    path: Pages.profiledetails,
                    builder: (context, state) => ProfilDetailsScreen(),
                  ),
                  GoRoute(
                    path: Pages.subscription,
                    builder: (context, state) => SubcribtionScreen(),
                  ),
                  GoRoute(
                    path: Pages.payment,
                    builder: (context, state) => PaymentScreen(),
                    routes: [
                      GoRoute(
                        path: Pages.addpayment,
                        builder: (context, state) => AddPaymentScreen(),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: Pages.premiumplans,
                    builder: (context, state) => PremiumPlansScreen(),
                    routes: [
                      GoRoute(
                        path: Pages.premiumplansaddcard,
                        builder: (context, state) =>
                            PremiumPlansAddCardScreen(),
                        routes: [
                          GoRoute(
                            path: Pages.premiumplansselectcard,
                            builder: (context, state) =>
                                PremmiumPlansSelectCard(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: Pages.explorescreen,
            builder: (context, state) => ExploreScreen(),
            routes: [
              GoRoute(
                path: Pages.productscreen,
                builder: (context, state) {
                  final title = state.extra as String? ?? 'Default Title';
                  return ProductScreen(title: title);
                },
              ),
            ],
          ),

          GoRoute(
            path: Pages.mylibrary,
            builder: (context, state) => MyLibraryScreen(),
          ),
          GoRoute(
            path: Pages.detailscreen,
            builder: (context, state) => DetailScreen(),
            routes: [
              GoRoute(
                path: Pages.audioplayer,
                routes: [
                  GoRoute(
                    path: Pages.reading,
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        child: const ReadingDetail(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                              return SlideTransition(
                                position:
                                    Tween<Offset>(
                                      begin: const Offset(0.0, 1.0),
                                      end: Offset.zero,
                                    ).animate(
                                      CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.easeInOut,
                                      ),
                                    ),
                                child: child,
                              );
                            },
                      );
                    },
                  ),
                ],
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: const AudioPayerScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                          return SlideTransition(
                            position:
                                Tween<Offset>(
                                  begin: const Offset(0.0, 1.0),
                                  end: Offset.zero,
                                ).animate(
                                  CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.easeInOut,
                                  ),
                                ),
                            child: child,
                          );
                        },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
