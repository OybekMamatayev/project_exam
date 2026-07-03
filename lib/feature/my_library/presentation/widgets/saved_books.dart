import 'package:flutter/material.dart';
import 'package:project_exam/feature/my_library/presentation/widgets/libarary_card.dart';

class SavedBooks extends StatefulWidget {
  const SavedBooks({super.key});

  @override
  State<SavedBooks> createState() => _SavedBooksState();
}

final List<Map<String, dynamic>> savedBooks = [
  {
    'image': 'https://via.placeholder.com/140x180',
    'title': 'The good guy',
    'author': 'Mark mcallister',
    'discription':
        'A story about a guy who was very good until the very end when everythings fine',
    'listen': '5m',
    'read': '8m',
  },
  {
    'image': 'https://via.placeholder.com/140x180',
    'title': 'Norse Mythology',
    'author': 'Neil Gaiman',
    'discription':
        'A story about a guy who was very good until the very end when everythings fine',
    'listen': '5m',
    'read': '8m',
  },
  {
    'image': 'https://via.placeholder.com/140x180',
    'title': 'Futurama',
    'author': 'Michael Douglas Jr.',
    'discription':
        'A story about a guy who was very good until the very end when everythings fine',

    'listen': '12m',
    'read': '9m',
  },
  {
    'image': 'https://via.placeholder.com/140x180',
    'title': 'Explore your creative mind',
    'author': 'Royryan Mercado',
    'discription':
        'A story about a guy who was very good until the very end when everythings fine',

    'listen': '15m',
    'read': '15m',
  },
];

class _SavedBooksState extends State<SavedBooks> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: savedBooks.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 0.60,
      ),
      itemBuilder: (context, index) {
        final book = savedBooks[index];
        return LibararyCard(
          image: book['image'],
          title: book['title'],
          author: book['author'],
          listenTime: book['listen'],
          readTime: book['read'],
          progress: book['progress'],
          showTime: true,
          showProgress: false,
          discription: book['discription'],
        );
      },
    );
  }
}
