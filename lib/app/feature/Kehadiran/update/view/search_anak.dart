import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/Kehadiran/model/list_data_anak_model.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';

import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/theme/text_style.dart';
import '../../../../view/widget/search_text_field_widget.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _searchController
        .dispose(); // Pastikan controller dibuang setelah tidak digunakan
    super.dispose();
  }

  final List<ListDataAnakModel> dataPosyandu = [
    ListDataAnakModel(
        nik: '362155423033263',
        namaIbu: 'Diana Novitasari S.Pt',
        nama: 'Eka Nasyidah'),
    ListDataAnakModel(
        nik: '362155428231364',
        namaIbu: 'Yani Haryanti M.Pd',
        nama: 'Vivi Purwanti'),
    ListDataAnakModel(
        nik: '362155428003265',
        namaIbu: 'Ulya Lestari',
        nama: 'Wira Tampubolon'),
    ListDataAnakModel(
        nik: '362155420123266',
        namaIbu: 'Fitriani Wulandari S.Pd',
        nama: 'Olivia Novitasari'),
    ListDataAnakModel(
        nik: '3621554280003267',
        namaIbu: 'Zamira Wulandari',
        nama: 'Widya Namaga'),
    ListDataAnakModel(
        nik: '362155421123268',
        namaIbu: 'Salsabila Maryati',
        nama: 'Padmi Yuliarti'),
    ListDataAnakModel(
        nik: '362155428969269',
        namaIbu: 'Paramita Pratiwi',
        nama: 'Kiandra Hariyah'),
    ListDataAnakModel(
        nik: '362155420103270',
        namaIbu: 'Dalima Rahmawati',
        nama: 'Cemani Firmansyah'),
    ListDataAnakModel(
        nik: '362155428112271',
        namaIbu: 'Yunita Wulandari',
        nama: 'Jamalia Hassanah'),
    ListDataAnakModel(
        nik: '362155421413272',
        namaIbu: 'Raisa Ani Melani S.Sos',
        nama: 'Rafi Utama'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.05),
          child: Container(
            // color: Colors.red,
            padding:
                const EdgeInsets.only(left: 16.0, right: 16, top: 0, bottom: 8),
            child: SearchTextFieldWidget(
              hintText: 'Cari Anak',
              controller: _searchController,
            ),
          ),
        ),
        title: Text(
          'Pilih Anak',
          style: AppTextStyles.primaryTextSemibold.copyWith(
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                    // logger.d(dataSelected.nama);
                    Navigator.pop(context, dataPosyanduItem.nama);
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
                              text: dataPosyanduItem.namaIbu,
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
