import 'package:flutter/material.dart';
import 'package:project_exam/core/constants/app_colors.dart';

class PremiumSucces extends StatefulWidget {
  const PremiumSucces({super.key});

  @override
  State<PremiumSucces> createState() => _PremiumSuccesState();
}

class _PremiumSuccesState extends State<PremiumSucces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        automaticallyImplyActions: false,
      ),
      backgroundColor: AppColors.black,
      body: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Icon(
            Icons.check_circle_outline_rounded,
            color: AppColors.white,
            size: 100,
          ),
          SizedBox(height: 40),
          Text(
            textAlign: .center,
            'We’re giving you Premium\naccess for 3 days, for free',
            style: TextStyle(color: AppColors.white, fontSize: 21),
          ),
          SizedBox(height: 16),
          Text(
            textAlign: .center,

            'Ulimited insights from books,\ncourses documentaries, and podcasts.',
            style: TextStyle(fontSize: 16, color: AppColors.gray1),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accentGreen,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    color: AppColors.bgDark,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
