import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puspadaya/app/feature/Kehadiran/create/view/search_anak.dart';
import 'package:puspadaya/app/view/widget/search_text_field_widget.dart';

import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/theme/text_style.dart';
import '../../model/list_data_tamu_model.dart';

class SearchPosyandu extends StatelessWidget {
  const SearchPosyandu({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchPosyanduView();
  }
}

class SearchPosyanduView extends StatefulWidget {
  const SearchPosyanduView({super.key});

  @override
  State<SearchPosyanduView> createState() => _SearchPosyanduViewState();
}

class _SearchPosyanduViewState extends State<SearchPosyanduView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController
        .dispose(); // Pastikan controller dibuang setelah tidak digunakan
    super.dispose();
  }

  final List<ListDataTamuModel> dataPosyandu = [
    ListDataTamuModel(
      namaPosyandu: 'Posyandu Mawar 8',
      alamat: 'Gang Paus RT 05, RW 04',
    ),
    ListDataTamuModel(
      namaPosyandu: 'Posyandu Melati 5',
      alamat: 'Jalan Kenanga No. 10',
    ),
    ListDataTamuModel(
      namaPosyandu: 'Posyandu Anggrek 2',
      alamat: 'Komplek Cempaka Blok B3',
    ),
    ListDataTamuModel(
      namaPosyandu: 'Posyandu Dahlia 4',
      alamat: 'Jalan Teratai Ujung No. 7',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: SearchTextFieldWidget(
          hintText: 'Cari Posyandu',
          controller: _searchController,
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: dataPosyandu.length,
          itemBuilder: (context, index) {
            ListDataTamuModel dataPosyanduItem = dataPosyandu[index];
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
              child: Card(
                color: Colors.white,
                shadowColor:
                    Colors.black.withOpacity(0.1), // Bayangan lebih soft
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                child: ListTile(
                  onTap: () async {
                    final selectedChild = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchAnak(),
                      ),
                    );
                    if (selectedChild != null) {
                      Navigator.pop(
                        context,
                        {
                          'nama': selectedChild,
                          'posyanduName': dataPosyanduItem.namaPosyandu,
                        },
                      );
                    }
                  },
                  leading: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: bluePrimaryMain.withValues(
                          alpha:
                              0.3), // Warna latar belakang agar lebih menarik
                      shape: BoxShape.circle, // Bentuk ikon bulat
                    ),
                    child: FaIcon(
                      size: 20,
                      FontAwesomeIcons.houseChimneyMedical,
                      color: bluePrimaryMain,
                    ),
                  ),
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
                        child: Text(
                          dataPosyanduItem.namaPosyandu!,
                          style: AppTextStyles.primaryTextMedium.copyWith(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4), // Jarak antar teks
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Alamat: ",
                              style: AppTextStyles.primaryTextNormal.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            TextSpan(
                              text: dataPosyanduItem.alamat,
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
