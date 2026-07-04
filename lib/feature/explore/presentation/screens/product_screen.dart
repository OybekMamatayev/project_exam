import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_exam/core/constants/app_colors.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.title});
  final String title;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {'title': 'The good guy', 'author': 'Mark mcallister'},
      {'title': 'Norse Mythology', 'author': 'Neil Gaiman'},
      {'title': 'Futurama', 'author': 'Mind over matter'},
      {'title': 'Creative', 'author': 'Explore your mind'},
    ];

    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 140.0,
            pinned: true,
            elevation: 0,
            backgroundColor: AppColors.bgDark,
            leading: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 22,
                  color: AppColors.white,
                ),
              ),
            ),
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double topPadding = MediaQuery.of(context).padding.top;
                final double collapseHeight = kToolbarHeight + topPadding;
                final double isCollapsed =
                    constraints.biggest.height <= collapseHeight ? 1.0 : 0.0;

                return FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: EdgeInsetsDirectional.only(
                    start: isCollapsed == 1.0 ? 56.0 : 16.0,
                    bottom: isCollapsed == 1.0 ? 16.0 : 12.0,
                  ),
                  title: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 150),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: isCollapsed == 1.0 ? 20.0 : 36.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Georgia',
                    ),
                    child: Text(widget.title),
                  ),
                );
              },
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 18.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.53,
                mainAxisExtent: 385,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final product = products[index % products.length];
                return InkWell(
                  borderRadius: BorderRadius.circular(4),
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.gray1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product['title']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: AppColors.white,
                        ),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        product['author']!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.gray1,
                        ),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "A story about a guy who was very good until the very end when..",
                        style: TextStyle(fontSize: 10, color: AppColors.gray1),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          _buildExactTag(
                            Icons.headphones,
                            '5m',
                            AppColors.accentGreen,
                          ),
                          const SizedBox(width: 6),
                          _buildExactTag(
                            Icons.all_inclusive,
                            '8m',
                            AppColors.gray1,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }, childCount: 12),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }

  Widget _buildExactTag(IconData icon, String text, Color color) {
    return Container(
      width: 44,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.black),
          const SizedBox(width: 3),
          Text(
            text,
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
