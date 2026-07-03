import 'package:flutter/material.dart';
import 'package:project_exam/core/constants/app_colors.dart';

class GenrePercenseScreen extends StatefulWidget {
  const GenrePercenseScreen({super.key});

  @override
  State<GenrePercenseScreen> createState() => _GenrePercenseScreenState();
}

class _GenrePercenseScreenState extends State<GenrePercenseScreen> {
  final List<String> _allGenres = [
    'Fiction',
    'Novel',
    'Narrative',
    'Historical Fiction',
    'Non-fiction',
    'Mystery',
    'Horror',
    "Children's Literature",
    'Thriller',
    'Sci-Fi',
    'Romantic',
    'History',
    'Poetry',
    'Biography',
    'Crime',
    'Autobiography',
    'Cookbook',
    'Adventure',
    'Action',
    'Fantasy',
    'Drama',
    'Comedy',
    'Young Adult',
    'Classic',
    'Dystopian',
    'Mythology',
    'Fairy Tales',
    'Folklore',
    'Paranormal',
    'Supernatural',
    'Urban Fantasy',
    'Epic Fantasy',
    'Dark Fantasy',
    'Magic',
    'Wizardry',
    'Time Travel',
    'Alternate History',
    'Steampunk',
    'Cyberpunk',
    'Space Opera',
    'Military Fiction',
  ];

  final Set<String> _selected = {};
  bool _showAll = false;

  @override
  Widget build(BuildContext context) {
    final genres = _showAll ? _allGenres : _allGenres.take(20).toList();

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(backgroundColor: AppColors.bgDark,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Genres',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.gray4.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Select the type of book you enjoy reading.',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 16),
                
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 6,
                          runSpacing: 8,
                          children: genres.map((genre) {
                            final isSelected = _selected.contains(genre);
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected
                                      ? _selected.remove(genre)
                                      : _selected.add(genre);
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.accentGreen
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.accentGreen
                                        : AppColors.gray4,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      genre,
                                      style: TextStyle(
                                        color: isSelected
                                            ? AppColors.gray4
                                            : AppColors.gray1,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Icon(
                                      isSelected
                                          ? Icons.check_circle_outline
                                          : Icons.add_circle_outline,
                                      color: isSelected
                                          ? AppColors.gray4
                                          : AppColors.gray1,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 16),
                
                        if (!_showAll)
                          Center(
                            child: GestureDetector(
                              onTap: () => setState(() => _showAll = true),
                              child: const Text(
                                'Show more',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: 16),
                
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.accentGreen,
                              foregroundColor: AppColors.gray4,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: _selected.length >= 3 ? () {} : null,
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                
                        const Center(
                          child: Text(
                            'Select 3 or more genres to continue',
                            style: TextStyle(
                              color: AppColors.gray2,
                              fontSize: 12,
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
      ),
    );
  }
}
