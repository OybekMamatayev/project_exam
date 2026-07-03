import 'package:flutter/material.dart';
import 'package:project_exam/core/assets/images/app_images.dart';
import 'package:project_exam/core/constants/app_colors.dart';
import 'package:project_exam/feature/home/presentation/widgets/Fflter_chip.dart';
import 'package:project_exam/feature/home/presentation/widgets/book_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> filters = [
    {'icon': Icons.local_fire_department, 'label': 'Trending'},
    {'icon': Icons.menu_book, 'label': '5-Minutes Read'},
    {'icon': Icons.headphones, 'label': 'Quick Listen'},
  ];
  final List<Map<String, String>> books = [
    {
      'image': 'https://via.placeholder.com/140x180',
      'title': 'The good guy',
      'author': 'Mark mcallister',
      'listen': '5m',
      'read': '8m',
    },
    {
      'image': 'https://via.placeholder.com/140x180',
      'title': 'Futurama',
      'author': 'Michael Douglas Jr.',
      'listen': '12m',
      'read': '9m',
    },
    {
      'image': 'https://via.placeholder.com/140x180',
      'title': 'Explore your creative mind',
      'author': 'Royryan Mercado',
      'listen': '15m',
      'read': '15m',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.asset(AppImages.title, width: 196, height: 38),
                  Spacer(),
                  CircleAvatar(radius: 24),
                ],
              ),
            ),
            SizedBox(height: 24),

            SizedBox(
              height: 96,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 38,
                        backgroundColor: AppColors.accentGreen,
                        child: CircleAvatar(
                          radius: 36,
                          backgroundColor: AppColors.bgDark,
                          child: CircleAvatar(
                            radius: 33,
                            foregroundColor: AppColors.bgLight,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Royryan Merc...',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 12);
                },
                itemCount: 7,
              ),
            ),
            SizedBox(height: 32),
            SizedBox(
              height: 42,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: filters.length,
                separatorBuilder: (context, index) => SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return FflterChip(filters[index]);
                },
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(AppImages.dicount),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'Trending',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Show all',
                          style: TextStyle(
                            color: AppColors.accentGreen,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 6),
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: AppColors.accentGreen,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColors.bgDark,
                              fontWeight: FontWeight.w900,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 260,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: books.length,
                separatorBuilder: (context, index) => SizedBox(width: 8),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'Trending',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Show all',
                          style: TextStyle(
                            color: AppColors.accentGreen,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 6),
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: AppColors.accentGreen,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColors.bgDark,
                              fontWeight: FontWeight.w900,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 260,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: books.length,
                separatorBuilder: (context, index) => SizedBox(width: 8),
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

              Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    '5-Minutes read',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Show all',
                          style: TextStyle(
                            color: AppColors.accentGreen,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 6),
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: AppColors.accentGreen,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColors.bgDark,
                              fontWeight: FontWeight.w900,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 260,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: books.length,
                separatorBuilder: (context, index) => SizedBox(width: 8),
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
            
          ],
        ),
      ),
    );
  }
}
