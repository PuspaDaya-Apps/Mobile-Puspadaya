import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';

class DetailDataKIA extends StatelessWidget {
  const DetailDataKIA({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Image(
              image: AssetImage(imageGrafikPerkembanganAnak),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: Colors.black54,
          ),
          SizedBox(
            height: 16,
          ),
          Text('Riwayat Pengukuran'),
          RiwayatPengukuranDataKIA(),
        ],
      ),
    );
  }
}

class RiwayatPengukuranDataKIA extends StatelessWidget {
  const RiwayatPengukuranDataKIA({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 1.68,
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 960,
        columns: [
          DataColumn2(
            size: ColumnSize.S,
            fixedWidth: 32,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('No'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.L,
            fixedWidth: 100,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Tanggal'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.S,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('BB(Kg)'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.S,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('TB(cm)'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.S,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Lila(cm)'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.S,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('TP(cm)'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.L,
            fixedWidth: 200,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Petugas'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.M,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Stunting'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.M,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Under weight'),
            ),
            numeric: true,
          ),
          DataColumn2(
            size: ColumnSize.M,
            label: Align(
              alignment: Alignment.centerLeft,
              child: Text('Wasting'),
            ),
            numeric: true,
          ),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('1'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('2024-11-24'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('30'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('95'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('15'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('28'))),
            DataCell(Align(
                alignment: Alignment.centerLeft,
                child: Text('Betania Lailasari'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('normal'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Gizi Kurang'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('kurus'))),
          ]),
          DataRow(cells: [
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('2'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('2024-11-20'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('28'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('92'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('14'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('27'))),
            DataCell(Align(
                alignment: Alignment.centerLeft,
                child: Text('Latika Yuliarti'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('Pendek'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Gizi Buruk'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('sangat kurus'))),
          ]),
          DataRow(cells: [
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('3'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('2024-11-15'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('29'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('92'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('13'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('25'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Umi Laksita'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('Pendek'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Gizi Kurang'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('sangat kurus'))),
          ]),
          DataRow(cells: [
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('4'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('2024-11-10'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('26'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('90'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('13'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('24'))),
            DataCell(Align(
                alignment: Alignment.centerLeft,
                child: Text('Fitria Purnawati'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Sangat Pendek'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Gizi Buruk'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('kurus'))),
          ]),
          DataRow(cells: [
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('5'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('2024-11-05'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('31'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('97'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('15'))),
            DataCell(Align(alignment: Alignment.centerLeft, child: Text('29'))),
            DataCell(Align(
                alignment: Alignment.centerLeft,
                child: Text('Alika Yulianti'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Sangat Pendek'))),
            DataCell(Align(
                alignment: Alignment.centerLeft, child: Text('Gizi Kurang'))),
            DataCell(
                Align(alignment: Alignment.centerLeft, child: Text('kurus'))),
          ]),
        ],
      ),
    );
  }
}
