import 'package:flutter/material.dart';
import 'package:islami_4pm_fri/screens/layout/quran/sura_details.dart';
import 'package:islami_4pm_fri/screens/layout/quran/widgets/history_card_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constant/app_assets.dart';
import '../../../core/theme/app_colors.dart';

class QuranScreen extends StatefulWidget {
  QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<String> suraAr = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  List<String> suraEn = [
    "Al-Fatiha",
    "Al-Baqarah",
    "Aal-E-Imran",
    "An-Nisa'",
    "Al-Ma'idah",
    "Al-An'am",
    "Al-A'raf",
    "Al-Anfal",
    "At-Tawbah",
    "Yunus",
    "Hud",
    "Yusuf",
    "Ar-Ra'd",
    "Ibrahim",
    "Al-Hijr",
    "An-Nahl",
    "Al-Isra",
    "Al-Kahf",
    "Maryam",
    "Ta-Ha",
    "Al-Anbiya",
    "Al-Hajj",
    "Al-Mu'minun",
    "An-Nur",
    "Al-Furqan",
    "Ash-Shu'ara",
    "An-Naml",
    "Al-Qasas",
    "Al-Ankabut",
    "Ar-Rum",
    "Luqman",
    "As-Sajda",
    "Al-Ahzab",
    "Saba",
    "Fatir",
    "Ya-Sin",
    "As-Saffat",
    "Sad",
    "Az-Zumar",
    "Ghafir",
    "Fussilat",
    "Ash-Shura",
    "Az-Zukhruf",
    "Ad-Dukhan",
    "Al-Jathiya",
    "Al-Ahqaf",
    "Muhammad",
    "Al-Fath",
    "Al-Hujurat",
    "Qaf",
    "Adh-Dhariyat",
    "At-Tur",
    "An-Najm",
    "Al-Qamar",
    "Ar-Rahman",
    "Al-Waqi'a",
    "Al-Hadid",
    "Al-Mujadila",
    "Al-Hashr",
    "Al-Mumtahina",
    "As-Saff",
    "Al-Jumu'a",
    "Al-Munafiqun",
    "At-Taghabun",
    "At-Talaq",
    "At-Tahrim",
    "Al-Mulk",
    "Al-Qalam",
    "Al-Haqqah",
    "Al-Ma'arij",
    "Nuh",
    "Al-Jinn",
    "Al-Muzzammil",
    "Al-Muddathir",
    "Al-Qiyamah",
    "Al-Insan",
    "Al-Mursalat",
    "An-Naba'",
    "An-Nazi'at",
    "Abasa",
    "At-Takwir",
    "Al-Infitar",
    "Al-Mutaffifin",
    "Al-Inshiqaq",
    "Al-Buruj",
    "At-Tariq",
    "Al-A'la",
    "Al-Ghashiyah",
    "Al-Fajr",
    "Al-Balad",
    "Ash-Shams",
    "Al-Lail",
    "Ad-Duha",
    "Ash-Sharh",
    "At-Tin",
    "Al-Alaq",
    "Al-Qadr",
    "Al-Bayyina",
    "Az-Zalzalah",
    "Al-Adiyat",
    "Al-Qari'a",
    "At-Takathur",
    "Al-Asr",
    "Al-Humazah",
    "Al-Fil",
    "Quraysh",
    "Al-Ma'un",
    "Al-Kawthar",
    "Al-Kafirun",
    "An-Nasr",
    "Al-Masad",
    "Al-Ikhlas",
    "Al-Falaq",
    "An-Nas"
  ];

  List<String> ayaNumber = [
    '7',
    '286',
    '200',
    '176',
    '120',
    '165',
    '206',
    '75',
    '129',
    '109',
    '123',
    '111',
    '43',
    '52',
    '99',
    '128',
    '111',
    '110',
    '98',
    '135',
    '112',
    '78',
    '118',
    '64',
    '77',
    '227',
    '93',
    '88',
    '69',
    '60',
    '34',
    '30',
    '73',
    '54',
    '45',
    '83',
    '182',
    '88',
    '75',
    '85',
    '54',
    '53',
    '89',
    '59',
    '37',
    '35',
    '38',
    '29',
    '18',
    '45',
    '60',
    '49',
    '62',
    '55',
    '78',
    '96',
    '29',
    '22',
    '24',
    '13',
    '14',
    '11',
    '11',
    '18',
    '12',
    '12',
    '30',
    '52',
    '52',
    '44',
    '28',
    '28',
    '20',
    '56',
    '40',
    '31',
    '50',
    '40',
    '46',
    '42',
    '29',
    '19',
    '36',
    '25',
    '22',
    '17',
    '19',
    '26',
    '30',
    '20',
    '15',
    '21',
    '11',
    '8',
    '5',
    '19',
    '5',
    '8',
    '8',
    '11',
    '11',
    '8',
    '3',
    '9',
    '5',
    '4',
    '6',
    '3',
    '6',
    '3',
    '5',
    '4',
    '5',
    '6'
  ];

  List<int> ids = [];

  List<int> historyIds = [];

  @override
  void initState() {
    getHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.quranBg), fit: BoxFit.cover)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.black.withOpacity(0.4), AppColors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomScrollView(
                slivers: [
                  // SliverAppBar(
                  //   backgroundColor: AppColors.whiteCoffee,
                  //   surfaceTintColor: AppColors.whiteCoffee,
                  //   stretch: true,
                  //   expandedHeight: 250,
                  //   flexibleSpace: Container(
                  //     child: Image.asset(AppAssets.routeLogo),
                  //   ),
                  // ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Image.asset(AppAssets.homeLogo)),
                        Theme(
                          data: ThemeData(
                            textSelectionTheme: TextSelectionThemeData(
                                selectionColor:
                                    AppColors.whiteCoffee.withOpacity(0.4),
                                selectionHandleColor: AppColors.whiteCoffee),
                          ),
                          child: TextField(
                            style: const TextStyle(color: AppColors.white),
                            cursorColor: Colors.white,
                            onChanged: (value) {
                              search(value);
                            },
                            spellCheckConfiguration:
                                const SpellCheckConfiguration(
                                    misspelledSelectionColor: Colors.white),
                            decoration: InputDecoration(
                              fillColor: AppColors.black.withOpacity(0.5),
                              filled: true,
                              hintText: "Sura Name",
                              hintStyle:
                                  const TextStyle(color: AppColors.white),
                              prefixIcon: const ImageIcon(
                                AssetImage(AppAssets.quranIcon),
                                color: AppColors.whiteCoffee,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                      color: AppColors.whiteCoffee)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                      color: AppColors.whiteCoffee)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                      color: AppColors.whiteCoffee)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (historyIds.isNotEmpty)
                          SizedBox(
                            height: 110,
                            child: ListView.builder(
                              itemCount: historyIds.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                int useIndex = historyIds[index];
                                return HistoryCardWidget(
                                    suraData: SuraData(
                                        suraAr[useIndex],
                                        suraEn[useIndex],
                                        useIndex,
                                        ayaNumber[useIndex]));
                              },
                            ),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Suras List",
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  SliverList.separated(
                      itemBuilder: (context, index) {
                        int useIndex = ids.isNotEmpty ? ids[index] : index;
                        return InkWell(
                          onTap: () {
                            save(useIndex);
                            Navigator.pushNamed(context, SuraDetails.routeName,
                                arguments: SuraData(
                                    suraAr[useIndex],
                                    suraEn[useIndex],
                                    useIndex,
                                    ayaNumber[useIndex]));
                          },
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(AppAssets.surahIcon),
                                  Text(
                                    (useIndex + 1).toString(),
                                    style:
                                        const TextStyle(color: AppColors.white),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    suraEn[useIndex],
                                    style: const TextStyle(
                                        fontSize: 24,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${ayaNumber[useIndex]} Verses",
                                    style: const TextStyle(
                                        fontSize: 16, color: AppColors.white),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                suraAr[useIndex],
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: ids.isNotEmpty ? ids.length : 114),
                ],
              )),
        ),
      ),
    );
  }

  void search(String q) {
    var reg = RegExp("^[\u0621-\u064A\u0660-\u0669 ]+");

    ids.clear();

    if (reg.hasMatch(q)) {
      suraAr.where(
        (suraName) {
          if (suraName.toLowerCase().contains(q.toLowerCase())) {
            ids.add(suraEn.indexOf(suraName));
          }
          return true;
        },
      ).toList();
    } else {
      suraEn.where(
        (suraName) {
          if (suraName.toLowerCase().contains(q.toLowerCase())) {
            ids.add(suraEn.indexOf(suraName));
          }
          return true;
        },
      ).toList();
    }

    setState(() {});
  }

  void save(int index) async {
    List<String> idsString = [];
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (historyIds.contains(index)) {
      historyIds.remove(index);
    }
    historyIds = historyIds.toSet().toList();
    historyIds.insert(0, index);

    for (int e in historyIds) {
      idsString.add(e.toString());
    }

    await prefs.setStringList("history", idsString);

    setState(() {});
  }

  void getHistory() async {
    List<String> idsString = [];

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    idsString = prefs.getStringList("history") ?? [];
    for (String e in idsString) {
      historyIds.add(int.parse(e));
    }
    historyIds = historyIds.toSet().toList();
    setState(() {});
  }
}

class SuraData {
  String suraAr;
  String suraEn;
  String suraVerses;
  int suraIndex;
  SuraData(this.suraAr, this.suraEn, this.suraIndex, this.suraVerses);
}
