import 'package:flutter/material.dart';
import 'package:project_exam/core/assets/images/app_images.dart';
import 'package:project_exam/core/constants/app_colors.dart';

class BookCard extends StatefulWidget {
  final String title;
  final String author;
  final String listenTime;
  final String readTime;

  const BookCard({
    super.key,
    required this.title,
    required this.author,
    required this.listenTime,
    required this.readTime,
  });

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: 128,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 128,
              height: 184,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.futuramasmall),
                  fit: BoxFit.cover,
                ),
                color: AppColors.gray3,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.title,
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 2),
            Text(
              widget.author,
              style: TextStyle(color: AppColors.white, fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.headphones, size: 14, color: AppColors.gray1),
                SizedBox(width: 4),
                Text(
                  widget.listenTime,
                  style: TextStyle(color: AppColors.gray1, fontSize: 12),
                ),
                SizedBox(width: 12),
                Icon(
                  Icons.remove_red_eye_outlined,
                  size: 14,
                  color: AppColors.gray1,
                ),
                SizedBox(width: 4),
                Text(
                  widget.readTime,
                  style: TextStyle(color: AppColors.gray1, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
