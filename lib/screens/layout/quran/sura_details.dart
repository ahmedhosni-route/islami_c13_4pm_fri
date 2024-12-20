import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_4pm_fri/core/constant/app_assets.dart';
import 'package:islami_4pm_fri/core/theme/app_colors.dart';
import 'package:islami_4pm_fri/screens/layout/quran/quran_screen.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "suraDetails";
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String sura = "";
  List<String> suraList = [];
  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as SuraData;
    if (sura.isEmpty) {
      readFile(arg.suraIndex);
    }
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: AppColors.whiteCoffee,
        ),
        centerTitle: true,
        title: Text(
          arg.suraEn,
          style: const TextStyle(color: AppColors.whiteCoffee),
        ),
      ),
      body: Column(
        children: [
          Row(
            textDirection: TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppAssets.suraDetailsLeft),
              Text(
                arg.suraAr,
                style: const TextStyle(
                    color: AppColors.whiteCoffee,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Image.asset(AppAssets.suraDetailsRight),
            ],
          ),
          Expanded(
            child: suraList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text.rich(
                        TextSpan(
                            children: suraList.map(
                          (aya) {
                            int index = suraList.indexOf(aya);
                            return TextSpan(
                                text: aya.trim(),
                                // recognizer: TapGestureRecognizer()
                                //   ..onTap = () {
                                //     showModalBottomSheet(
                                //       context: context,
                                //       builder: (context) {
                                //         return Container(
                                //           child: Text(
                                //             e,
                                //             style: TextStyle(fontSize: 30),
                                //           ),
                                //         );
                                //       },
                                //     );
                                //   },
                                children: [
                                  TextSpan(
                                    text: " [${index + 1}] ",
                                    style: const TextStyle(color: Colors.blue),
                                  )
                                ]);
                          },
                        ).toList()),
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: AppColors.whiteCoffee,
                            height: 2,
                            fontFamily: GoogleFonts.amiriQuran().fontFamily,
                            fontSize: 24),
                      ),
                    ),
                  ]),
          )
        ],
      ),
    );
  }

  void readFile(int index) async {
    sura = await rootBundle.loadString("assets/suras/${index + 1}.txt");
    suraList = sura.trim().split("\n");

    setState(() {});
  }
}
