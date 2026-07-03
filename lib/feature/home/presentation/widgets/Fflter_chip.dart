import 'package:flutter/material.dart';
import 'package:project_exam/core/constants/app_colors.dart';

class FflterChip extends StatefulWidget {
  final Map<String, dynamic> data;
  final bool isSelected;

  const FflterChip(this.data, {this.isSelected = false, super.key});

  @override
  State<FflterChip> createState() => _FflterChipState();
}

class _FflterChipState extends State<FflterChip> {
  late bool _isSelected; 

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected; 
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () {
        setState(() {
          _isSelected = !_isSelected; 
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: _isSelected ? AppColors.accentGreen : AppColors.black,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: _isSelected ? AppColors.accentGreen : AppColors.gray4,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              widget.data['icon'],
              size: 22,
              color: _isSelected ? AppColors.black : AppColors.white,
            ),
            SizedBox(width: 8),
            Text(
              widget.data['label'],
              style: TextStyle(
                color: _isSelected ? AppColors.black : AppColors.white,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}