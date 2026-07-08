import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_exam/core/constants/app_colors.dart';
import 'package:project_exam/feature/premium_plans/presentation/widgets/plan_card.dart';

class PremiumPlansScreen extends StatefulWidget {
  const PremiumPlansScreen({super.key});

  @override
  State<PremiumPlansScreen> createState() => _PremiumPlansScreenState();
}

class _PremiumPlansScreenState extends State<PremiumPlansScreen> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(backgroundColor: AppColors.black, elevation: 0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Try Book Nexus\nPremmium',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Ulimited insights from books, courses documentaries,\nand podcasts.',
                  style: TextStyle(
                    color: AppColors.gray1,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 28),
                Text(
                  'All Premium Plans',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: PlanCard(
                        title: 'Monthly',
                        price: 'USD 60.00',
                        subtitle: 'Billed & recurring\nmonthly\nCancel anytime',
                        isSelected: selectedIndex == 0,
                        onTap: () => setState(() => selectedIndex = 0),
                      ),
                    ),

                    SizedBox(width: 12),
                    Expanded(
                      child: PlanCard(
                        title: 'Monthly',
                        price: 'USD 90.00',
                        subtitle: 'Billed & recurring\nmonthly\nCancel anytime',
                        isSelected: selectedIndex == 1,
                        onTap: () => setState(() => selectedIndex = 1),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentGreen,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(
                      'Start 3-day free trail now',
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: () => context.pop(),
                    child: Text(
                      'NO THANKS',
                      style: TextStyle(
                        color: AppColors.gray1,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Your membership starts as soon as you set up payment and '
                  'subscribe. Your membership will occur on the last day of '
                  'the current billing period. We\'ll renew your membership for '
                  'you can manage your subscription or turn off auto-renewal '
                  'under accounts setting.',
                  style: TextStyle(color: AppColors.gray1, fontSize: 12),
                ),
                SizedBox(height: 8),
                Text(
                  'By continuing, you are agreeing to these terms. See the '
                  'privacy statement and end policies.',
                  style: TextStyle(color: AppColors.gray1, fontSize: 12),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
