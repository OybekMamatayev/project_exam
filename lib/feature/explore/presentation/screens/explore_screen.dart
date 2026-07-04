import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_exam/core/assets/images/app_images.dart';
import 'package:project_exam/core/constants/app_colors.dart';
import 'package:project_exam/core/routes/pages.dart';
import 'package:project_exam/feature/explore/presentation/widgets/defolt_explore.dart';
import 'package:project_exam/feature/explore/presentation/widgets/search_result.dart';
import 'package:project_exam/feature/explore/presentation/widgets/search_section.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  final List<Map<String, String>> recentSearches = [
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
      'author': 'Mark mcallister',
      'listen': '5m',
      'read': '8m',
    },
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

  bool get isSearchFocused => searchFocusNode.hasFocus;
  bool get hasQuery => searchController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    searchFocusNode.addListener(() => setState(() {}));
    searchController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showSearchOverlay = isSearchFocused;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              if (!showSearchOverlay)
                Image.asset(AppImages.explore, width: 94, height: 33),
              const SizedBox(height: 16),
              TextField(
                cursorColor: AppColors.white,
                controller: searchController,
                focusNode: searchFocusNode,
                style: const TextStyle(color: AppColors.white),
                decoration: InputDecoration(
                  hintText: 'Title, author or keyword',
                  hintStyle: const TextStyle(color: AppColors.gray2),
                  prefixIcon: GestureDetector(
                    onTap: () {
                      if (showSearchOverlay) {
                        searchController.clear();
                        searchFocusNode.unfocus();
                      }
                    },
                    child: Icon(
                      searchFocusNode.hasFocus
                          ? Icons.arrow_back_ios_new_rounded
                          : Icons.search,
                      color: AppColors.gray1,
                    ),
                  ),
                  filled: true,
                  fillColor: AppColors.gray4,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.gray3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.accentGreen),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.gray3),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              if (showSearchOverlay)
                hasQuery
                    ? SearchResult(
                        results: books,
                        onTapItem: (book) {
                          context.push(
                            Pages.productscreenFull,
                            extra: book['title'],
                          );
                        },
                      )
                    : SearchSection(
                        recentSearches: recentSearches,

                        onTapItem: (book) {},
                      )
              else
                DefoltExplore(topics: topics, books: books),
            ],
          ),
        ),
      ),
    );
  }
}
