import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class BottmNavItem extends StatelessWidget {
  String image;
  bool isSelected;
  BottmNavItem({super.key, required this.image, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.black.withOpacity(0.5)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(16)),
          child: ImageIcon(AssetImage(image))),
    );
  }
}
