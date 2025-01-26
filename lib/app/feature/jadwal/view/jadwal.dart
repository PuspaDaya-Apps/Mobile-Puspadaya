import 'package:flutter/material.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:table_calendar/table_calendar.dart';

class Jadwal extends StatelessWidget {
  const Jadwal({super.key});

  @override
  Widget build(BuildContext context) {
    return JadwalView();
  }
}

class JadwalView extends StatefulWidget {
  const JadwalView({super.key});

  @override
  State<JadwalView> createState() => _JadwalViewState();
}

class _JadwalViewState extends State<JadwalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          // Gunakan SingleChildScrollView
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(12),
                ),
                Text(
                  'Jadwal Posyandu',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(18),
                ),
                CalenderView(),
                SizedBox(
                  height: SizeConfig.calHeightMultiplier(20),
                ),
                ListView.builder(
                  // Gunakan ListView.builder jika kontennya dinamis
                  physics:
                      NeverScrollableScrollPhysics(), // Nonaktifkan scroll untuk ListView
                  shrinkWrap: true, // ListView tidak mengambil seluruh ruang
                  itemCount: 5, // Sesuaikan dengan jumlah jadwal
                  itemBuilder: (context, index) => JadwalCard(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class JadwalCard extends StatelessWidget {
  final List<String> months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli', // Corrected from 'July' to 'Juli'
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  final List<String> days = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    "Jum'at",
    'Sabtu',
    'Minggu',
  ];

  JadwalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: blueColor1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateCard(DateTime.now()),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '07.30-13.00',
                  style: TextStyle(
                    color: secoundaryFontColor1,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.calMultiplierText(16),
                  ),
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white),
          Text(
            'Pengukuran Rutin',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          LocationCard(),
        ],
      ),
    );
  }

  Row DateCard(DateTime date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${date.day.toString().padLeft(2, '0')}',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.calMultiplierText(30),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${months[date.month - 1]} ${date.year}', // Corrected month indexing
              style: TextStyle(
                fontSize: 11,
                color: Colors.white,
              ),
            ),
            Text(
              '${days[date.weekday - 1]}', // Corrected weekday indexing
              style: TextStyle(
                fontSize: 11,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          height: 8,
          image: AssetImage(
            iconLocation,
          ),
        ),
        SizedBox(width: 4,),
        Text(
          'Posyandu Mawar 6',
          style: TextStyle(
            color: Colors.white,
            fontSize: SizeConfig.calMultiplierText(8),
          ),
        )
      ],
    );
  }
}

class CalenderView extends StatelessWidget {
  const CalenderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TableCalendar(
        locale: 'id_ID',
        headerStyle: HeaderStyle(
          titleTextStyle: TextStyle(
            color: secoundaryFontColor1,
            fontWeight: FontWeight.w500,
            fontSize: SizeConfig.calMultiplierText(16),
          ),
          formatButtonVisible: false,
          titleCentered: true,
        ),
        focusedDay: DateTime.now(),
        firstDay: DateTime.utc(2024, 1, 1),
        lastDay: DateTime.utc(2040, 1, 1),
      ),
    );
  }
}
