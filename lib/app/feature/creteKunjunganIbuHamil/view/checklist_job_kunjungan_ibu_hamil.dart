import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../../../utils/constant/constanst.dart';
import '../../../view/widget/alert_confirm_create_kunjungan.dart';
import '../../../view/widget/checkbox_list_widget.dart';
import '../../createKunjunganStunting/view/model/CheckBoxKunjungan.dart';

class ChecklistJobKunjunganIbuHamil extends StatefulWidget {
  const ChecklistJobKunjunganIbuHamil({super.key});

  @override
  State<ChecklistJobKunjunganIbuHamil> createState() =>
      _ChecklistJobKunjunganIbuHamilState();
}

class _ChecklistJobKunjunganIbuHamilState
    extends State<ChecklistJobKunjunganIbuHamil> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _appBarTitles = [
    'Tugas Selama Kunjungan',
    'Upload Bukti Kunjungan',
  ];

  final List<double> _progressValues = [
    0.5,
    1.0,
  ];

  void _goToNextPage() {
    if (_currentPage < _progressValues.length - 1) {
      setState(() {
        _currentPage++;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  if (_currentPage > 0) {
                    setState(() {
                      _currentPage--;
                    });
                    _pageController.animateToPage(
                      _currentPage,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
              title: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: Text(
                  _appBarTitles[_currentPage],
                  key: ValueKey<String>(_appBarTitles[_currentPage]),
                  style: AppTextStyles.primaryTextMedium.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                height: 4,
                width: MediaQuery.sizeOf(context).width *
                    _progressValues[_currentPage],
                color: bluePrimaryMain,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            // Halaman pertama
            CheckListJobKunjunganIbuHamilView(
              goToNext: _goToNextPage,
            ),
            // Halaman kedua
            UploadImage(),
          ],
        ),
      ),
    );
  }
}

class CheckListJobKunjunganIbuHamilView extends StatefulWidget {
  final VoidCallback goToNext;

  CheckListJobKunjunganIbuHamilView({super.key, required this.goToNext});

  @override
  State<CheckListJobKunjunganIbuHamilView> createState() =>
      _CheckListJobKunjunganIbuHamilViewState();
}

class _CheckListJobKunjunganIbuHamilViewState
    extends State<CheckListJobKunjunganIbuHamilView> {
  void _updateCheckbox(int index, bool? value) {
    setState(() {
      if (index == listOfCheckboxIbuHamil.length - 1 && value == true) {
        // If the last checkbox is selected, disable all other checkboxes
        for (int i = 0; i < listOfCheckboxIbuHamil.length - 1; i++) {
          listOfCheckboxIbuHamil[i].isChecked = false;
        }
      } else if (index != listOfCheckboxIbuHamil.length - 1) {
        // If any other checkbox is selected, uncheck the last checkbox
        listOfCheckboxIbuHamil[listOfCheckboxIbuHamil.length - 1].isChecked =
            false;
      }

      // Update the selected checkbox state
      listOfCheckboxIbuHamil[index].isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pilih tugas yang sudah dilakukan',
            style: AppTextStyles.primaryTextMedium.copyWith(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          ...listOfCheckboxIbuHamil.asMap().entries.map((entry) {
            int index = entry.key;
            CheckboxKunjungan item = entry.value;

            return CheckboxListWidget(
              isChecked: item.isChecked,
              label: item.label,
              onChanged: (value) {
                if (index == listOfCheckboxIbuHamil.length - 1 &&
                    value == true) {
                  // Disable other checkboxes if the last one is selected
                  for (int i = 0; i < listOfCheckboxIbuHamil.length - 1; i++) {
                    listOfCheckboxIbuHamil[i].isChecked = false;
                  }
                }
                _updateCheckbox(index, value);
              },
            );
          }).toList(),
          const SizedBox(height: 20),
          ButtonPrimary(
            color: bluePrimaryMain,
            mainButtonMessage: 'Simpan',
            mainButton: widget.goToNext,
          ),
        ],
      ),
    );
  }
}

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _images = []; // Menyimpan beberapa gambar
  Future<void> _pickImageFromGallery() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      setState(() {
        _images.addAll(images);
      });
    }
  }

  Future<void> _pickImages(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
        source: ImageSource.camera); // Pilih satu gambar dari kamera
    if (pickedFile != null) {
      setState(() {
        _images.add(pickedFile); // Tambahkan gambar ke daftar
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index); // Hapus gambar berdasarkan indeks
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _images.isNotEmpty
                ? Column(
                    spacing: 8.0,
                    children: _images.asMap().entries.map((entry) {
                      int index = entry.key;
                      XFile image = entry.value;
                      return Stack(
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height / 5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(File(image.path)),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: GestureDetector(
                              onTap: () => _removeImage(index),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.red,
                                ),
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  )
                : Container(), // Jika tidak ada gambar, tampilkan kosong
            _images.isEmpty ? SizedBox.shrink() : const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  useSafeArea: true,
                  barrierColor: Colors.black.withValues(alpha: 0.5),
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Column(
                        children: [
                          SizedBox(height: 16),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          SizedBox(height: 20),
                          ListTile(
                            leading: Icon(
                              FluentIcons.camera_24_regular,
                              color: Colors.black,
                            ),
                            title: Text('Camera'),
                            onTap: () {
                              Navigator.pop(context);
                              _pickImages(ImageSource.camera);
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              FluentIcons.image_24_regular,
                              color: Colors.black,
                            ),
                            title: Text('Gallery'),
                            onTap: () {
                              Navigator.pop(context);
                              _pickImageFromGallery();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                  Text(
                    'Tambah Bukti',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                side: BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
                foregroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 16),
            ButtonPrimary(
              color: bluePrimaryMain,
              mainButtonMessage: 'Upload Bukti',
              mainButton: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertConfirmCreateKunjungan(
                      totalDistance: '5,4',
                      totalDuration: "12 Menit 14 Detik",
                    );
                  },
                );
                // for (var image in _images) {
                //   logger.i(image.path);
                // }
              },
            )
          ],
        ),
      ),
    );
  }
}
