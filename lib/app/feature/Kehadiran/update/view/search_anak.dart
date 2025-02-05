import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puspadaya/app/feature/Kehadiran/model/list_data_anak_model.dart';
import 'package:puspadaya/app/feature/Kehadiran/model/list_data_anak_model.dart';
import 'package:puspadaya/app/feature/Kehadiran/model/list_data_anak_model.dart';
import 'package:puspadaya/app/feature/Kehadiran/model/list_data_anak_model.dart';
import 'package:puspadaya/app/feature/Kehadiran/model/list_data_anak_model.dart';
import 'package:puspadaya/app/feature/Kehadiran/model/list_data_anak_model.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';

import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/theme/text_style.dart';
import '../../model/list_data_tamu_model.dart';

class SearchAnak extends StatelessWidget {
  const SearchAnak({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchAnakView();
  }
}

class SearchAnakView extends StatefulWidget {
  const SearchAnakView({super.key});

  @override
  State<SearchAnakView> createState() => _SearchAnakViewState();
}

class _SearchAnakViewState extends State<SearchAnakView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController
        .dispose(); // Pastikan controller dibuang setelah tidak digunakan
    super.dispose();
  }

  final List<ListDataAnakModel> dataPosyandu = [
    ListDataAnakModel(
      nik: '362155428233263',
      namaIbu: 'Aisyah Zahra Putri',
      nama: 'Muhammad Kaivan Al Hakim',
    ),
    ListDataAnakModel(
      nik: '362155428233263',
      namaIbu: 'Aisyah Zahra Putri',
      nama: 'Muhammad Kaivan Al Hakim',
    ),
    ListDataAnakModel(
      nik: '362155428233263',
      namaIbu: 'Aisyah Zahra Putri',
      nama: 'Muhammad Kaivan Al Hakim',
    ),
    ListDataAnakModel(
      nik: '362155428233263',
      namaIbu: 'Aisyah Zahra Putri',
      nama: 'Muhammad Kaivan Al Hakim',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Pilih Anak',
        background: Colors.white,
        onBackPressed: (){
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: dataPosyandu.length,
          itemBuilder: (context, index) {
            ListDataAnakModel dataPosyanduItem = dataPosyandu[index];
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
              child: Card(
                color: Colors.white,
                shadowColor: Colors.black.withOpacity(0.1),
                // Bayangan lebih soft
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                child: ListTile(
                  onTap: () {
                  },
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: bluePrimary50,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dataPosyanduItem.nama,
                              style: AppTextStyles.primaryTextMedium.copyWith(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),

                            Text(
                              dataPosyanduItem.nik!,
                              style: AppTextStyles.primaryTextMedium.copyWith(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4), // Jarak antar teks
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Nama Ibu: ",
                              style: AppTextStyles.primaryTextNormal.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            TextSpan(
                              text: dataPosyanduItem.namaIbu!,
                              style: AppTextStyles.primaryTextNormal.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: bluePrimary50,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
