import 'package:flutter/material.dart';
import 'package:islami_4pm_fri/screens/layout/quran/quran_screen.dart';
import 'package:islami_4pm_fri/screens/layout/quran/sura_details.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/app_colors.dart';

class HistoryCardWidget extends StatelessWidget {
  SuraData suraData;
  HistoryCardWidget({super.key, required this.suraData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetails.routeName,
            arguments: suraData);
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.whiteCoffee,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  suraData.suraEn,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  suraData.suraAr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  suraData.suraVerses + " Verses",
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              AppAssets.suraCard,
              width: 100,
            )
          ],
        ),
      ),
    );
  }
}
