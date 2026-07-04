import 'package:flutter/material.dart';
import 'package:project_exam/core/constants/app_colors.dart';
import 'package:project_exam/feature/explore/presentation/widgets/serch_item.dart';

class SearchSection extends StatelessWidget {
  final List<Map<String, String>> recentSearches;
  final void Function(Map<String, String> book) onTapItem;

  const SearchSection({
    super.key,
    required this.recentSearches,

    required this.onTapItem,
  });

  @override
  Widget build(BuildContext context) {
    if (recentSearches.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Center(
          child: Text(
            'No recent searches',
            style: TextStyle(color: AppColors.gray2, fontSize: 14),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent searches',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Clear recent searches',
                style: TextStyle(color: AppColors.gray1, fontSize: 13),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...recentSearches.map(
          (book) => SerchItem(book: book, onTap: () => onTapItem(book)),
        ),
      ],
    );
  }
}
