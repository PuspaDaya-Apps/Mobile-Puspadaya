import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/utils/download_utils/download_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../utils/api_utils/api_utils.dart';
import '../../../../utils/constant/constanst.dart';
import '../../../../utils/logger/logger.dart';
import '../../../view/widget/dropdown_widget.dart'; // Assuming you have this file
import 'package:data_table_2/data_table_2.dart';

import '../cubit/parameter_gizi_cubit.dart';

class ParameterGizi extends StatelessWidget {
  const ParameterGizi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ParameterGiziCubit(),
      child: ParameterGiziView(),
    );
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

  // Store selected data here>
  String? selectedJenisKelamin;
  String? selectedSatuan;
  void _downloadParameterGizi(BuildContext context, String url,String filename) async {
    
    
  }

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
                              // Trigger loading if both selections are made
                              if (selectedSatuan != null) {
                                context.read<ParameterGiziCubit>().selectGender(
                                    selectedJenisKelamin!, selectedSatuan!);
                              }
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
                              // Trigger loading if both selections are made
                              if (selectedJenisKelamin != null) {
                                context.read<ParameterGiziCubit>().selectGender(
                                    selectedJenisKelamin!, selectedSatuan!);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    '${selectedSatuan ?? ' '} ${selectedSatuan == 'Tinggi Badan' ? '(Cm)' : selectedSatuan == 'Berat Badan' ? '(Kg)' : 'Silahkan Pilih Satuan'}',
                  ),
                ),
                SizedBox(height: 16),
                if (selectedJenisKelamin != null && selectedSatuan != null)
                  ButtonPrimary(
                      color: greenPrimaryMain,
                      mainButtonMessage: 'Download',
                      mainButton: () async {
                        if (selectedJenisKelamin == 'Laki-Laki' &&
                            selectedSatuan == 'Tinggi Badan') {
                          logger.d("download tinggi laki laki");
                          DownloadUtils().downloadAndSaveFile(context, ApiUtils()
                                  .urlGetParameterGiziLakiLakiTinggiBadan(), 'Parameter Gizi Laki Laki TInggi Badan.xlsx');
                        } else if (selectedJenisKelamin == 'Laki-Laki' &&
                            selectedSatuan == 'Berat Badan') {
                          logger.d("download berat laki laki");
                          DownloadUtils().downloadAndSaveFile(context, ApiUtils()
                                  .urlGetParameterGiziLakiLakiBeratBadan(), 'Parameter Gizi Laki Laki Berat Badan.xlsx');
                        } else if (selectedJenisKelamin == 'Perempuan' &&
                            selectedSatuan == 'Tinggi Badan') {
                          logger.d("download tinggi perempuan");
                          DownloadUtils().downloadAndSaveFile(context, ApiUtils()
                                  .urlGetParameterGiziPerempuanTinggiBadan(), 'Parameter Gizi Perempuan Tinggi Badan.xlsx');
                        } else if (selectedJenisKelamin == 'Perempuan' &&
                            selectedSatuan == 'Berat Badan') {
                          logger.d("download berat perempuan");
                          DownloadUtils().downloadAndSaveFile(context, ApiUtils()
                                  .urlGetParameterGiziPerempuanBeratBadan(), 'Parameter Gizi Perempuan Berat Badan.xlsx');
                        }
                      }),
                SizedBox(height: 16),
                // Conditional rendering of the DataTable
                if (selectedJenisKelamin != null && selectedSatuan != null)
                  BlocBuilder<ParameterGiziCubit, ParameterGiziState>(
                    builder: (context, state) {
                      if (state is ParameterGiziLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is ParameterGiziLoaded) {
                        return Container(
                          height: MediaQuery.sizeOf(context).height / 1.68,
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
                            rows: state.data.data.map<DataRow>((item) {
                              return DataRow(cells: [
                                DataCell(Text(item.day.toString())),
                                DataCell(Text(item.l.toString())),
                                DataCell(Text(item.m.toString())),
                                DataCell(Text(item.s.toString())),
                                DataCell(Text(item.sd4Neg.toString())),
                                DataCell(Text(item.sd3Neg.toString())),
                                DataCell(Text(item.sd2Neg.toString())),
                                DataCell(Text(item.sd1Neg.toString())),
                                DataCell(Text(item.sd0.toString())),
                                DataCell(Text(item.sd1.toString())),
                                DataCell(Text(item.sd2.toString())),
                                DataCell(Text(item.sd3.toString())),
                                DataCell(Text(item.sd4.toString())),
                              ]);
                            }).toList(),
                          ),
                        );
                      } else if (state is ParameterGiziError) {
                        return Center(
                          child: Text('Error loading data: ${state.message}'),
                        );
                      }
                      return Container(); // Return an empty container if no state matches
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
