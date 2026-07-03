import 'package:flutter/material.dart';
import 'package:project_exam/feature/my_library/presentation/widgets/libarary_card.dart';

class InProgressBooks extends StatefulWidget {
  const InProgressBooks({super.key});

  @override
  State<InProgressBooks> createState() => _InProgressBooksState();
}  final List<Map<String, dynamic>> inProgressBooks = [
    {
      'image': 'https://via.placeholder.com/140x180',
      'title': 'The good guy',
      'author': 'Mark mcallister',
      'progress': 65,
      'discription': 'A story about a guy who was very good until the very end when everythings fine',
    },
    {
      'image': 'https://via.placeholder.com/140x180',
      'title': 'The good guy',
      'author': 'Mark mcallister',
      'progress': 65,
      'discription': 'A story about a guy who was very good until the very end when everythings fine',
    },
  ];

class _InProgressBooksState extends State<InProgressBooks> {
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: inProgressBooks.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 0.60,
      ),
      itemBuilder: (context, index) {
        final book = inProgressBooks[index];
        return LibararyCard(
          image: book['image'],
          title: book['title'],
          author: book['author'],
          listenTime: book['listen'],
          readTime: book['read'],
          progress: book['progress'],
          showTime: false,
          showProgress: true, discription: book['discription'],
        );
      },
    );
  }
}