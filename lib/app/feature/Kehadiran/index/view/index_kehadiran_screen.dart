import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/theme/shadow.dart';
import '../../../../../route/route_name.dart';
import '../../../../view/widget/daftar_kehadiran_items_widget.dart';
import 'model/list_kehadiran_model.dart';

class IndexKehadiranScreen extends StatelessWidget {
  const IndexKehadiranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const IndexKehadiranScreenView();
  }
}

class IndexKehadiranScreenView extends StatefulWidget {
  const IndexKehadiranScreenView({super.key});

  @override
  State<IndexKehadiranScreenView> createState() =>
      _IndexKehadiranScreenViewState();
}

class _IndexKehadiranScreenViewState extends State<IndexKehadiranScreenView> {
  List<ListKehadiranItemModel> listKehadiran = [
    ListKehadiranItemModel(
        durasi: '4 Jam 10 Menit',
        lokasiPosyandu: 'Posyandu Melati 4',
        status: 'Sedang Berjalan',
        tanggal: '21 Januari 2025'),
    ListKehadiranItemModel(
      durasi: '4 Jam 11 Menit',
      lokasiPosyandu: 'Posyandu Melati 4',
      status: 'Sedang Berjalan',
      tanggal: '15 Januari 2025',
    ),
    ListKehadiranItemModel(
      durasi: '4 Jam 21 Menit',
      lokasiPosyandu: 'Posyandu Melati 4',
      status: 'Selesai',
      tanggal: '10 Januari 2025',
    ),
    ListKehadiranItemModel(
      durasi: '4 Jam 53 Menit',
      lokasiPosyandu: 'Posyandu Melati 4',
      status: 'Selesai',
      tanggal: '4 Januari 2025',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listKehadiran.length,
      itemBuilder: (context, index) {
        ListKehadiranItemModel kehadiran = listKehadiran[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: shadowSm,
          ),
          child: DaftarKehadiranItems(
            onTap: () {
              Navigator.pushNamed(context, DETAIL_KEHADIRAN);
            },
            location: kehadiran.lokasiPosyandu,
            date: kehadiran.tanggal,
            duration: kehadiran.durasi,
            status: kehadiran.status,
          ),
        );
      },
    );
  }
}
