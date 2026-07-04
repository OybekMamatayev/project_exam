import 'package:flutter/material.dart';
import 'package:project_exam/feature/explore/presentation/widgets/serch_item.dart';

class SearchResult extends StatelessWidget {
  final List<Map<String, String>> results;
  final void Function(Map<String, String> book) onTapItem;

  const SearchResult({
    super.key,
    required this.onTapItem,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Search results',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        ...results.map(
          (book) => SerchItem(
            book: book,
            showCloseButton: false,
            onTap: () => onTapItem(book),
          ),
        ),
      ],
    );
  }
}
