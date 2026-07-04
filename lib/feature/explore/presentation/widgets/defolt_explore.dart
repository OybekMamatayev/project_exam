import 'package:flutter/material.dart';
import 'package:project_exam/core/constants/app_colors.dart';
import 'package:project_exam/feature/explore/presentation/widgets/book_section.dart';
import 'package:project_exam/feature/explore/presentation/widgets/topic.dart';

class DefoltExplore extends StatelessWidget {
  final List<String> topics;
  final List<Map<String, String>> books;

  const DefoltExplore({
    super.key,
    required this.topics,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Topics',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: topics.map((topic) => Topic(topic: topic)).toList(),
        ),
        const SizedBox(height: 40),
        BookSection(title: 'Fiction', books: books),
        BookSection(title: 'Culture & Society', books: books),
      ],
    );
  }
}