import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_exam/core/constants/app_colors.dart';

class PremmiumPlansSelectCard extends StatefulWidget {
  const PremmiumPlansSelectCard({super.key});

  @override
  State<PremmiumPlansSelectCard> createState() =>
      _PremmiumPlansSelectCardState();
}

class _PremmiumPlansSelectCardState extends State<PremmiumPlansSelectCard> {
  int selectedIndex = 0;

  final List<Map<String, String>> cards = [
    {'type': 'visa', 'number': '**** 4025', 'expiry': '09/2025'},
    {'type': 'mastercard', 'number': '**** 5090', 'expiry': '12/2026'},
    {'type': 'mastercard', 'number': '**** 5090', 'expiry': '12/2026'},
  ];

  IconData _iconFor(String type) {
    return type == 'visa' ? Icons.credit_card : Icons.credit_card;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(automaticallyImplyLeading: false,      backgroundColor: AppColors.bgDark,
),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  const Text(
                    'Select Card',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

               
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Ulimited insights from books, courses documentaries, and podcasts.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray1,
                ),
              ),
              const SizedBox(height: 20),

              Expanded(
                child: ListView.separated(
                  itemCount: cards.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final card = cards[index];
                    final isSelected = selectedIndex == index;

                    return InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () => setState(() => selectedIndex = index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.accentGreen
                              : AppColors.gray5,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              _iconFor(card['type']!),
                              color: isSelected
                                  ? AppColors.gray4
                                  : AppColors.white,
                              size: 22,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    card['number']!,
                                    style: TextStyle(
                                      color: isSelected
                                          ? AppColors.gray4
                                          : AppColors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  const SizedBox(height: 2),
                                  Text(
                                    ' ${card['expiry']}',
                                    style: TextStyle(
                                      color: isSelected
                                          ? AppColors.gray4
                                          : AppColors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              isSelected
                                  ? Icons.check_circle_outline_rounded
                                  : Icons.circle_outlined,
                              color: isSelected
                                  ? AppColors.gray4
                                  : AppColors.white,
                              size: 25,
                            ),
                            const SizedBox(width: 12),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                CupertinoIcons.delete,
                                color: isSelected
                                    ? AppColors.gray4
                                    : AppColors.white,
                                size: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 48,
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
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
