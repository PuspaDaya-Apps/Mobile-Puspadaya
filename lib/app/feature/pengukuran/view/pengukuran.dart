import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/daftar_kehadiran_items_widget.dart';
import 'package:puspadaya/app/view/widget/dropdown_widget.dart';
import 'package:puspadaya/app/view/widget/pengukuran_anak_items_widget.dart';
import 'package:puspadaya/app/view/widget/pengukuran_ibu_hamil_items_widget.dart';
import 'package:puspadaya/app/view/widget/pengukuran_tamu_items_widget.dart';
import 'package:puspadaya/app/view/widget/riwayat_anak_items_widget.dart';
import 'package:puspadaya/app/view/widget/riwayat_ibu_hamil_items_widget.dart';
import 'package:puspadaya/app/view/widget/search_text_field_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/shadow.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/route/route_name.dart';

class Pengukuran extends StatelessWidget {
  const Pengukuran({super.key});

  @override
  Widget build(BuildContext context) {
    return PengukuranView();
  }
}

class PengukuranView extends StatefulWidget {
  const PengukuranView({super.key});

  @override
  State<PengukuranView> createState() => _PengukuranViewState();
}

class _PengukuranViewState extends State<PengukuranView> {
  final List<String> pengukuranMenu = [
    'Kehadiran',
    'Pengukuran Anak',
    'Pengukuran Ibu Hamil',
    'Pengukuran Tamu',
    'Riwayat Anak',
    'Riwayat Ibu Hamil'
  ];
  String selectedMenu = "Kehadiran";
  bool isSearching = false; // State variable to manage search bar visibility
  TextEditingController searchController =
      TextEditingController(); // Controller for the search bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: AppBar(
        backgroundColor: backgroundWhite10,
        title: isSearching
            ? AnimatedContainer(
                duration: Duration(milliseconds: 300), // Animation duration
                curve: Curves.easeInOut, // Animation curve
                width: isSearching
                    ? double.infinity
                    : 0, // Width changes based on search state
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.sizeOf(context).width / 48),
                  child: SearchTextFieldWidget(
                    controller: searchController,
                    hintText: 'Cari Data',
                  ),
                ),
              )
            : AnimatedOpacity(
                opacity: isSearching ? 0 : 1, // Fade out when searching
                duration: Duration(milliseconds: 300), // Animation duration
                curve: Curves.easeInOut, // Animation curve
                child: Text(
                  'Pengukuran',
                  style: AppTextStyles.primaryTextSemibold.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
        actions: _buildAppBarActions(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: bluePrimary40,
        shape: CircleBorder(),
        child: Icon(
          size: 38,
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          switch (selectedMenu) {
            case 'Kehadiran':
              Navigator.pushNamed(context, CREATE_KEHADIRAN);
              break;
            case 'Pengukuran Anak':
              Navigator.pushNamed(context, CREATE_PENGUKURAN_ANAK);
              break;
            case 'Pengukuran Ibu Hamil':
              Navigator.pushNamed(context, CREATE_PENGUKURAN_IBU_HAMIL);
              break;
            case 'Pengukuran Tamu':
              Navigator.pushNamed(context, CREATE_PENGUKURAN_TAMU);
              break;
            default:
          }
        },
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 24, right: 24, top: 16),
          child: Column(
            children: [
              DropdownWidget(
                hint: "Pilih Pengukuran",
                value: selectedMenu,
                onChanged: (value) {
                  setState(() {
                    selectedMenu = value;
                    isSearching = false; // Reset search state when menu changes
                  });
                },
                items: pengukuranMenu,
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: boxShadow(),
                      ),
                      child: _buildListItem(),
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

  List<Widget> _buildAppBarActions() {
    if (selectedMenu != 'Kehadiran') {
      return [
        Container(
          margin: EdgeInsets.only(right: 24),
          child: GestureDetector(
            onTap: () {
              setState(() {
                isSearching = !isSearching; // Toggle search bar visibility
                if (!isSearching) {
                  searchController.clear(); // Clear search input when closing
                }
              });
            },
            child: Icon(
              isSearching ? Icons.close : Icons.search,
            ),
          ),
        ),
      ];
    }
    return [];
  }

  Widget _buildListItem() {
    switch (selectedMenu) {
      case 'Kehadiran':
        return DaftarKehadiranItems(
          onTap: () {
            Navigator.pushNamed(context, DETAIL_KEHADIRAN);
          },
          location: "Posyandu A",
          date: "08/10/2024",
          duration: "5 jam 25 menit",
          status: "Sedang Berjalan",
        );
      case 'Pengukuran Anak':
        return PengukuranAnakItems(
          onTap: () {
            Navigator.pushNamed(context, DETAIL_PENGUKURAN_ANAK);
          },
          name: "Muhammad Kaivan Al Hakim",
          nik: "362155482327263",
          date: "08/10/2024",
          place: "Posyandu A",
        );
      case 'Pengukuran Ibu Hamil':
        return PengukuranIbuHamilItems(
          onTap: () {
            Navigator.pushNamed(context, DETAIL_PENGUKURAN_IBU_HAMIL);
          },
          name: "Siti Aminah",
          nik: "362155482327264",
          date: "08/10/2024",
        );
      case 'Pengukuran Tamu':
        return PengukuranTamuItems(
          onTap: () {
            Navigator.pushNamed(context, DETAIL_PENGUKURAN_TAMU);
          },
          name: "Ahmad Tamu",
          nik: "362155482327265",
          date: "08/10/2024",
          place: "Posyandu B",
        );
      case 'Riwayat Anak':
        return RiwayatAnakItems(
          onTap: () {
            Navigator.pushNamed(context, DETAIL_RIWAYAT_ANAK);
          },
          name: "Muhammad Kaivan Al Hakim",
          nik: "362155482327263",
          gender: 'Laki-Laki',
        );
      case 'Riwayat Ibu Hamil':
        return RiwayatIbuHamilItems(
          onTap: () {
            Navigator.pushNamed(context, DETAIL_RIWAYAT_IBU_HAMIL);
          },
          name: "Siti Aminah",
          nik: "362155482327264",
          gestationalAge: "6 bulan",
        );
      default:
        return Container();
    }
  }
}
