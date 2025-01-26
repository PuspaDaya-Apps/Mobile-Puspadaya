import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/jadwal/model/schadule.dart' as Schadule;
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/route/route_name.dart';
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: bluePrimaryMain,
        shape: CircleBorder(),
        child: Icon(
          size: 38,
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, CREATE_JADWAL);
          // Navigator.pushNamed(context, '/createJadwal');
        },
      ),
      backgroundColor: backgroundWhite10,
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

                // ListView.builder(
                //   // Gunakan ListView.builder jika kontennya dinamis
                //   physics:
                //       NeverScrollableScrollPhysics(), // Nonaktifkan scroll untuk ListView
                //   shrinkWrap: true, // ListView tidak mengambil seluruh ruang
                //   itemCount: 5, // Sesuaikan dengan jumlah jadwal
                //   itemBuilder: (context, index) => JadwalCard(),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class JadwalCard extends StatelessWidget {
  final DateTime date;
  final String name;
  final String timeStart;
  final String timeEnd;
  final String location;
  final List<String> months = [
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

  final List<String> days = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    "Jum'at",
    'Sabtu',
    'Minggu',
  ];

  JadwalCard({
    super.key,
    required this.date,
    required this.name,
    required this.timeStart,
    required this.timeEnd,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EDIT_JADWAL);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8, top: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: bluePrimaryMain,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateCard(date),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${timeStart} - ${timeEnd}',
                    style: TextStyle(
                      color: textSecoundary,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.calMultiplierText(16),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.white),
            Text(
              '${name}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            LocationCard(
              location: location,
            ),
          ],
        ),
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
  final String location;
  const LocationCard({
    super.key,
    required this.location,
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
        SizedBox(
          width: SizeConfig.calWidthMultiplier(4),
        ),
        Text(
          '${location}',
          style: TextStyle(
            color: Colors.white,
            fontSize: SizeConfig.calMultiplierText(8),
          ),
        )
      ],
    );
  }
}

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  _CalenderViewState createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  List<Schadule.Datum> schadules = [
    Schadule.Datum(
      id: "01",
      name: 'Pengukuran Rutin',
      time: DateTime.now().add(Duration(days: 5)),
      location: "Posyandu Mawar 1",
      timeStart: "07.30",
      timeEnd: "13.00",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    Schadule.Datum(
      id: "02",
      name: 'Pengukuran Rutin',
      time: DateTime.now().add(Duration(days: 2)),
      location: "Posyandu Mawar 1",
      timeStart: "07.30",
      timeEnd: "13.00",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    Schadule.Datum(
      id: "03",
      name: 'Pengukuran Rutin',
      time: DateTime.now().add(Duration(days: 2)),
      location: "Posyandu Mawar 1",
      timeStart: "07.30",
      timeEnd: "13.00",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    Schadule.Datum(
      id: "04",
      name: 'Pengukuran Rutin',
      time: DateTime.now().add(Duration(days: 7)),
      location: "Posyandu Mawar 1",
      timeStart: "07.30",
      timeEnd: "13.00",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];
  // final ValueNotifier<List<Schadule.Datum>> _schadules =
  //     ValueNotifier<List<Schadule.Datum>>([]);
  List<Schadule.Datum> _getEventsForDay(DateTime day) {
    return schadules.where((schedule) {
      return isSameDay(schedule.time, day);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TableCalendar(
            locale: 'id_ID',
            headerStyle: HeaderStyle(
              titleTextStyle: TextStyle(
                color: textPrimary10.withValues(alpha: 0.6),
                fontWeight: FontWeight.w500,
                fontSize: SizeConfig.calMultiplierText(16),
              ),
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              todayTextStyle: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            calendarBuilders: CalendarBuilders(
              todayBuilder: (context, day, focusedDay) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${day.day}',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (day.day == DateTime.now().day)
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                );
              },
              // Tambahkan marker untuk hari dengan jadwal
              markerBuilder: (context, day, events) {
                if (events.isNotEmpty) {
                  return Center(
                    child: Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color:
                            goldPrimary70, // Sesuaikan dengan warna selected decoration
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: TextStyle(
                            color: Colors
                                .black45, // Sesuaikan dengan selected text style
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            eventLoader: _getEventsForDay,
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2024, 1, 1),
            lastDay: DateTime.utc(2040, 1, 1),
          ),
        ),

        // Preview jadwal untuk hari yang dipilih
        ValueListenableBuilder(
          valueListenable: ValueNotifier(_selectedDay ?? DateTime.now()),
          builder: (context, selectedDay, _) {
            // final eventsForDay = isSameDay(selectedDay, DateTime.now())
            //     ? schadules // Tampilkan semua jadwal
            //     : _getEventsForDay(
            //         selectedDay); // Atau hanya jadwal untuk hari yang dipilih
            final eventsForDay = _getEventsForDay(selectedDay);

            return eventsForDay.isNotEmpty
                ? Column(
                    children: eventsForDay.map((schedule) {
                      return JadwalCard(
                        date: schedule.time,
                        name: schedule.name,
                        timeStart: schedule.timeStart,
                        timeEnd: schedule.timeEnd,
                        location: schedule.location,
                      );
                    }).toList(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Tidak ada jadwal untuk hari ini',
                      style: TextStyle(
                        color: textSecoundary,
                        fontSize: 16,
                      ),
                    ),
                  );
          },
        ),
      ],
    );
  }
}
