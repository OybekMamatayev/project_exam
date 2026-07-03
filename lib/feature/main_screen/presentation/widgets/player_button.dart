import 'package:flutter/material.dart';
import 'package:project_exam/core/constants/app_colors.dart';

class PlayerButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const PlayerButton({
    required this.icon, 
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.accentGreen, 
        ),
        child: Center(
          child: Icon(
            icon, 
            color: AppColors.black, 
            size: 24, 
          ),
        ),
      ),
    );
  }
}