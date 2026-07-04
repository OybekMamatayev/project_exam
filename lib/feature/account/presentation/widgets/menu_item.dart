import 'package:flutter/material.dart';
import 'package:project_exam/core/constants/app_colors.dart';

class MenuItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool showArrow;

  const MenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.showArrow = true,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.gray5,
              ),
              child: Icon(widget.icon, color: AppColors.accentGreen, size: 22),
            ),

            const SizedBox(width: 14),
            Expanded(
              child: Text(
                widget.label,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (widget.showArrow)
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.white,
                size: 22,
              ),
          ],
        ),
      ),
    );
  }
}
