import 'package:flutter/material.dart';
import 'package:project_exam/core/assets/images/app_images.dart';
import 'package:project_exam/core/constants/app_colors.dart';
import 'package:project_exam/feature/my_library/presentation/widgets/complete_books.dart';
import 'package:project_exam/feature/my_library/presentation/widgets/in_progress_books.dart';
import 'package:project_exam/feature/my_library/presentation/widgets/saved_books.dart';

class MyLibraryScreen extends StatefulWidget {
  const MyLibraryScreen({super.key});

  @override
  State<MyLibraryScreen> createState() => _MyLibraryScreenState();
}

class _MyLibraryScreenState extends State<MyLibraryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Image.asset(AppImages.mylibrary, width: 129, height: 33),
              const SizedBox(height: 20),
              TabBar(
                controller: _tabController,
                isScrollable: true,

                indicatorColor: Colors.transparent,
                labelPadding: const EdgeInsets.only(right: 10),
                padding: EdgeInsets.zero,

                tabAlignment: TabAlignment.start,
                labelColor: AppColors.bgDark,
                unselectedLabelColor: AppColors.white,
                splashBorderRadius: BorderRadius.circular(20),
                indicator: BoxDecoration(
                  color: AppColors.accentGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                dividerColor: Colors.transparent,
                labelStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                tabs: const [
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12.5,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.bookmark_border, size: 16),
                          SizedBox(width: 6),
                          Text('Saved Books'),
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12.5,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.access_time, size: 16),
                          SizedBox(width: 6),
                          Text('In Progress'),
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12.5,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check_circle_outline, size: 16),
                          SizedBox(width: 6),
                          Text('Completed'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [SavedBooks(), InProgressBooks(), CompleteBooks()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
