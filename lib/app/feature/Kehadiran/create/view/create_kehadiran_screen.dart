import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/feature/Kehadiran/create/model/post_create_kehadiran_model.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/shadow.dart';
import '../../../../../utils/constant/constanst.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../view/widget/date_time_picker_widget.dart';
import '../../../../view/widget/dropdown_widget.dart';
import '../../../../view/widget/info_field_widget.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../model/list_data_tamu_model.dart';
import '../bloc/create_kehadiran_anak_bloc.dart';
import '../bloc/create_kehadiran_bloc.dart';
import '../bloc/create_kehadiran_ibu_hamil_bloc.dart';
import '../model/paket_from_posyandu_to_kehadiran.dart';
import 'search_posyandu.dart';

class CreateKehadiranScreen extends StatelessWidget {
  const CreateKehadiranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateKehadiranBloc(),
        ),
        BlocProvider(
          create: (context) => CreateKehadiranAnakBloc(),
        ),
        BlocProvider(
          create: (context) => CreateKehadiranIbuHamilBloc(),
        ),
      ],
      child: CreateKehadiranScreenView(),
    );
  }
}

class CreateKehadiranScreenView extends StatefulWidget {
  const CreateKehadiranScreenView({super.key});

  @override
  State<CreateKehadiranScreenView> createState() => _CreateKehadiranViewState();
}

class _CreateKehadiranViewState extends State<CreateKehadiranScreenView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;
  String _durasiKehadiran = "00:00";
  String _duration = "-";
  String selectedStatusKegiatan = "Sedang Berjalan";
  DateTime? tanggalKegiatan;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  final _formKey = GlobalKey<FormState>();
  List<String> selectedAnakIds = [];
  List<String> selectedIbuHamilIds = [];
  List<String> selectedTamuIds = [];
  final List<ListDataTamuModel> listDataTamu = [];

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      confirmText: "OK",
      helpText: "Pilih Waktu Mulai",
      cancelText: "Batalkan",
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _startTime = pickedTime;
        _startTimeController.text = pickedTime.format(context);
      });
      _updateDuration();
      _updateDurationKehadiran();
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      confirmText: "OK",
      helpText: "Pilih Waktu Selesai",
      cancelText: "Batalkan",
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _endTime = pickedTime;
        _endTimeController.text = pickedTime.format(context);
      });
      _updateDuration();
      _updateDurationKehadiran();
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      cancelText: "Batalkan",
      confirmText: "OK",
      currentDate: DateTime.now(),
      helpText: "Pilih Tanggal",
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  void _updateDuration() {
    if (_startTime != null && _endTime != null) {
      final int startMinutes = _startTime!.hour * 60 + _startTime!.minute;
      final int endMinutes = _endTime!.hour * 60 + _endTime!.minute;

      if (endMinutes > startMinutes) {
        final int diffMinutes = endMinutes - startMinutes;
        final int hours = diffMinutes ~/ 60;
        final int minutes = diffMinutes % 60;

        setState(() {
          _duration = "${hours} jam ${minutes} menit";
        });
      } else {
        setState(() {
          _duration = "-";
        });
      }
    }
  }

  // !update durasi kehadiran
  void _updateDurationKehadiran() {
    if (_startTime != null && _endTime != null) {
      final int startMinutes = _startTime!.hour * 60 + _startTime!.minute;
      final int endMinutes = _endTime!.hour * 60 + _endTime!.minute;

      if (endMinutes >= startMinutes) {
        final int diffMinutes = endMinutes - startMinutes;
        final int hours = diffMinutes ~/ 60;
        final int minutes = diffMinutes % 60;

        // Format durasi ke HH:MM
        setState(() {
          _durasiKehadiran =
              "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}";
        });
      } else {
        // Jika waktu selesai lebih kecil dari waktu mulai, set durasi ke 00:00
        setState(() {
          _durasiKehadiran = "00:00";
        });
      }
    }
  }

  @override
  void initState() {
    context
        .read<CreateKehadiranAnakBloc>()
        .add(CreateKehadiranEventFormAnakLoaded());
    context
        .read<CreateKehadiranIbuHamilBloc>()
        .add(CreateKehadiranEventFormIbuHamilLoaded());
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    // final List<ProvinsiModel.Datum> selectProvinsi = [];
  }

  @override
  void dispose() {
    // Dispose TabController
    _tabController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  bool _validateTime() {
    if (_startTime != null && _endTime != null) {
      final DateTime startDateTime = DateTime(
        _startTime!.hour,
        _startTime!.minute,
      );

      final DateTime endDateTime = DateTime(
        _endTime!.hour,
        _endTime!.minute,
      );

      return endDateTime.isAfter(startDateTime);
    }
    return true; // Jika waktu belum dipilih, anggap valid
  }

  void _addNewTamu(String id, String nama, String posyanduAsal) {
    setState(() {
      selectedTamuIds.add(id);
      listDataTamu.add(
        ListDataTamuModel(
          namaPosyandu: posyanduAsal,
          posyanduAsal: posyanduAsal,
          nama: nama,
        ),
      );
    });
  }

  void _removeTamu(int index) {
    setState(() {
      selectedTamuIds.removeAt(index);
      listDataTamu.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: BlocListener<CreateKehadiranBloc, CreateKehadiranState>(
          listener: (context, state) {
            if (state is CreateKehadiranSubmitFailed) {
              showTopSnackBar(
                Overlay.of(context),
                animationDuration: const Duration(milliseconds: 600),
                displayDuration: const Duration(milliseconds: 2200),
                reverseAnimationDuration: const Duration(milliseconds: 300),
                TopSnackbarWidget().error(state.message),
              );
            }
            if (state is CreateKehadiranSubmitSuccess) {
              showTopSnackBar(
                Overlay.of(context),
                animationDuration: const Duration(milliseconds: 600),
                displayDuration: const Duration(milliseconds: 2200),
                reverseAnimationDuration: const Duration(milliseconds: 300),
                TopSnackbarWidget().success("Berhasil Membuat Data Kehadiran"),
              );
              Navigator.pop(context);
            }
          },
          child: ButtonPrimary(
            color: bluePrimaryMain,
            mainButtonMessage: 'Selesai',
            mainButton: () {
              if (!_validateTime()) {
                showTopSnackBar(
                    Overlay.of(context),
                    animationDuration: const Duration(milliseconds: 600),
                    displayDuration: const Duration(milliseconds: 2200),
                    reverseAnimationDuration: const Duration(milliseconds: 300),
                    TopSnackbarWidget().error(
                        "Waktu berakhir tidak boleh lebih dari waktu mulai"));
              } else {
                if (_formKey.currentState!.validate()) {
                  logger.d('selectedAnakID ${selectedAnakIds.join(', ')}');
                  logger.d(
                      'SelectedIbuHamilId ${selectedIbuHamilIds.join(', ')}');
                  logger.d('SelectedTamuId ${selectedTamuIds.join(', ')}');
                  logger.d('durasi kehadiran ${_durasiKehadiran}');
                  logger.d('valid');
                  PostCreateKehadiranModel data = PostCreateKehadiranModel(
                      tanggalPelaksanaan:
                          DateFormat('yyyy-MM-dd').format(_selectedDate!),
                      waktuMulai:
                          _startTimeController.text.replaceAll('.', ':'),
                      waktuSelesai:
                          _endTimeController.text.replaceAll('.', ':'),
                      durasi: _durasiKehadiran,
                      statusKegiatan: selectedStatusKegiatan,
                      kehadiranAnak: selectedAnakIds,
                      kehadiranIbuHamil: selectedIbuHamilIds,
                      kehadiranTamu: selectedTamuIds);
                  context
                      .read<CreateKehadiranBloc>()
                      .add(CreateKehadiranEventSubmit(data));
                } else {
                  logger.d('tidak valid');
                }
              }

              // Navigator.pop(context);
            },
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: PrimaryAppBar(
        title: 'Daftar hadir',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopSection(),
            _buildSectionMenu(),
          ],
        ),
      ),
    );
  }

  Container _buildTopSection() {
    return Container(
      decoration: BoxDecoration(
        color: bluePrimaryMain,
      ),
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mulai',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      DateTimePickerWidget(
                        isDate: false,
                        controller: _startTimeController,
                        selectDate: () {
                          _selectStartTime(context);
                        },
                        hintText: "Waktu Mulai",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Waktu mulai diperlukan";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selesai',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      DateTimePickerWidget(
                        isDate: false,
                        controller: _endTimeController,
                        selectDate: () {
                          _selectEndTime(context);
                        },
                        hintText: "Waktu Berakhir",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Waktu berakhir diperlukan";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            Row(
              spacing: 8,
              children: [
                // durasi
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Durasi',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      InfoFieldWidget(text: _duration),
                    ],
                  ),
                ),
                // tanggal
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tanggal',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.calHeightMultiplier(8),
                      ),
                      DateTimePickerWidget(
                        isDate: true,
                        controller: _dateController,
                        selectDate: () {
                          _selectDate(context);
                        },
                        hintText: "Pilih Tanggal Kehadiran",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Tanggal harus dipilih";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
            Text(
              'Status Kegiatan',
              style: AppTextStyles.primaryTextNormal.copyWith(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(8),
            ),
            DropdownWidget(
              hint: "Pilih Status Kegiatan",
              value: selectedStatusKegiatan,
              validator: (value) {
                if (value == null) {
                  return 'Pilih Status Kegiatan';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  selectedStatusKegiatan = value;
                });
              },
              items: selectStatusKegiatan,
            ),
            // InfoFieldWidget(text: 'Sedang Berjalan'),
            SizedBox(
              height: SizeConfig.calHeightMultiplier(16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionMenu() {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            child: TabBar(
              isScrollable: false,
              padding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorAnimation: TabIndicatorAnimation.elastic,
              dividerHeight: 0,
              controller: _tabController,
              indicator: BoxDecoration(
                color: bluePrimaryMain,
                borderRadius: BorderRadius.circular(5),
              ),
              unselectedLabelColor: textSecondary1,
              labelColor: Colors.white,
              tabs: [
                Tab(text: 'Anak'),
                Tab(text: 'Ibu Hamil'),
                Tab(text: 'Tamu'),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                // Anak
                BlocBuilder<CreateKehadiranAnakBloc, CreateKehadiranAnakState>(
                  builder: (context, state) {
                    if (state is CreateKehadiranFormAnakLoading) {
                      return SizedBox(
                        child: Center(
                          child: SpinKitThreeBounce(
                            color: bluePrimaryMain,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    if (state is CreateKehadiranFormAnakEmpty) {
                      return Center(
                        child: Text(
                          'Tidak ada data anak',
                          style: AppTextStyles.primaryTextNormal.copyWith(
                            color: textSecondary1,
                            fontSize: 14,
                          ),
                        ),
                      );
                    }
                    if (state is CreateKeadiranFormAnakSuccess) {
                      return ListView.builder(
                        itemCount: state.dataAnak.data.length,
                        itemBuilder: (context, index) {
                          final dataAnak = state.dataAnak.data[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                dataAnak.isChecked = !dataAnak.isChecked;
                                if (dataAnak.isChecked) {
                                  selectedAnakIds.add(dataAnak.id);
                                } else {
                                  selectedAnakIds.remove(dataAnak.id);
                                }
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: shadowSm,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                leading: Checkbox(
                                  visualDensity: VisualDensity(
                                    horizontal: -4,
                                    vertical: -4,
                                  ),
                                  shape: CircleBorder(),
                                  side: BorderSide(
                                    color: stroke10,
                                    width: 2,
                                  ),
                                  activeColor: bluePrimaryMain,
                                  checkColor: Colors.white,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.padded,
                                  // value: dataAnak.isChecked,
                                  value: dataAnak.isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      dataAnak.isChecked = value!;
                                      if (dataAnak.isChecked) {
                                        selectedAnakIds.add(dataAnak.id);
                                      } else {
                                        selectedAnakIds.remove(dataAnak.id);
                                      }
                                    });
                                  },
                                ),
                                visualDensity:
                                    VisualDensity(horizontal: -4, vertical: -4),
                                title: Text(dataAnak.namaAnak),
                                subtitle:
                                    Text('Nama ibu : ${dataAnak.namaIbu}'),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
                // Ibu
                BlocBuilder<CreateKehadiranIbuHamilBloc,
                    CreateKehadiranIbuHamilState>(
                  builder: (context, state) {
                    if (state is CreateKehadiranFormIbuHamilLoading) {
                      return SizedBox(
                        child: Center(
                          child: SpinKitThreeBounce(
                            color: bluePrimaryMain,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    if (state is CreateKehadiranFormIbuHamilEmpty) {
                      return Center(
                        child: Text(
                          'Tidak ada data Ibu Hamil',
                          style: AppTextStyles.primaryTextNormal.copyWith(
                            color: textSecondary1,
                            fontSize: 14,
                          ),
                        ),
                      );
                    }
                    if (state is CreateKeadiranFormIbuHamilSuccess) {
                      logger.d(state.dataIbuHamil.data.length);
                      return ListView.builder(
                        itemCount: state.dataIbuHamil.data.length,
                        itemBuilder: (context, index) {
                          final dataibuHamil = state.dataIbuHamil.data[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                dataibuHamil.isChecked =
                                    !dataibuHamil.isChecked;
                                if (dataibuHamil.isChecked) {
                                  selectedIbuHamilIds.add(dataibuHamil.id);
                                } else {
                                  selectedIbuHamilIds.remove(dataibuHamil.id);
                                }
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: shadowSm,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                leading: Checkbox(
                                  visualDensity: VisualDensity(
                                    horizontal: -4,
                                    vertical: -4,
                                  ),
                                  shape: CircleBorder(),
                                  side: BorderSide(
                                    color: stroke10,
                                    width: 2,
                                  ),
                                  activeColor: bluePrimaryMain,
                                  checkColor: Colors.white,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.padded,
                                  // value: dataAnak.isChecked,
                                  value: dataibuHamil.isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      dataibuHamil.isChecked = value!;
                                      if (dataibuHamil.isChecked) {
                                        selectedIbuHamilIds
                                            .add(dataibuHamil.id);
                                      } else {
                                        selectedIbuHamilIds
                                            .remove(dataibuHamil.id);
                                      }
                                    });
                                  },
                                ),
                                visualDensity:
                                    VisualDensity(horizontal: -4, vertical: -4),
                                title: Text(dataibuHamil.namaIbu),
                                subtitle: Text('NIK : ${dataibuHamil.nik}'),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
                // Tamu
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: listDataTamu.length,
                        itemBuilder: (context, index) {
                          final dataTamu = listDataTamu[index];
                          return Container(
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: shadowSm,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              trailing: IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _removeTamu(index),
                              ),
                              visualDensity:
                                  VisualDensity(horizontal: -4, vertical: -4),
                              title: Text(dataTamu.nama!),
                              subtitle: Text(
                                  'Posyandu Asal : ${dataTamu.posyanduAsal}'),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      width: MediaQuery.sizeOf(context).width,
                      child: OutlinedButton(
                        onPressed: () async {
                          PaketFromPosyanduToKehadiran result =
                              await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchPosyandu(),
                            ),
                          );
                          logger.d(result);
                          if (result != null) {
                            _addNewTamu(
                              result.dataAnak.id,
                              result.dataAnak.namaAnak,
                              result.namaPosyandu,
                            );
                          }
                        },
                        child: Text('Tambah Kehadiran Tamu'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
