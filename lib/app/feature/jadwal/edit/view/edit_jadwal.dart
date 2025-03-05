import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/jadwal/edit/model/patch_jadwal_posyandu_model.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/date_time_picker_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/app/view/widget/textField_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/utils/logger/logger.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../config/validator/validator.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../bloc/jadwal_edit_bloc.dart';

class EditJadwal extends StatelessWidget {
  final String id;
  const EditJadwal({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JadwalEditBloc()..add(GetDetailJadwal(id)),
      child: EditJadwalView(
        id: id,
      ),
    );
  }
}

class EditJadwalView extends StatefulWidget {
  final String id;
  const EditJadwalView({super.key, required this.id});

  @override
  State<EditJadwalView> createState() => _EditJadwalViewState();
}

class _EditJadwalViewState extends State<EditJadwalView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  @override
  void initState() {
    super.initState();
    // _fetchDetailData();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      cancelText: "Batalkan",
      confirmText: "OK",
      currentDate: DateTime.now(),
      helpText: "Pilih Tanggal",
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );

    setState(() {
      _dateController.text = "${pickedDate?.toLocal()}".split(' ')[0];
    });
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
      final String formattedTime = pickedTime.format(context);
      setState(() {
        _startTimeController.text = formattedTime;
      });
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
      final String formattedTime = pickedTime.format(context);
      setState(() {
        _endTimeController.text = formattedTime;
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    _nameController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  bool _validateTime() {
    if (_startTime != null && _endTime != null) {
      final DateTime startDateTime = DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _startTime!.hour,
        _startTime!.minute,
      );

      final DateTime endDateTime = DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _endTime!.hour,
        _endTime!.minute,
      );

      return endDateTime.isAfter(startDateTime);
    }
    return true; // Jika waktu belum dipilih, anggap valid
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: "Perbaruan Jadwal Posyandu",
        actions: [],
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: BlocListener<JadwalEditBloc, JadwalEditState>(
              listener: (context, state) {
                if (state is JadwalDetailLoaded) {
                  // Set controller values when data is loaded
                  _nameController.text = state.data.data.namaKegiatan;
                  _dateController.text = state.data.data.tanggalPelaksanaan
                      .toString()
                      .split(' ')[0];
                  _startTimeController.text =
                      state.data.data.waktuMulai.replaceAll(':', '.');
                  _endTimeController.text =
                      state.data.data.waktuSelesai.replaceAll(':', '.');
                  _locationController.text = state.data.data.lokasi;
                } else if (state is JadwalEditSuccess) {
                  // Show success snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Jadwal berhasil diperbarui')),
                  );
                  Navigator.pop(context); // Navigate back after success
                } else if (state is JadwalEditFailure) {
                  // Show error snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Nama Kegiatan',
                          style: TextStyle(fontSize: 12)),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      TextFieldWidget(
                        controller: _nameController,
                        hintText: "Masukan Nama Kegiatan",
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        isPasswordField: false,
                        validators: [
                          (value) => Validator.required(
                              value, 'Nama kegiatan tidak boleh kosong'),
                        ],
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      const Text('Tanggal', style: TextStyle(fontSize: 12)),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      DateTimePickerWidget(
                        isDate: true,
                        controller: _dateController,
                        selectDate: () {
                          _selectDate(context);
                        },
                        hintText: "Pilih Tanggal Pengukuran",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Tanggal harus dipilih";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Mulai',
                                    style: TextStyle(fontSize: 12)),
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(8)),
                                DateTimePickerWidget(
                                  isDate: false,
                                  controller: _startTimeController,
                                  selectDate: () {
                                    _selectStartTime(context);
                                  },
                                  hintText: "Waktu Mulai Pengukuran",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Waktu mulai harus dipilih";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: SizeConfig.calWidthMultiplier(10)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Berakhir',
                                    style: TextStyle(fontSize: 12)),
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(8)),
                                DateTimePickerWidget(
                                  isDate: false,
                                  controller: _endTimeController,
                                  selectDate: () {
                                    _selectEndTime(context);
                                  },
                                  hintText: "Waktu Berakhir Pengukuran",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Waktu berakhir harus dipilih";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      const Text('Lokasi Kegiatan',
                          style: TextStyle(fontSize: 12)),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      TextFieldWidget(
                        controller: _locationController,
                        hintText: "Masukan Lokasi Kegiatan",
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        isPasswordField: false,
                        validators: [
                          (value) => Validator.required(
                              value, 'Lokasi kegiatan tidak boleh kosong'),
                        ],
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      ButtonPrimary(
                        color: bluePrimaryMain,
                        mainButtonMessage: 'Simpan',
                        mainButton: () {
                          if (_formKey.currentState!.validate() &&
                              _validateTime()) {
                            logger.d(
                              "name: ${_nameController.text}, date: ${_dateController.text}, startTime: ${_startTimeController.text}, endTime: ${_endTimeController.text}, location: ${_locationController.text}",
                            );
                            PatchJadwalPosyanduModel patchJadwalPosyanduModel =
                                PatchJadwalPosyanduModel(
                              tanggalPelaksanaan:
                                  DateTime.parse(_dateController.text)
                                      .toLocal(),
                              lokasi: _locationController.text,
                              waktuMulai: _startTimeController.text
                                  .replaceAll('.', ':'),
                              namaKegiatan: _nameController.text,
                              waktuSelesai:
                                  _endTimeController.text.replaceAll('.', ':'),
                            );
                            context.read<JadwalEditBloc>().add(
                                  EditJadwalEvent(
                                    id: widget.id,
                                    patchJadwalPosyanduModel:
                                        patchJadwalPosyanduModel,
                                  ),
                                );
                          } else if (!_validateTime()) {
                            showTopSnackBar(
                                Overlay.of(context),
                                animationDuration:
                                    const Duration(milliseconds: 600),
                                displayDuration:
                                    const Duration(milliseconds: 2200),
                                reverseAnimationDuration:
                                    const Duration(milliseconds: 300),
                                TopSnackbarWidget().error(
                                    "Waktu berakhir tidak boleh lebih dari waktu mulai"));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
