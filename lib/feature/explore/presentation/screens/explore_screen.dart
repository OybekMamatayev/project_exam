import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_exam/core/assets/images/app_images.dart';
import 'package:project_exam/core/constants/app_colors.dart';
import 'package:project_exam/core/routes/pages.dart';
import 'package:project_exam/feature/home/presentation/widgets/book_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
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
  final List<String> topics = [
    'Personal growth',
    'Culture & Society',
    'Fiction',
    'Mind & Philosophy',
    'Health & Fitness',
    'Biographies',
    'History',
    'Future',
    'Technology',
    'Life style',
  ];

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    searchFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                Image.asset(AppImages.explore,width: 94,height: 33,),
                  const SizedBox(height: 16),
                  TextField(
                    cursorColor: AppColors.white,
                    controller: searchController,
                    focusNode: searchFocusNode,
                    style: const TextStyle(color: AppColors.white),
                    decoration: InputDecoration(
                      hintText: 'Title, author or keyword',
                      hintStyle: const TextStyle(color: AppColors.gray2),
                      prefixIcon: Icon(
                        searchFocusNode.hasFocus
                            ? Icons.arrow_back_ios_new_rounded
                            : Icons.search,
                        color: AppColors.gray1,
                      ),
                      filled: true,
                      fillColor: AppColors.gray4,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.gray3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.accentGreen),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: AppColors.gray3),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
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
                    children: topics
                        .map((topic) => _buildTopicChip(topic))
                        .toList(),
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Text(
                        'Fiction',
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
                  SizedBox(height: 16),
                  SizedBox(
                    height: 260,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
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
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Text(
                        'Culture & Society',
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
                  SizedBox(height: 16),
                  SizedBox(
                    height: 260,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
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
                  SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopicChip(String topic) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        context.go(Pages.productscreenFull, extra: topic);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.gray4,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          topic,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
