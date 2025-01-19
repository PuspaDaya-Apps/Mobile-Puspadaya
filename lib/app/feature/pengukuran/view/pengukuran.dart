import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/daftar_kehadiran_items_widget.dart';
import 'package:puspadaya/app/view/widget/dropdown_widget.dart';
import 'package:puspadaya/app/view/widget/pengukuran_balita_items_widget.dart';
import 'package:puspadaya/app/view/widget/pengukuran_ibu_hamil_items_widget.dart';
import 'package:puspadaya/app/view/widget/pengukuran_tamu_items_widget.dart';
import 'package:puspadaya/app/view/widget/riwayat_balita_items_widget.dart';
import 'package:puspadaya/app/view/widget/riwayat_ibu_hamil_items_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/shadow.dart';
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
    'Pengukuran Balita',
    'Pengukuran Ibu Hamil',
    'Pengukuran Tamu',
    'Riwayat Balita',
    'Riwayat Ibu Hamil'
  ];
  String selectedMenu = "Kehadiran";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "Pengukuran",
        actions: [],
        onBackPressed: null,
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
            case 'kehadiran':
              Navigator.pushNamed(context, CREATE_KEHADIRAN);
              break;
            case 'Pengukuran Balita':
              Navigator.pushNamed(context, CREATE_PENGUKURAN_BALITA);
              break;
            case 'Pengukuran Ibu Hamil':
              Navigator.pushNamed(context, CREATE_PENGUKURAN_IBU_HAMIL);
              break;
            case 'Pengukuran Tamu':
              Navigator.pushNamed(context, CREATE_PENGUKURAN_TAMU);
              break;
            default:
          }

          // Navigator.pushNamed(context, '/createJadwal');
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
                  });
                },
                items: pengukuranMenu,
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.builder(
                  // shrinkWrap: true, // Mengatur batasan tinggi pada ListView
                  // physics:
                  //     NeverScrollableScrollPhysics(), // Menghindari scrolling dalam nested ListView
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow:
                            boxShadow(), // Use the desired box shadow function
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
      case 'Pengukuran Balita':
        return PengukuranBalitaItems(
          onTap: () {
            Navigator.pushNamed(context, DETAIL_PENGUKURAN_BALITA);
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
      case 'Riwayat Balita':
        return RiwayatBalitaItems(
          onTap: () {
            Navigator.pushNamed(context, DETAIL_RIWAYAT_BALITA);
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
