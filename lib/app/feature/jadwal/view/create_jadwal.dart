import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar.dart';
import 'package:puspadaya/app/view/widget/date_time_picker_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button.dart';
import 'package:puspadaya/app/view/widget/textField_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/utils/logger/logger.dart';

class CreateJadwal extends StatefulWidget {
  const CreateJadwal({super.key});

  @override
  State<CreateJadwal> createState() => _CreateJadwalState();
}

class _CreateJadwalState extends State<CreateJadwal> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

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

    if (pickedDate != null) {
      setState(() {
        _dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: "Buat Jadwal Posyandu",
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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nama Kegiatan',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  TextFieldWidget(
                    controller: _nameController,
                    hintText: "Masukan Nama Kegiatan",
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    isPasswordField: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Nama kegiatan tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Tanggal',
                    style: TextStyle(fontSize: 12),
                  ),
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
                            const Text(
                              'Mulai',
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
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
                            const Text(
                              'Berakhir',
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: SizeConfig.calHeightMultiplier(8)),
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
                  const Text(
                    'Lokasi Kegiatan',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  TextFieldWidget(
                    controller: _locationController,
                    hintText: "Masukan Lokasi Kegiatan",
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    isPasswordField: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Lokasi kegiatan tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  ButtonPrimary(
                    color: bluePrimaryMain,
                    mainButtonMessage: 'Simpan',
                    mainButton: () {
                      if (_formKey.currentState!.validate()) {
                        logger.d(
                          "name: ${_nameController.text}, date: ${_dateController.text}, startTime: ${_startTimeController.text}, endTime: ${_endTimeController.text}, location: ${_locationController.text}",
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
