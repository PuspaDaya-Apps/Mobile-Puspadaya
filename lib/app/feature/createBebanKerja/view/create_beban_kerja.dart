import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/createBebanKerja/model/JobItems.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/checkbox_list_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class CreateBebanKerja extends StatelessWidget {
  const CreateBebanKerja({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateBebanKerjaView();
  }
}

class CreateBebanKerjaView extends StatefulWidget {
  const CreateBebanKerjaView({super.key});

  @override
  State<CreateBebanKerjaView> createState() => _CreateBebanKerjaViewState();
}

class _CreateBebanKerjaViewState extends State<CreateBebanKerjaView> {
  DateTime date = DateTime.now();
  List<String> month = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember"
  ];
  List<Jobitems> listOfJob = [
    Jobitems(label: 'Pendaftaran Ibu Hamil', status: false),
    Jobitems(label: 'Pendaftaran bayi dan Anak', status: false),
    Jobitems(label: 'Penimbangan dan pengukuran', status: false),
    Jobitems(label: 'Pencatatan', status: false),
    Jobitems(label: 'Pelayanan Kesehatan', status: false, subItems: [
      Jobitems(label: 'Pelayanan Kesehatan 1', status: false),
      Jobitems(label: 'Pelayanan Kesehatan 2', status: false),
    ]),
    Jobitems(label: 'Pencatatan dan pelaporan', status: false),
    Jobitems(label: 'Penyuluhan Kesehatan', status: false, subItems: [
      Jobitems(label: 'Penyuluhan Kesehatan 1', status: false),
      Jobitems(label: 'Penyuluhan Kesehatan 2', status: false),
    ]),
    Jobitems(label: 'Kunjungan Rumah', status: false, subItems: [
      Jobitems(label: 'Kunjungan Rumah 1', status: false),
      Jobitems(label: 'Kunjungan Rumah 2', status: false),
    ]),
    Jobitems(label: 'Komunikasi efektif', status: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Penilaian Mandiri',
        onBackPressed: () {
          Navigator.pop(context);
        },
        background: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                textAlign: TextAlign.start,
                'Bulan',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: SizeConfig.calHeightMultiplier(8),
              ),
              InfoFieldWidget(text: '${month[date.month - 1]} ${date.year}'),
              SizedBox(
                height: SizeConfig.calHeightMultiplier(16),
              ),
              Container(
                width: double.infinity,
                height: 2,
                color: Colors.black54,
              ),
              SizedBox(
                height: SizeConfig.calHeightMultiplier(12),
              ),
              Center(
                child: Text(
                  'Daftar Pekerjaan',
                  style: AppTextStyles.primaryTextMedium.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.calHeightMultiplier(12),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listOfJob.length,
                  itemBuilder: (context, index) {
                    return listOfJob[index].subItems != null &&
                            listOfJob[index].subItems!.isNotEmpty
                        ? ExpansionTile(
                            title: CheckboxListWidget(
                              isChecked: listOfJob[index].status,
                              label: listOfJob[index].label,
                              onChanged: (value) {
                                setState(() {
                                  listOfJob[index].status = value ?? false;
                                });
                              },
                            ),
                            children: listOfJob[index].subItems!.map((subItem) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0), // Menambahkan padding ke kiri
                                child: CheckboxListWidget(
                                  isChecked: subItem.status,
                                  label: subItem.label,
                                  onChanged: (value) {
                                    setState(() {
                                      subItem.status = value ?? false;
                                    });
                                  },
                                ),
                              );
                            }).toList(),
                          )
                        : CheckboxListWidget(
                            isChecked: listOfJob[index].status,
                            label: listOfJob[index].label,
                            onChanged: (value) {
                              setState(() {
                                listOfJob[index].status = value ?? false;
                              });
                            },
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
