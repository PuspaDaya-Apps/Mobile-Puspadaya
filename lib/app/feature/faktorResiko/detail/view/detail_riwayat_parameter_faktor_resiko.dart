import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import '../../../../../config/theme/pallet_color.dart';
import '../model/get_detail_riwayat_faktor_resiko_model.dart'
    as GetDetailRiwayatFaktorResiko;

class DetailRiwayatParameterFaktorResiko extends StatefulWidget {
  final GetDetailRiwayatFaktorResiko.FaktorResiko data;
  const DetailRiwayatParameterFaktorResiko({super.key, required this.data});

  @override
  State<DetailRiwayatParameterFaktorResiko> createState() =>
      _DetailRiwayatParameterFaktorResikoState();
}

class _DetailRiwayatParameterFaktorResikoState
    extends State<DetailRiwayatParameterFaktorResiko> {
  late PageController _pageController;
  bool isMultiplePertanyaan = false;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController();
    isMultiplePertanyaan = widget.data.pertanyaan.length > 1;
    super.initState();
  }

  void _navigateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: widget.data.namaFaktorResiko,
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      bottomNavigationBar: isMultiplePertanyaan
          ? Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Row(
                spacing: _currentPage > 0 ? 12 : 0,
                children: [
                  _currentPage > 0
                      ? Expanded(
                          child: ButtonPrimary(
                            color: bluePrimaryMain,
                            mainButtonMessage: 'Sebelumnya',
                            mainButton: () {
                              _navigateToPage(_currentPage - 1);
                            },
                          ),
                        )
                      : SizedBox.shrink(),
                  Expanded(
                    child: ButtonPrimary(
                      color: greenPrimaryMain,
                      mainButtonMessage: _currentPage ==
                              widget.data.pertanyaan.length - 1
                          ? 'Selesai'
                          : 'Selanjutnya',
                      mainButton: () {
                        if (_currentPage < widget.data.pertanyaan.length - 1) {
                          _navigateToPage(_currentPage + 1);
                        } else {
                          // Tambahkan logika untuk tombol Selesai jika diperlukan
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          : null,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: widget.data.pertanyaan.length == 1
            ? SingleChildScrollView(
                child: _buildSingleQuestion(0),
              )
            : PageView.builder(
                itemCount: widget.data.pertanyaan.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return _buildSingleQuestion(index);
                },
              ),
      ),
    );
  }

  Widget _buildSingleQuestion(int index) {
    final pertanyaan = widget.data.pertanyaan[index];
    final isSelected = (jawaban) => pertanyaan.jawaban.any(
        (jwb) => jwb.pilihanPertanyaan.id == jawaban.id);

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul Pertanyaan
            Text(
              pertanyaan.namaPertanyaan,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),

            // Gambar Pertanyaan
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.data.gambar,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            SizedBox(height: 14),
            Text(
              'Jawaban Anda :',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),
            // List Jawaban
            Column(
              children: pertanyaan.pilihanPertanyaan.map(
                (jawaban) {
                  final isSelected = pertanyaan.jawaban.any(
                      (jwb) => jwb.pilihanPertanyaan.id == jawaban.id);

                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? greenPrimaryMain : Colors.grey,
                        width: 1.5,
                      ),
                      color: isSelected
                          ? greenPrimaryMain.withOpacity(0.2)
                          : Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          jawaban.namaPilihan,
                          style: TextStyle(
                            fontSize: 16,
                            color: isSelected ? greenPrimaryMain : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
            if (pertanyaan.jawaban.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  pertanyaan.jawaban.firstWhere((element) =>
                      element.pilihanPertanyaan.id ==
                      pertanyaan.jawaban[0].pilihanPertanyaan.id)
                      .jawabanText ??
                      '',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}