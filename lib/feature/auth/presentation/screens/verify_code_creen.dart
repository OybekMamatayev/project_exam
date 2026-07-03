import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_exam/core/assets/images/app_images.dart';
import 'package:project_exam/core/constants/app_colors.dart';
import 'package:project_exam/core/routes/pages.dart';

class VerifyCodeCreen extends StatefulWidget {
  const VerifyCodeCreen({super.key});

  @override
  State<VerifyCodeCreen> createState() => _VerifyCodeCreenState();
}

class _VerifyCodeCreenState extends State<VerifyCodeCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.bgDark,
          image: DecorationImage(
            image: AssetImage(AppImages.backgoundImage),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),

                InkWell(
                  onTap: () {
                    context.go(Pages.logininemail);
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.chevron_left,
                        color: AppColors.white,
                        size: 32,
                      ),
                      Text(
                        'Back to Log in',
                        style: TextStyle(color: AppColors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 150),

                const Text(
                  'Verify Code',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 32),

                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: AppColors.gray4,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'An authentication code has been sent to your email.',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 16),

                      SizedBox(
                        height: 48,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.black87),
                          decoration: InputDecoration(
                            hintText: 'Enter Code',
                            hintStyle: const TextStyle(color: AppColors.gray2),
                            filled: true,
                            fillColor: AppColors.white,
                            contentPadding: const EdgeInsets.all(16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accentGreen,
                            foregroundColor: AppColors.gray4,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Verify',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't receive a code? ",
                            style: TextStyle(color: AppColors.white),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Row(
                              children: [
                                Text(
                                  'Resend',
                                  style: TextStyle(
                                    color: AppColors.accentGreen,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(
                                  Icons.refresh,
                                  color: AppColors.accentGreen,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
