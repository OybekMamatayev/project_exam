import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_exam/core/constants/app_colors.dart';
import 'package:project_exam/feature/account/presentation/widgets/field_label.dart';
import 'package:project_exam/feature/account/presentation/widgets/profile_field.dart';

class ProfilDetailsScreen extends StatefulWidget {
  const ProfilDetailsScreen({super.key});

  @override
  State<ProfilDetailsScreen> createState() => _ProfilDetailsScreenState();
}

class _ProfilDetailsScreenState extends State<ProfilDetailsScreen> {
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
                    'Back',
                    style: TextStyle(color: AppColors.white, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Profile details',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              Center(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 44,
                      backgroundColor: AppColors.gray3,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: AppColors.accentGreen,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.file_upload_outlined,
                          color: AppColors.bgDark,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'Change profile picture',
                  style: TextStyle(
                    color: AppColors.accentGreen,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 28),

              const FieldLabel('Your Name'),
              const ProfileField(value: 'John Doe'),
              const SizedBox(height: 16),

              const FieldLabel('Email'),
              const ProfileField(value: 'john.doe@example.com'),
              const SizedBox(height: 16),

              const FieldLabel('Date of Birth'),
              const ProfileField(value: '05 December 1970'),
            ],
          ),
        ),
      ),
    );
  }
}
