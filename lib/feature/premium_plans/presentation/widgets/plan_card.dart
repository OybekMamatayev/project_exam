import 'package:flutter/material.dart';
import 'package:project_exam/core/constants/app_colors.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String subtitle;
  final String? badge;
  final bool isSelected;
  final VoidCallback onTap;

  const PlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.subtitle,
    this.badge,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 166,
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.bgBlue,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? AppColors.accentGreen : Colors.transparent,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: .center,
              children: [
                Column(
                  crossAxisAlignment: .center,
                  children: [
                    Text(
                      textAlign: .center,
                      title,
                      style: TextStyle(
                        color: AppColors.gray1,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      textAlign: .center,

                      price,
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      textAlign: .center,

                      subtitle,
                      style: TextStyle(color: AppColors.gray1, fontSize: 14),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
          if (isSelected)
            Positioned(
              bottom: -10,
              right: 100,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: AppColors.accentGreen,
                child: Center(
                  child: Icon(Icons.check_rounded, color: AppColors.bgBlue),
                ),
              ),
            ),
          if (isSelected)
            Positioned(
              top: -10,
              right: 80,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.accentGreen,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Save 75%',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
