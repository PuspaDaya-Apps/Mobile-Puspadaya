import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/MenuHomeItems.dart';
import 'package:puspadaya/app/view/widget/home_card_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/route/route_name.dart';
import 'package:puspadaya/utils/logger/logger.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 16),
          child: ListView(
            children: [
              ProfileSection(
                name: 'Ayu Dewi',
                role: 'Ketua Kader',
              ),
              SizedBox(
                height: SizeConfig.calHeightMultiplier(16),
              ),
              CardListActivity(
                date: DateTime.now(),
                location: "Posyandu Mawar 6",
              ),
              SizedBox(
                height: SizeConfig.calHeightMultiplier(16),
              ),
              HomeMenuFeatures(),
              SizedBox(
                height: SizeConfig.calHeightMultiplier(8),
              ),
              CardCarousel(),
              CardMessages(
                title: "Anda telah berkunjung 4 kali bulan ini.",
                message:
                    "Terus melangkah menuju pelayanan masyarakat lebih baik!",
              ),
              GraphData(),
            ],
          ),
        ),
      ),
    );
  }
}

class CardCarousel extends StatelessWidget {
  const CardCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
      ),
      height: 120,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: SizeConfig.calWidthMultiplier(10),
          children: [
            SizedBox(
              width: SizeConfig.calWidthMultiplier(18),
            ),
            HomeCard(
              title: 'Posyandu',
              number: 100,
              description: 'Jumlah Poyandu Meningkat ',
              highlightText: '20%',
              isPositive: true,
            ),
            HomeCard(
              title: 'Posyandu',
              number: 100,
              description: 'Jumlah Poyandu Meningkat ',
              highlightText: '20%',
              isPositive: true,
            ),
            HomeCard(
              title: 'Posyandu',
              number: 100,
              description: 'Jumlah Poyandu Meningkat ',
              highlightText: '20%',
              isPositive: true,
            ),
            SizedBox(
              width: SizeConfig.calWidthMultiplier(10),
            ),
          ],
        ),
      ),
    );
  }
}

class CardListActivity extends StatelessWidget {
  final DateTime date;
  final String location;
  static const List<String> months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  static const List<String> days = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    "Jum'at",
    'Sabtu',
    'Minggu',
  ];

  const CardListActivity(
      {super.key, required this.date, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: SizeConfig.calWidthMultiplier(24)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.calWidthMultiplier(16),
        vertical: SizeConfig.calHeightMultiplier(12),
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: bluePrimaryMain,
        boxShadow: [
          BoxShadow(
            color: Color(0xffE4E6E9).withValues(alpha: 0.3),
            blurRadius: 14,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 10,
                children: [
                  Text(
                    '${date.day.toString().padLeft(2, '0')}',
                    style: AppTextStyles.primaryTextSemibold.copyWith(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${months[date.month - 1]} ${date.year}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        '${days[date.weekday - 1]}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Text(
                '${location}',
                style: AppTextStyles.primaryTextMedium.copyWith(
                  fontSize: 12,
                  color: Colors.white,
                ),
              )
            ],
          ),
          // line
          Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  final String name;
  final String role;

  const ProfileSection({super.key, required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: SizeConfig.calWidthMultiplier(12),
            children: [
              Image(
                image: AssetImage(userImageDefault),
                height: SizeConfig.calMultiplierImage(50),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Selamat Datang ${name}',
                    style: AppTextStyles.primaryTextMedium.copyWith(
                      color: textPrimary10,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${role}',
                    style: TextStyle(
                      color: textSecoundary,
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            width: SizeConfig.calWidthMultiplier(30),
            height: SizeConfig.calHeightMultiplier(30),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bluePrimaryMain.withValues(alpha: 0.3),
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.solidBell,
                color: bluePrimaryMain,
                size: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HomeMenuFeatures extends StatefulWidget {
  @override
  _HomeMenuFeaturesState createState() => _HomeMenuFeaturesState();
}

class _HomeMenuFeaturesState extends State<HomeMenuFeatures> {
  // State untuk mengontrol jumlah item
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Hitung jumlah item yang akan ditampilkan
    // Daftar item menu
    final List<Widget> _menuItems = [
      HomeMenuItems(
        menuName: 'Register',
        iconMenu: FontAwesomeIcons.userPlus,
        colorIcon: Colors.blue.shade700,
        onTap: () {},
      ),
      HomeMenuItems(
        menuName: 'Alat Ukur',
        iconMenu: FontAwesomeIcons.rulerCombined,
        colorIcon: Colors.blue.shade700,
        onTap: () {},
      ),
      HomeMenuItems(
        menuName: 'Monitoring',
        iconMenu: FontAwesomeIcons.chartLine,
        colorIcon: Colors.blue.shade700,
        onTap: () {},
      ),
      HomeMenuItems(
        menuName: 'Faktor Resiko',
        iconMenu: iconFaktorResiko,
        colorIcon: Colors.red.shade300,
        onTap: () {},
      ),
      HomeMenuItems(
          menuName: 'Parameter Gizi',
          iconMenu: FontAwesomeIcons.utensils,
          colorIcon: greenPrimary50,
          onTap: () {}),
      HomeMenuItems(
        menuName: 'Beban Kerja',
        iconMenu: FontAwesomeIcons.briefcase,
        colorIcon: pinkPrimary50,
        onTap: () {
          Navigator.pushNamed(context, BEBAN_KERJA);
        },
      ),
      HomeMenuItems(
          menuName: 'Laporan',
          iconMenu: FontAwesomeIcons.print,
          colorIcon: greenPrimary50,
          onTap: () {}),
      HomeMenuItems(
        menuName: 'e-PPGBM',
        colorIcon: greenPrimary50,
        iconMenu: iconExcel,
        onTap: () {},
      ),
    ];
    int itemExpanedCol = (_menuItems.length / 4).ceil();
    logger.d(
        'menu items ${_menuItems.length}, itemExpanedCol ${itemExpanedCol.ceil()}');
    int itemsToShow = _isExpanded ? _menuItems.length : 4;
    double sizeHeighRowItemMenu = MediaQuery.of(context).size.height / 6.5;

    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.calWidthMultiplier(24)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          // AnimatedContainer untuk efek animasi
          AnimatedContainer(
            duration: const Duration(milliseconds: 300), // Durasi animasi
            curve: Curves.easeInOut, // Kurva animasi
            height: _isExpanded
                ? sizeHeighRowItemMenu * itemExpanedCol.toDouble() +
                    MediaQuery.of(context).size.height / 50
                : sizeHeighRowItemMenu, // Tinggi menu saat diperluas/dikecilkan
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: itemsToShow, // Batasi jumlah item yang ditampilkan
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 16,
                childAspectRatio: 0.60,
                mainAxisSpacing: 16,
                maxCrossAxisExtent: 80,
              ),
              itemBuilder: (context, index) {
                return _menuItems[index];
              },
            ),
          ),
          // Tombol See All
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded; // Toggle state
              });
            },
            child: Row(
              spacing: 1,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _isExpanded ? "Sembunyikan" : "Lihat Lainnya",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  size: 20,
                  _isExpanded
                      ? FluentIcons.chevron_up_24_filled
                      : FluentIcons.chevron_down_24_filled,
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              side: BorderSide(
                width: 1,
                color: Colors.black38,
              ),
              minimumSize: Size(double.infinity, 52),
              shape: RoundedRectangleBorder(),
            ),
          )
        ],
      ),
    );
  }
}

class CardMessages extends StatelessWidget {
  final String title;
  final String message;

  const CardMessages({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xff72FA93), borderRadius: BorderRadius.circular(20)),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '${title}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${message}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class GraphData extends StatelessWidget {
  List<BarChartGroupData> dataChart = [
    BarChartGroupData(x: 0, barRods: [
      BarChartRodData(toY: 5, color: Colors.red, width: 16), // Tambahkan width
    ]),
    BarChartGroupData(x: 1, barRods: [
      BarChartRodData(toY: 10, color: Colors.red, width: 16),
    ]),
    BarChartGroupData(x: 2, barRods: [
      BarChartRodData(toY: 15, color: Colors.red, width: 16),
    ]),
    BarChartGroupData(x: 3, barRods: [
      BarChartRodData(toY: 20, color: Colors.red, width: 16),
    ]),
    BarChartGroupData(x: 4, barRods: [
      BarChartRodData(toY: 25, color: Colors.red, width: 16),
    ]),
    BarChartGroupData(x: 5, barRods: [
      BarChartRodData(toY: 20, color: Colors.red, width: 16),
    ]),
    BarChartGroupData(x: 6, barRods: [
      BarChartRodData(toY: 25, color: Colors.red, width: 16),
    ]),
    BarChartGroupData(x: 7, barRods: [
      BarChartRodData(toY: 5, color: Colors.red, width: 16),
    ]),
    BarChartGroupData(x: 8, barRods: [
      BarChartRodData(toY: 10, color: Colors.red, width: 16),
    ]),
    BarChartGroupData(x: 9, barRods: [
      BarChartRodData(toY: 15, color: Colors.red, width: 16),
    ]),
    BarChartGroupData(x: 10, barRods: [
      BarChartRodData(toY: 20, color: Colors.red, width: 16),
    ]),
    BarChartGroupData(x: 11, barRods: [
      BarChartRodData(toY: 30, color: Colors.red, width: 16),
    ]),
  ];
  List<String> listMonth = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember"
  ];

  GraphData({super.key});

  @override
  Widget build(BuildContext context) {
    // Hitung maxY secara dinamis
    double maxY = dataChart
        .expand((group) => group.barRods.map((rod) => rod.toY))
        .reduce((value, element) => value > element ? value : element);

    // Round up maxY to the nearest multiple of 10 for cleaner UI
    maxY = (maxY / 10).ceil() * 10;

    return Container(
      width: double.infinity,
      height: SizeConfig.calHeightMultiplier(300),
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.calWidthMultiplier(24),
        vertical: SizeConfig.calHeightMultiplier(8),
      ),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            offset: const Offset(0, 3),
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Grafik Kunjungan Ketua Kader',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: SizeConfig.calHeightMultiplier(8),
          ),
          Text(
            'Menampilkan grafik jumlah kunjungan yang telah dilakukan ketua kader',
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w500,
              color: Colors.black38,
            ),
          ),
          SizedBox(
            height: SizeConfig.calHeightMultiplier(20),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: BarChart(
                BarChartData(
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (group) {
                        return bluePrimaryMain;
                      },
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        String month = listMonth[group.x.toInt()];
                        return BarTooltipItem(
                          '$month\n${rod.toY}',
                          TextStyle(
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                  maxY: maxY + 10,
                  alignment: BarChartAlignment.spaceEvenly,
                  barGroups: dataChart,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: SizeConfig.calWidthMultiplier(
                            18), // Menyediakan ruang untuk judul
                        getTitlesWidget: (value, meta) {
                          // Tentukan interval label secara dinamis
                          if (value % 10 == 0) {
                            return Text(
                              value.toInt().toString(),
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black38),
                            );
                          }
                          return Container(); // Kosongkan jika tidak memenuhi kriteria
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const months = [
                            'Jan',
                            'Feb',
                            'Mar',
                            'Apr',
                            'Mei',
                            'Jun',
                            'Jul',
                            'Ags',
                            'Sep',
                            'Okt',
                            'Nov',
                            'Des'
                          ];
                          if (value >= 0 && value < months.length) {
                            return Text(
                              months[value.toInt()],
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black38),
                            );
                          }
                          return Container(); // Kosongkan jika tidak valid
                        },
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: false),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
