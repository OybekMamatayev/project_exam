import 'package:flutter/material.dart';
import 'package:project_exam/feature/my_library/presentation/widgets/libarary_card.dart';

class CompleteBooks extends StatefulWidget {
  const CompleteBooks({super.key});

  @override
  State<CompleteBooks> createState() => _CompleteBooksState();
}
  final List<Map<String, dynamic>> completedBooks = [
    {
      'image': 'https://via.placeholder.com/140x180',
      'title': 'Futurama',
      'author': 'Mark mcallister',
      'discription': 'A story about a guy who was very good until the very end when everythings fine',
      'listen': '5m',
      'read': '8m',
    },
    {
      'image': 'https://via.placeholder.com/140x180',
      'title': 'The good guy',
      'author': 'Mark mcallister',
      'discription': 'A story about a guy who was very good until the very end when everythings fine',
      'listen': '5m',
      'read': '8m',
    },
  ];


class _CompleteBooksState extends State<CompleteBooks> {
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: completedBooks.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 0.60,
      ),
      itemBuilder: (context, index) {
        final book = completedBooks[index];
        return LibararyCard(
          image: book['image'],
          title: book['title'],
          author: book['author'],
          discription: book['discription'],
          listenTime: book['listen'],
          readTime: book['read'],
          progress: book['progress'],
          showTime: true,
          showProgress: false,
        );
      },
    );
  }
}