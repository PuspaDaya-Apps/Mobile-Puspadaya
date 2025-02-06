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
        title: 'Detail Alat Ukur',
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
                  height: MediaQuery.sizeOf(context).height/2, // Set a height that fits your design
                  child: DataTable2(
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 600,
                    columns: const [
                      DataColumn2(
                        label: Text('Day'),
                        numeric: true,
                      ),
                      DataColumn2(
                        label: Text('L'),
                        numeric: true,
                      ),
                      DataColumn2(
                        label: Text('M'),
                        numeric: true,
                      ),
                      DataColumn2(
                        label: Text('S'),
                        numeric: true,
                      ),
                      DataColumn2(
                        label: Text('SD4neg'),
                        numeric: true,
                      ),
                      DataColumn2(
                        label: Text('SD3neg'),
                        numeric: true,
                      ),
                      DataColumn2(
                        label: Text('SD2neg'),
                        numeric: true,
                      ),
                      DataColumn2(
                        label: Text('SD1neg'),
                        numeric: true,
                      ),
                      DataColumn2(
                        label: Text('SD0'),
                        numeric: true,
                      ),
                      DataColumn2(
                        label: Text('SD1'),
                        numeric: true,
                      ),
                      DataColumn2(
                        label: Text('SD2'),
                        numeric: true,
                      ),
                      DataColumn2(
                        label: Text('SD3'),
                        numeric: true,
                      ),
                      DataColumn2(
                        label: Text('SD4'),
                        numeric: true,
                      ),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('0')),
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
                      DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('1')),
                        DataCell(Text('50,0601')),
                        DataCell(Text('0,03785')),
                        DataCell(Text('42,481')),
                        DataCell(Text('44,376')),
                        DataCell(Text('46,271')),
                        DataCell(Text('48,165')),
                        DataCell(Text('50,06')),
                        DataCell(Text('51,955')),
                        DataCell(Text('53,85')),
                        DataCell(Text('55,744')),
                        DataCell(Text('57,639')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('2')),
                        DataCell(Text('1')),
                        DataCell(Text('50,2359')),
                        DataCell(Text('0,03775')),
                        DataCell(Text('42,65')),
                        DataCell(Text('44,547')),
                        DataCell(Text('46,443')),
                        DataCell(Text('48,339')),
                        DataCell(Text('50,236')),
                        DataCell(Text('52,132')),
                        DataCell(Text('54,029')),
                        DataCell(Text('55,925')),
                        DataCell(Text('57,822')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('3')),
                        DataCell(Text('1')),
                        DataCell(Text('50,4118')),
                        DataCell(Text('0,03764')),
                        DataCell(Text('42,822')),
                        DataCell(Text('44,719')),
                        DataCell(Text('46,617')),
                        DataCell(Text('48,514')),
                        DataCell(Text('50,412')),
                        DataCell(Text('52,309')),
                        DataCell(Text('54,207')),
                        DataCell(Text('56,104')),
                        DataCell(Text('58,002')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('4')),
                        DataCell(Text('1')),
                        DataCell(Text('50,5876')),
                        DataCell(Text('0,03754')),
                        DataCell(Text('42,991')),
                        DataCell(Text('44,89')),
                        DataCell(Text('46,789')),
                        DataCell(Text('48,689')),
                        DataCell(Text('50,588')),
                        DataCell(Text('52,487')),
                        DataCell(Text('54,386')),
                        DataCell(Text('56,285')),
                        DataCell(Text('58,184')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('5')),
                        DataCell(Text('1')),
                        DataCell(Text('50,7635')),
                        DataCell(Text('0,03744')),
                        DataCell(Text('43,161')),
                        DataCell(Text('45,062')),
                        DataCell(Text('46,962')),
                        DataCell(Text('48,863')),
                        DataCell(Text('50,764')),
                        DataCell(Text('52,664')),
                        DataCell(Text('54,565')),
                        DataCell(Text('56,465')),
                        DataCell(Text('58,366')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('6')),
                        DataCell(Text('1')),
                        DataCell(Text('50,9393')),
                        DataCell(Text('0,03734')),
                        DataCell(Text('43,331')),
                        DataCell(Text('45,233')),
                        DataCell(Text('47,135')),
                        DataCell(Text('49,037')),
                        DataCell(Text('50,939')),
                        DataCell(Text('52,841')),
                        DataCell(Text('54,743')),
                        DataCell(Text('56,646')),
                        DataCell(Text('58,548')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('7')),
                        DataCell(Text('1')),
                        DataCell(Text('51,1152')),
                        DataCell(Text('0,03723')),
                        DataCell(Text('43,503')),
                        DataCell(Text('45,406')),
                        DataCell(Text('47,309')),
                        DataCell(Text('49,212')),
                        DataCell(Text('51,115')),
                        DataCell(Text('53,018')),
                        DataCell(Text('54,921')),
                        DataCell(Text('56,824')),
                        DataCell(Text('58,727')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('8')),
                        DataCell(Text('1')),
                        DataCell(Text('51,291')),
                        DataCell(Text('0,03713')),
                        DataCell(Text('43,673')),
                        DataCell(Text('45,578')),
                        DataCell(Text('47,482')),
                        DataCell(Text('49,387')),
                        DataCell(Text('51,291')),
                        DataCell(Text('53,195')),
                        DataCell(Text('55,1')),
                        DataCell(Text('57,004')),
                        DataCell(Text('58,909')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('9')),
                        DataCell(Text('1')),
                        DataCell(Text('51,4669')),
                        DataCell(Text('0,03703')),
                        DataCell(Text('43,844')),
                        DataCell(Text('45,749')),
                        DataCell(Text('47,655')),
                        DataCell(Text('49,561')),
                        DataCell(Text('51,467')),
                        DataCell(Text('53,373')),
                        DataCell(Text('55,279')),
                        DataCell(Text('57,184')),
                        DataCell(Text('59,09')),
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
