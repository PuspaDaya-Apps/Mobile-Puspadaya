import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/app/view/widget/top_snackbar/top_snackbar_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/shadow.dart';
import '../../../../../utils/helper/helper_data.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../view/widget/date_time_picker_widget.dart';
import '../../../../view/widget/info_field_widget.dart';
import '../../create/model/paket_from_posyandu_to_kehadiran.dart';
import '../../create/model/post_create_kehadiran_model.dart';
import '../../create/view/search_posyandu.dart';
import '../../detail/model/get_detail_kehadiran_model.dart';
import '../../model/list_data_tamu_model.dart';
import '../bloc/update_kehadiran_bloc.dart';
import 'list_data_anak.dart';
import 'list_data_ibu.dart';

class UpdateKehadiran extends StatelessWidget {
  final GetDetailKehadiranModel data;
  const UpdateKehadiran({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateKehadiranBloc(),
      child: UpdateKehadiranView(
        data: data,
      ),
    );
  }
}

class UpdateKehadiranView extends StatefulWidget {
  final GetDetailKehadiranModel data;
  const UpdateKehadiranView({super.key, required this.data});

  @override
  State<UpdateKehadiranView> createState() => _UpdateKehadiranViewState();
}

class _UpdateKehadiranViewState extends State<UpdateKehadiranView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  String _durasiKehadiran = "00:00";
  String _duration = "-";
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  final _formKey = GlobalKey<FormState>();
  List<String> selectedAnakIds = [];
  List<String> selectedIbuHamilIds = [];
  List<String> selectedTamuIds = [];
  List<ListDataTamuModel> listDataTamu = [];

  @override
  void initState() {
    logger.d("update kehadiran init state");
    context.read<UpdateKehadiranBloc>().add(UpdateKehadiranEventFormLoaded());
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    logger.d(widget.data.data.waktuMulai);
    _startTimeController.text =
        widget.data.data.waktuMulai.replaceAll(':', '.');
    _endTimeController.text =
        widget.data.data.waktuSelesai.replaceAll(':', '.');
    _duration =
        HelperData().konversiDurasiHHMMKeString(widget.data.data.durasi);

    // final List<ProvinsiModel.Datum> selectProvinsi = [];
    // Isi data dari detail
    selectedAnakIds =
        widget.data.data.kehadiranAnak.map((anak) => anak.anakId).toList();
    selectedIbuHamilIds = widget.data.data.kehadiranIbuHamil
        .map((ibu) => ibu.ibuHamilId)
        .toList();
    listDataTamu = widget.data.data.kehadiranTamu
        .map((tamu) => ListDataTamuModel(
              namaPosyandu: tamu.posyanduAsal,
              posyanduAsal: tamu.posyanduAsal,
              nama: tamu.namaAnak,
            ))
        .toList();
    selectedTamuIds =
        widget.data.data.kehadiranTamu.map((tamu) => tamu.anakId).toList();

    logger.d(
        'selectedAnakID ${selectedAnakIds.join(', ')}'); //sudah berisi id dari anak id
    logger.d(
        'SelectedIbuHamilId ${selectedIbuHamilIds.join(', ')}'); //sudah berisi id dari ibu hamil id
    logger.d(
        'SelectedTamuId ${selectedTamuIds.join(', ')}'); //sudah berisi id dari tamu id
  }

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
  void dispose() {
    // Dispose TabController
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          BlocListener<UpdateKehadiranBloc, UpdateKehadiranState>(
        listener: (context, state) {
          if (state is UpdateKehadiranSubmitFailed) {
            showTopSnackBar(
              Overlay.of(context),
              animationDuration: const Duration(milliseconds: 600),
              displayDuration: const Duration(milliseconds: 2200),
              reverseAnimationDuration: const Duration(milliseconds: 300),
              TopSnackbarWidget().error(state.message),
            );
          }
          if(state is UpdateKehadiranSubmitSuccess){
            showTopSnackBar(
              Overlay.of(context),
              animationDuration: const Duration(milliseconds: 600),
              displayDuration: const Duration(milliseconds: 2200),
              reverseAnimationDuration: const Duration(milliseconds: 300),
              TopSnackbarWidget().success("Berhasil Mengubah Data Kehadiran"),
            );
            Navigator.pop(context, true);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: ButtonPrimary(
            color: bluePrimaryMain,
            mainButtonMessage: 'Simpan',
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
                  logger.d(
                      'waktu mulai ${_startTimeController.text.replaceAll('.', ':')}');
                  logger.d(
                      'waktu selesai ${_endTimeController.text.replaceAll('.', ':')}');
                  logger.d(
                      'tanggal pelaksanaan ${DateFormat('yyyy-MM-dd').format(DateTime.now())} ');
                  logger.d('valid');
                  PostCreateKehadiranModel data = PostCreateKehadiranModel(
                      tanggalPelaksanaan:
                          DateFormat('yyyy-MM-dd').format(DateTime.now()),
                      waktuMulai:
                          _startTimeController.text.replaceAll('.', ':'),
                      waktuSelesai:
                          _endTimeController.text.replaceAll('.', ':'),
                      durasi: _durasiKehadiran,
                      statusKegiatan: "Sedang Berjalan",
                      kehadiranAnak: selectedAnakIds,
                      kehadiranIbuHamil: selectedIbuHamilIds,
                      kehadiranTamu: selectedTamuIds);
                  context
                      .read<UpdateKehadiranBloc>()
                      .add(UpdateKehadiranEventSubmit(
                        data: data,
                        id: widget.data.data.id,
                      ));
                } else {
                  logger.d('tidak valid');
                }
              }
              // Navigator.pop(context);
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
        child: Container(
          child: Column(
            children: [
              _buildTopSection(),
              _buildSectionMenu(),
            ],
          ),
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
            InfoFieldWidget(text: widget.data.data.statusKegiatan),
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
      child: BlocBuilder<UpdateKehadiranBloc, UpdateKehadiranState>(
        builder: (context, state) {
          if (state is UpdateKehadiranFormLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is UpdateKehadiranFormFailed) {
            return Center(child: Text(state.message));
          }
          if (state is UpdateKehadiranFormSuccess) {
            return Column(children: [
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
                    ListView.builder(
                      itemCount: state.dataAnak.data.length,
                      itemBuilder: (context, index) {
                        final dataAnak = state.dataAnak.data[index];
                        bool isChecked = selectedAnakIds.contains(dataAnak.id);
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
                                value: isChecked,
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
                              subtitle: Text('Nama ibu : ${dataAnak.namaIbu}'),
                            ),
                          ),
                        );
                      },
                    ),
                    // Ibu
                    ListView.builder(
                      itemCount: state.dataIbuHamil.data.length,
                      itemBuilder: (context, index) {
                        final dataIbuHamil = state.dataIbuHamil.data[index];
                        bool isChecked =
                            selectedIbuHamilIds.contains(dataIbuHamil.id);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              dataIbuHamil.isChecked = !dataIbuHamil.isChecked;
                              if (dataIbuHamil.isChecked) {
                                selectedIbuHamilIds.add(dataIbuHamil.id);
                              } else {
                                selectedIbuHamilIds.remove(dataIbuHamil.id);
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
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    dataIbuHamil.isChecked = value!;
                                    if (dataIbuHamil.isChecked) {
                                      selectedIbuHamilIds.add(dataIbuHamil.id);
                                    } else {
                                      selectedIbuHamilIds
                                          .remove(dataIbuHamil.id);
                                    }
                                  });
                                },
                              ),
                              visualDensity:
                                  VisualDensity(horizontal: -4, vertical: -4),
                              title: Text(dataIbuHamil.namaIbu),
                              subtitle: Text('NIK : ${dataIbuHamil.nik}'),
                            ),
                          ),
                        );
                      },
                    ),
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
                                  visualDensity: VisualDensity(
                                      horizontal: -4, vertical: -4),
                                  title: Text(dataTamu.nama!),
                                  subtitle: Text(
                                      'Posyandu Asal : ${dataTamu.posyanduAsal}'),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 24, vertical: 8),
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
            ]);
          }
          return Container();
        },
      ),
    );
  }
}
