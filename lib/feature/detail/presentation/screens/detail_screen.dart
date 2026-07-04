import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project_exam/core/assets/icons/app_icons.dart';
import 'package:project_exam/core/assets/images/app_images.dart';
import 'package:project_exam/core/constants/app_colors.dart';
import 'package:project_exam/core/routes/pages.dart';
import 'package:project_exam/feature/home/presentation/widgets/book_card.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key});
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
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Rasm va Yuqori tugmalar (Siz yozgan qism)
            Container(
              height: 357,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/futurama_back.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Image.asset(AppImages.futuramacover)],
                      ),
                    ],
                  ),
                  Positioned(
                    top: 300,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.bgShade,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 31,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppIcons.book,
                                      width: 24,
                                      height: 24,
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Read Nexus',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 24,
                              color: AppColors.gray1,
                            ),
                            InkWell(
                              onTap: () {
                                context.push(Pages.audioplayer);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 31,
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppIcons.headphone,
                                      width: 24,
                                      height: 24,
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Play Nexus',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                right: 16.0,
                top: 24,
                left: 16,
                bottom: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Project Management for the\nUnofficial Project Manager',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.bookmark_border_outlined,
                          color: AppColors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Kory Kogon, Suzette Blakemore, and James wood',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.gray1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'A FranklinCovey Title',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: AppColors.gray1,
                    ),
                  ),
                  const SizedBox(height: 16),

                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.bgShade,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: AppColors.gray1,
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            Text(
                              '18 min',
                              style: TextStyle(color: AppColors.white),
                            ),
                          ],
                        ),
                        Container(width: 1, height: 16, color: AppColors.gray1),
                        const Row(
                          children: [
                            Icon(
                              Icons.lightbulb_outline,
                              color: AppColors.gray1,
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            Text(
                              '6 key ideas',
                              style: TextStyle(color: AppColors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'About this Book',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Getting Along (2022) describes the importance of workplace interactions and their effects on productivity and creativity.',
                    style: TextStyle(color: AppColors.gray1, height: 1.4),
                  ),
                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildTag('Personal growth'),
                      _buildTag('Culture & Society'),
                      _buildTag('Fiction'),
                      _buildTag('Mind & Philosophy'),
                    ],
                  ),
                  const SizedBox(height: 28),

                  const Text(
                    '56 Chapters',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildChapterItem(
                    '01',
                    'Introduction',
                    'Subscribe to unlock all 2 key ideas from...',
                    true,
                  ),
                  _buildChapterItem(
                    '02',
                    'Creating the',
                    'Subscribe to unlock all 2 key ideas from...',
                    false,
                  ),
                  _buildChapterItem(
                    '03',
                    'Introduction',
                    'Subscribe to unlock all 2 key ideas from...',
                    false,
                  ),
                  _buildChapterItem(
                    null,
                    'Final Summary',
                    null,
                    false,
                    isSummary: true,
                  ),
                  const SizedBox(height: 24),

                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.bgShade,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.grey,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'James wood',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'A FranklinCovey Title',
                                style: TextStyle(
                                  color: AppColors.gray1,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Managers who want to create positive work environments.',
                                style: TextStyle(
                                  color: AppColors.gray1,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),

                  Row(
                    children: [
                      Text(
                        'Similar Books',
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
                  const SizedBox(height: 16),

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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.gray4,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(color: AppColors.gray1, fontSize: 13),
      ),
    );
  }

  Widget _buildChapterItem(
    String? number,
    String title,
    String? subtitle,
    bool isOpen, {
    bool isSummary = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          if (number != null) ...[
            Text(
              number,
              style: const TextStyle(color: AppColors.gray1, fontSize: 14),
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15,
                    fontWeight: isSummary ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: AppColors.gray1,
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          Icon(
            isOpen ? Icons.play_circle_fill : Icons.lock_outline,
            color: isOpen ? Colors.greenAccent : AppColors.gray1,
            size: 24,
          ),
        ],
      ),
    );
  }
}
