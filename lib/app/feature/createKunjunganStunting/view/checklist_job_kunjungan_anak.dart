import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../../view/widget/checkbox_list_widget.dart';
import 'model/CheckBoxKunjungan.dart';

class ChecklistJobKunjunganAnak extends StatefulWidget {
  const ChecklistJobKunjunganAnak({super.key});

  @override
  State<ChecklistJobKunjunganAnak> createState() =>
      _ChecklistJobKunjunganAnakState();
}

class _ChecklistJobKunjunganAnakState extends State<ChecklistJobKunjunganAnak> {
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
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
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 4,
              width: double.infinity,
              color: Colors.grey[200],
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: _progressValues[_currentPage],
                child: Container(
                  color: bluePrimaryMain,
                ),
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
            CheckListJobKunjunganAnakView(
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

class CheckListJobKunjunganAnakView extends StatelessWidget {
  final VoidCallback goToNext;
  List<CheckboxKunjungan> listOfCheckbox = [
    CheckboxKunjungan(
        isChecked: false, label: 'Pemberian Makanan Tambahan (PMT)')
  ];
  CheckListJobKunjunganAnakView({super.key, required this.goToNext});

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
          CheckboxListWidget(
            isChecked: false,
            label: 'test',
            onChanged: (bool? value) {},
          ),
          const SizedBox(height: 20),
          ButtonPrimary(
            color: bluePrimaryMain,
            mainButtonMessage: 'Simpan',
            mainButton: goToNext,
          ),
        ],
      ),
    );
  }
}

class UploadImage extends StatelessWidget {
  const UploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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
              'Upload Bukti Kunjungan',
              style: AppTextStyles.primaryTextMedium.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Icon(
                Icons.cloud_upload,
                size: 80,
                color: bluePrimaryMain,
              ),
            ),
            const SizedBox(height: 20),
            ButtonPrimary(
              color: bluePrimaryMain,
              mainButtonMessage: 'Upload',
              mainButton: () {
                // Logika untuk upload
              },
            ),
          ],
        ),
      ),
    );
  }
}
