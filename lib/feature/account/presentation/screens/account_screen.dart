import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_exam/core/assets/images/app_images.dart';
import 'package:project_exam/core/constants/app_colors.dart';
import 'package:project_exam/core/routes/pages.dart';
import 'package:project_exam/feature/account/presentation/widgets/menu_item.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.white,
                      size: 18,
                    ),
                    onPressed: () => context.pop(),
                  ),
                  const Text(
                    'Home',
                    style: TextStyle(color: AppColors.white, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Image.asset(AppImages.account, width: 101, height: 33),
              const SizedBox(height: 24),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    foregroundColor: AppColors.gray1,
                    backgroundColor: AppColors.gray3,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'John Doe',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'john.doe@example.com',
                          style: TextStyle(
                            color: AppColors.gray1,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.go(Pages.premiumplansFull);
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.accentGreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Premium',
                        style: TextStyle(
                          color: AppColors.bgBlue,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              MenuItem(
                icon: Icons.person_outline,
                label: 'Profile details',
                onTap: () {
                  context.go(Pages.profiledetailsFull);
                },
              ),
              MenuItem(
                icon: Icons.credit_card,
                label: 'Payment',
                onTap: () {
                  context.go(Pages.paymentFull);
                },
              ),
              MenuItem(
                icon: Icons.star_border,
                label: 'Subscription',
                onTap: () {
                  context.go(Pages.subcriptionFull);
                },
              ),
              SizedBox(height: 10),
              Divider(color: AppColors.gray4, thickness: 1, height: 1),
              SizedBox(height: 10),
              MenuItem(icon: Icons.help_outline, label: 'FAQs', onTap: () {}),
              MenuItem(
                icon: Icons.logout,
                label: 'Logout',
                onTap: () {},
                showArrow: false,
              ),

              const Spacer(),

              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 34.5,
                    vertical: 23.5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.bgBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.headset_mic_outlined,
                        color: AppColors.accentGreen,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Feel free to ask, We are here to help',
                          style: TextStyle(
                            color: AppColors.accentGreen,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
