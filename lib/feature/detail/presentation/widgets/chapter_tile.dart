
import 'package:flutter/material.dart';
import 'package:project_exam/core/constants/app_colors.dart';

class ChapterTile extends StatefulWidget {
  final String number;
  final String title;
  final String subtitle;
  final bool isUnlocked;

  const ChapterTile({
    super.key,
    required this.number,
    required this.title,
    required this.subtitle,
    required this.isUnlocked,
  });

  @override
  State<ChapterTile> createState() => _ChapterTileState();
}


class _ChapterTileState extends State<ChapterTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.bgShade,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            widget.number,
            style: TextStyle(
              color: AppColors.gray1,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.subtitle,
                  style: TextStyle(color: AppColors.gray1, fontSize: 12),
                ),
              ],
            ),
          ),
          Icon(
            widget.isUnlocked ? Icons.play_circle_fill : Icons.lock_outline,
            color: widget.isUnlocked ? AppColors.accentGreen : AppColors.gray1,
            size: 22,
          ),
        ],
      ),
    );
  }
}
