import 'package:flutter/material.dart';
import 'package:project_exam/core/constants/app_colors.dart';
import 'package:project_exam/feature/home/presentation/widgets/book_card.dart';

class BookSection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> books;
  final VoidCallback? onShowAll;

  const BookSection({
    super.key,
    required this.title,
    required this.books,
    this.onShowAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: onShowAll ?? () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Show all',
                    style: TextStyle(
                      color: AppColors.accentGreen,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: AppColors.accentGreen,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColors.bgDark,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 260,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final book = books[index];
              return BookCard(
                title: book['title'].toString(),
                author: book['author'].toString(),
                listenTime: book['listen'].toString(),
                readTime: book['read'].toString(),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}