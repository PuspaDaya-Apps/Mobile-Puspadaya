import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import '../../../view/widget/dropdown_widget.dart'; // Assuming you have this file
import 'package:data_table_2/data_table_2.dart';

class ParameterGizi extends StatelessWidget {
  const ParameterGizi({super.key});

  @override
  Widget build(BuildContext context) {
    return const ParameterGiziView();
  }
}

class ParameterGiziView extends StatefulWidget {
  const ParameterGiziView({super.key});

  @override
  State<ParameterGiziView> createState() => _ParameterGiziViewState();
}

class _ParameterGiziViewState extends State<ParameterGiziView> {
  List<String> selectJenisKelamin = [
    'Laki-Laki',
    'Perempuan',
  ];
  List<String> selectSatuan = [
    'Tinggi Badan',
    'Berat Badan',
  ];
  String? selectedJenisKelamin;
  String? selectedSatuan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Parameter Gizi',
        onBackPressed: () {
          Navigator.pop(context);
        },
        background: Colors.white,
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jenis Kelamin',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: 8),
                          DropdownWidget(
                            items: selectJenisKelamin,
                            hint: 'Jenis Kelamin',
                            value: selectedJenisKelamin,
                            onChanged: (value) {
                              setState(() {
                                selectedJenisKelamin = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Satuan',
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: 8),
                          DropdownWidget(
                            items: selectSatuan,
                            hint: 'Satuan',
                            value: selectedSatuan,
                            onChanged: (value) {
                              setState(() {
                                selectedSatuan = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ButtonPrimary(
                  color: greenPrimaryMain,
                  mainButtonMessage: 'Download',
                  mainButton: () {},
                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    '${selectedSatuan ?? ' '} ${selectedSatuan == 'Tinggi Badan' ? '(Cm)' : selectedSatuan == 'Berat Badan' ? '(Kg)' : 'Silahkan Pilih Satuan'}',
                  ),
                ),
                SizedBox(height: 16),
                // Set a fixed height for the DataTable2
                Container(
                  height: MediaQuery.sizeOf(context).height /
                      2, // Set a height that fits your design
                  child: DataTable2(
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 900,
                    columns: const [
                      DataColumn2(
                        size: ColumnSize.S,
                        label: Text('Day'),
                        numeric: true,
                      ),
                      DataColumn2(
                        size: ColumnSize.S,
                        label: Text('L'),
                        numeric: true,
                      ),
                      DataColumn2(
                        size: ColumnSize.M,
                        label: Text('M'),
                        numeric: true,
                      ),
                      DataColumn2(
                        size: ColumnSize.M,
                        label: Text('S'),
                        numeric: true,
                      ),
                      DataColumn2(
                        size: ColumnSize.M,
                        label: Text('SD4neg'),
                        numeric: true,
                      ),
                      DataColumn2(
                        size: ColumnSize.M,
                        label: Text('SD3neg'),
                        numeric: true,
                      ),
                      DataColumn2(
                        size: ColumnSize.M,
                        label: Text('SD2neg'),
                        numeric: true,
                      ),
                      DataColumn2(
                        size: ColumnSize.M,
                        label: Text('SD1neg'),
                        numeric: true,
                      ),
                      DataColumn2(
                        size: ColumnSize.M,
                        label: Text('SD0'),
                        numeric: true,
                      ),
                      DataColumn2(
                        size: ColumnSize.M,
                        label: Text('SD1'),
                        numeric: true,
                      ),
                      DataColumn2(
                        size: ColumnSize.M,
                        label: Text('SD2'),
                        numeric: true,
                      ),
                      DataColumn2(
                        size: ColumnSize.M,
                        label: Text('SD3'),
                        numeric: true,
                      ),
                      DataColumn2(
                        size: ColumnSize.M,
                        label: Text('SD4'),
                        numeric: true,
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(
                          Text('0')
                        ),
                        DataCell(Text(' 1')),
                        DataCell(Text('49,8842')),
                        DataCell(Text('0,03795')),
                        DataCell(Text('42,312')),
                        DataCell(Text('44,205')),
                        DataCell(Text('46,098')),
                        DataCell(Text('47,991')),
                        DataCell(Text('49,884')),
                        DataCell(Text('51,777')),
                        DataCell(Text('53,67')),
                        DataCell(Text('55,564')),
                        DataCell(Text('57,457')),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
