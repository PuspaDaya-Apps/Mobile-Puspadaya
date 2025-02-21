import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puspadaya/app/feature/jadwal/index/bloc/jadwal_index_bloc.dart';
import 'package:puspadaya/app/feature/jadwal/index/model/get_all_jadwal_posyandu_model.dart'
    as GetAllJadwalPosyanduModel;
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/route/route_name.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../view/screen/data_not_found_screen.dart';
import '../../../../view/widget/pul_to_refresh.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';

class Jadwal extends StatelessWidget {
  const Jadwal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JadwalIndexBloc(),
      child: JadwalView(),
    );
  }
}

class JadwalView extends StatefulWidget {
  const JadwalView({super.key});

  @override
  State<JadwalView> createState() => _JadwalViewState();
}

class _JadwalViewState extends State<JadwalView> {
  late EasyRefreshController _controller;
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    context.read<JadwalIndexBloc>().add(GetDataJadwalPosyanduEvent());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        child: BlocConsumer<JadwalIndexBloc, JadwalIndexState>(
          listener: (context, state) {
            // You can handle side effects here if needed
            if (state is JadwalIndexFailed) {
              // For example, show a snackbar with the error message
              showTopSnackBar(
                  Overlay.of(context),
                  animationDuration: const Duration(milliseconds: 600),
                  displayDuration: const Duration(milliseconds: 2200),
                  reverseAnimationDuration: const Duration(milliseconds: 300),
                  TopSnackbarWidget().error(state.message));
            }
          },
          builder: (context, state) {
            if (state is JadwalIndexLoading) {
              return Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height / 1.15,
                child: Center(
                  child: SpinKitThreeBounce(
                    color: bluePrimaryMain,
                    size: 50.0,
                  ),
                ),
              );
            }
            if (state is JadwalIndexFailed) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyle(
                    color: textSecondary1,
                    fontSize: 16,
                  ),
                ),
              );
            }
            if (state is JadwalIndexSuccess) {
              if (state.data.data.isEmpty) {
                return DataNotFoundScreen();
              }
              return PullToRefreshWidget(
                onRefresh: () async {
                  logger.d('on refresh');
                  context
                      .read<JadwalIndexBloc>()
                      .add(GetDataJadwalPosyanduEvent());
                  _controller.finishRefresh();
                },
                refreshController: _controller,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
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
                        CalenderView(
                          jadwal: state.data.data,
                        ),
                        SizedBox(
                          height: SizeConfig.calHeightMultiplier(20),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class JadwalCard extends StatelessWidget {
  final String id;
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
    required this.id,
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
        Navigator.pushNamed(
          context,
          EDIT_JADWAL,
          arguments: id,
        );
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
                      color: textSecondary1,
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
            fontSize: SizeConfig.calMultiplierText(38),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${months[date.month - 1]} ${date.year}', // Corrected month indexing
              style: TextStyle(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
            Text(
              '${days[date.weekday - 1]}', // Corrected weekday indexing
              style: TextStyle(
                fontSize: 13,
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
          height: 12,
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
            fontSize: SizeConfig.calMultiplierText(12),
          ),
        )
      ],
    );
  }
}

class CalenderView extends StatefulWidget {
  List<GetAllJadwalPosyanduModel.Datum> jadwal;
  CalenderView({super.key, required this.jadwal});

  @override
  _CalenderViewState createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  // List<GetAllJadwalPosyanduModel.Datum> schadules = [
  //   GetAllJadwalPosyanduModel.Datum(
  //     id: "01",
  //     lokasi: 'Posyandu Mawar 1',
  //     namaKegiatan: 'Pengukuran Rutin',
  //     posyandu: GetAllJadwalPosyanduModel.Posyandu(
  //       id: "01",
  //       namaPosyandu: 'Mawar 1',
  //       alamat: 'Jl. Mawar 1 No. 1',
  //       createdAt: DateTime.now(),
  //       updatedAt: DateTime.now(),
  //     ),
  //     tanggalPelaksanaan: DateTime.now().add(Duration(days: 5)),
  //     waktuMulai: "07.30",
  //     waktuSelesai: "13.00",
  //     createdAt: DateTime.now(),
  //     updatedAt: DateTime.now(),
  //   ),
  // ];
  final ValueNotifier<List<GetAllJadwalPosyanduModel.Datum>> _schadules =
      ValueNotifier<List<GetAllJadwalPosyanduModel.Datum>>([]);
  List<GetAllJadwalPosyanduModel.Datum> _getEventsForDay(DateTime day) {
    return widget.jadwal.where((schedule) {
      return isSameDay(schedule.tanggalPelaksanaan, day);
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
                        id: schedule.id,
                        date: schedule.tanggalPelaksanaan,
                        name: schedule.namaKegiatan,
                        timeStart: schedule.waktuMulai,
                        timeEnd: schedule.waktuSelesai,
                        location: schedule.lokasi,
                      );
                    }).toList(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Tidak ada jadwal untuk hari ini',
                      style: TextStyle(
                        color: textSecondary1,
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
