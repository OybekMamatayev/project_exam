import 'package:flutter/material.dart';
import 'package:project_exam/core/constants/app_colors.dart';

class ProfileField extends StatelessWidget {
  final String value;
  const ProfileField({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
      },
      controller: TextEditingController(text: value),
      style: const TextStyle(color: AppColors.white, fontSize: 15),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.gray5,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.gray2,
          size: 16,
        ),
      ),
    );
  }
}
