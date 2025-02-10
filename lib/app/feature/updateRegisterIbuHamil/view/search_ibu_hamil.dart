import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/pallet_color.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/card_tambah_ibu_hamil_widget.dart';
import '../../../view/widget/search_text_field_widget.dart';
import 'model/ibu_hamil_item_model.dart';

class SearchIbuHamil extends StatelessWidget {
  const SearchIbuHamil({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchIbuHamilView();
  }
}

class SearchIbuHamilView extends StatefulWidget {
  const SearchIbuHamilView({super.key});

  @override
  State<SearchIbuHamilView> createState() => _SearchIbuHamilViewState();
}

class _SearchIbuHamilViewState extends State<SearchIbuHamilView> {
  TextEditingController _searchController = TextEditingController();
  List<IbuHamilItemModel> listIbuHamil = [
    /**
     * Kania Lailasari
Cinta Hartati
Julia Haryanti
Restu Hasanah
Salsabila Pertiwi
Oni Maryati
Jamalia Pia Wahyuni
Ella Hasanah
Rahmi Uyainah
Faizah Prastuti

     */
    IbuHamilItemModel(
      nama: 'Kania Lailasari',
      namaSuami: 'Nrima Prasetya',
      nik: '8081328761302945',
      usia: '28',
    ),
    IbuHamilItemModel(
      nama: 'Cinta Hartati',
      namaSuami: 'Banawa Budiyanto',
      nik: '80813200915882913',
      usia: '28',
    ),
    IbuHamilItemModel(
      nama: 'Restu Hasanah',
      namaSuami: 'Lega Siregar',
      nik: '8081320068131923',
      usia: '28',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Pilih Ibu Hamil',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SearchTextFieldWidget(
                      controller: _searchController,
                      hintText: 'Cari Data Ibu Hamil',
                    ),
                  ),
                  const SizedBox(width: 10), // Use SizedBox for spacing
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      size: 30,
                      FluentIcons.filter_24_filled,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: listIbuHamil.length, // Use listIbuHamil
                  itemBuilder: (context, index) {
                    IbuHamilItemModel ibuHamil =
                        listIbuHamil[index]; // Access the list correctly
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CardTambahIbuHamil(
                        nama: ibuHamil.nama,
                        namaSuami: ibuHamil.namaSuami,
                        nik: ibuHamil.nik,
                        onTap: () {
                          Navigator.pop(context, ibuHamil);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
