import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_exam/core/constants/app_colors.dart';

class AddPaymentScreen extends StatefulWidget {
  const AddPaymentScreen({super.key});

  @override
  State<AddPaymentScreen> createState() => _AddPaymentScreenState();
}

class _AddPaymentScreenState extends State<AddPaymentScreen> {
  final cardNumberController = TextEditingController();
  final cardHolderController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();
  @override
  void initState() {
    super.initState();
    cardNumberController.addListener(() => setState(() {}));
    cardHolderController.addListener(() => setState(() {}));
    expiryController.addListener(() => setState(() {}));
    cvvController.addListener(() => setState(() {}));
  }
  @override
  void dispose() {
    cardNumberController.dispose();
    cardHolderController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  bool get isFormValid =>
      cardNumberController.text.isNotEmpty &&
      cardHolderController.text.isNotEmpty &&
      expiryController.text.isNotEmpty &&
      cvvController.text.isNotEmpty;

  InputDecoration _decoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: AppColors.gray3, fontSize: 14),
      filled: true,
      fillColor: AppColors.gray5,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.gray4),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.gray4),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.accentGreen),
      ),
    );
  }

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
                    'Payment',
                    style: TextStyle(color: AppColors.white, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Add payment method',
                style: TextStyle(
                  color: AppColors.accentGreen,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Unlocked insights from books, chapters, documentaries,\nand podcasts.',
                style: TextStyle(color: AppColors.white, fontSize: 16),
              ),
              const SizedBox(height: 24),

              TextField(
                controller: cardNumberController,
                style: const TextStyle(color: AppColors.white),
                keyboardType: TextInputType.number,
                decoration: _decoration('Card number'),
              ),
              const SizedBox(height: 14),

              TextField(
                controller: cardHolderController,
                style: const TextStyle(color: AppColors.white),
                decoration: _decoration('Cardholder'),
              ),
              const SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: expiryController,
                      style: const TextStyle(color: AppColors.white),
                      decoration: _decoration('MM/YY'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: cvvController,
                      style: const TextStyle(color: AppColors.white),
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: _decoration('CVV'),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isFormValid ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isFormValid
                        ? AppColors.accentGreen
                        : AppColors.gray4,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Add Payment Method',
                    style: TextStyle(
                      color: isFormValid ? AppColors.bgDark : AppColors.gray2,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
