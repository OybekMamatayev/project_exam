import 'package:flutter/material.dart';
import 'package:project_exam/core/constants/app_colors.dart';
import 'package:project_exam/feature/my_library/presentation/widgets/info_book.dart';

class LibararyCard extends StatefulWidget {
  final String image;
  final String title;
  final String author;
  final String discription;
  final String? listenTime;
  final String? readTime;
  final int? progress;
  final bool showTime;
  final bool showProgress;

  const LibararyCard({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    this.listenTime,
    this.readTime,
    this.progress,
    this.showTime = false,
    this.showProgress = false,
    required this.discription,
  });

  @override
  State<LibararyCard> createState() => BoolsCardState();
}

class BoolsCardState extends State<LibararyCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height: 256, color: AppColors.gray4),
        const SizedBox(height: 8),
        Text(
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          widget.author,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: AppColors.gray1, fontSize: 12),
        ),
        SizedBox(height: 5.5),
        Text(
          widget.discription,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: AppColors.gray1, fontSize: 10),
        ),
        const SizedBox(height: 16),
        if (widget.showTime)
          Row(
            children: [
              InfoBook(
                icon: Icons.headphones,
                label: widget.listenTime ?? '',
                color: AppColors.accentGreen,
              ),
              const SizedBox(width: 8),
              InfoBook(
                icon: Icons.remove_red_eye_outlined,
                label: widget.readTime ?? '',
                color: AppColors.white,
              ),
            ],
          ),
        if (widget.showProgress)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.accentGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${widget.progress}% completed',
              style: const TextStyle(
                color: AppColors.bgDark,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
      ],
    );
  }
}
