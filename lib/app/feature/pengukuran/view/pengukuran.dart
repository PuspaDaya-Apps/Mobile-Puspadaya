import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/dropdown_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../Kehadiran/index/view/index_kehadiran_screen.dart';
import '../../PengukuranTamu/index/view/index_pengukuran_tamu_screen.dart';
import '../../RiwayatAnak/index/view/index_riwayat_anak_screen.dart';
import '../../RiwayatIbuHamil/index/view/index_riwayat_ibu_hamil_screen.dart';
import '../../pengukuranAnak/index/view/index_pengukuran_anak_screen.dart';
import '../../pengukuranIbuHamil/index/view/index_pengukuran_ibu_hamil_screen.dart';

class Pengukuran extends StatelessWidget {
  const Pengukuran({super.key});

  @override
  Widget build(BuildContext context) {
    return const PengukuranView();
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
  // bool isSearching = false; // State variable to manage search bar visibility
  TextEditingController searchController =
      TextEditingController(); // Controller for the search bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: AppBar(
        backgroundColor: backgroundWhite10,
        title: Text(
          'Pengukuran',
          style: AppTextStyles.primaryTextSemibold.copyWith(
            fontSize: 16,
          ),
        ),
        // isSearching
        //     ? AnimatedContainer(
        //         duration: const Duration(milliseconds: 300), // Animation duration
        //         curve: Curves.easeInOut, // Animation curve
        //         width: isSearching
        //             ? double.infinity
        //             : 0, // Width changes based on search state
        //         child: Padding(
        //           padding: EdgeInsets.only(
        //               left: MediaQuery.sizeOf(context).width / 48),
        //           child: SearchTextFieldWidget(
        //             controller: searchController,
        //             hintText: 'Cari Data',
        //           ),
        //         ),
        //       )
        //     :
        //     AnimatedOpacity(
        //         opacity: isSearching ? 0 : 1, // Fade out when searching
        //         duration: const Duration(milliseconds: 300), // Animation duration
        //         curve: Curves.easeInOut, // Animation curve
        //         child: Text(
        //           'Pengukuran',
        //           style: AppTextStyles.primaryTextSemibold.copyWith(
        //             fontSize: 16,
        //           ),
        //         ),
        //       ),
        // actions: _buildAppBarActions(),
      ),
      floatingActionButton: selectedMenu == 'Riwayat Anak' ||
              selectedMenu == 'Riwayat Ibu Hamil'
          ? Container()
          : FloatingActionButton(
              backgroundColor: bluePrimaryMain,
              shape: const CircleBorder(),
              child: const Icon(
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
          margin: const EdgeInsets.only(left: 24, right: 24, top: 16),
          child: Column(
            children: [
              DropdownWidget(
                hint: "Pilih Pengukuran",
                value: selectedMenu,
                onChanged: (value) {
                  setState(() {
                    selectedMenu = value;
                    // isSearching = false; // Reset search state when menu changes
                  });
                },
                items: pengukuranMenu,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: _buildListItem(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // List<Widget> _buildAppBarActions() {
  //   if (selectedMenu != 'Kehadiran') {
  //     return [
  //       Container(
  //         margin: const EdgeInsets.only(right: 24),
  //         child: GestureDetector(
  //           onTap: () {
  //             setState(() {
  //               isSearching = !isSearching; // Toggle search bar visibility
  //               if (!isSearching) {
  //                 searchController.clear(); // Clear search input when closing
  //               }
  //             });
  //           },
  //           child: Icon(
  //             isSearching ? Icons.close : Icons.search,
  //           ),
  //         ),
  //       ),
  //     ];
  //   }
  //   return [];
  // }

  Widget _buildListItem() {
    switch (selectedMenu) {
      case 'Kehadiran':
        return const IndexKehadiranScreen();
      case 'Pengukuran Anak':
        return const IndexPengukuranAnakScreen();
      case 'Pengukuran Ibu Hamil':
        return const IndexPengukuranIbuHamilScreen();
      case 'Pengukuran Tamu':
        return const IndexPengukuranTamuScreen();
      case 'Riwayat Anak':
        return const IndexRiwayatAnakScreen();
      case 'Riwayat Ibu Hamil':
        return const IndexRiwayatIbuHamilScreen();
      default:
        return Container();
    }
  }
}
