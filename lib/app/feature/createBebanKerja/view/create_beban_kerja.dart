import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/createBebanKerja/model/JobItems.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/checkbox_list_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
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
    Jobitems(
      label: 'Pelayanan Kesehatan',
      status: false,
      subItems: [
        Jobitems(label: 'Memberikan TTD(Tablet Tambah Darah)', status: false),
        Jobitems(label: 'Memberikan vit A di posyandu', status: false),
        Jobitems(label: 'Memberikan obat cacing di posyandu', status: false),
        Jobitems(
          label: 'Memberikan PMT penyuluhan untuk Anak di Posyandu',
          status: false,
        ),
      ],
      isExpanded: false,
    ),
    Jobitems(label: 'Pencatatan dan pelaporan', status: false),
    Jobitems(
      label: 'Penyuluhan Kesehatan',
      status: false,
      subItems: [
        Jobitems(label: 'Penyuluhan penggunaan buku KIA ', status: false),
        Jobitems(label: 'Penyuluhan Isi Piring ku', status: false),
        Jobitems(label: 'Penyuluhan manfaat PMT ', status: false),
        Jobitems(label: 'Penyuluhan aktifitas fisik', status: false),
        Jobitems(label: 'Penyuluhan ASI eksklusif ', status: false),
        Jobitems(label: 'Penyuluhan KB', status: false),
        Jobitems(label: 'Penyuluhan Imunisais ', status: false),
        Jobitems(label: 'Penyuluhan vit A', status: false),
        Jobitems(label: 'Penyuluhan obat cacing', status: false),
        Jobitems(label: 'Penyuluhan stimulasi perkembangan', status: false),
        Jobitems(label: 'Penyuluhan MPASI', status: false),
        Jobitems(
            label:
                'Penyuluhan hasil penimbangan dan pengukuran, serta tindak lanjutnya',
            status: false),
        Jobitems(
            label: 'Penyuluhan pemantauna tanda bahaya bayi dan Anak',
            status: false),
      ],
      isExpanded: false,
    ),
    Jobitems(
      label: 'Kunjungan Rumah',
      status: false,
      subItems: [
        Jobitems(
            label: 'Memberikan makanan tambahan pada ibu hamil KEK',
            status: false),
        Jobitems(
            label: 'Memberikan PMT kepada Anak bermasalah gizi', status: false),
        Jobitems(label: 'Penimbangan dan pengukuran di rumah', status: false),
        Jobitems(label: 'Penggunaan buku KIA', status: false),
        Jobitems(label: 'Isi Piring Ku', status: false),
        Jobitems(label: 'Manfaat PMT', status: false),
        Jobitems(label: 'Aktivitas fisik', status: false),
        Jobitems(label: 'ASI eksklusif', status: false),
        Jobitems(label: 'KB', status: false),
        Jobitems(label: 'Imunisasi', status: false),
        Jobitems(label: 'Obat Cacing', status: false),
        Jobitems(label: 'Stimulasi Perkembangan', status: false),
        Jobitems(label: 'MPASI', status: false),
        Jobitems(
            label: 'Hasil penimbangan dan pengukuran, serta tindak lanjutnya',
            status: false),
        Jobitems(label: 'Pemantauan tanda bahaya bayi dan Anak', status: false),
      ],
      isExpanded: false,
    ),
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
                        ? Column(
                            children: [
                              ExpansionTile(
                                onExpansionChanged: (value) {
                                  setState(() {
                                    listOfJob[index].isExpanded = value;
                                  });
                                },
                                childrenPadding: EdgeInsets.all(0),
                                tilePadding: EdgeInsets.all(0),
                                title: CheckboxListWidget(
                                  isChecked: listOfJob[index].status,
                                  label: listOfJob[index].label,
                                  onChanged: (value) {
                                    setState(() {
                                      listOfJob[index].status = value ?? false;
                                      // Mengatur status semua sub-items
                                      for (var subItem
                                          in listOfJob[index].subItems!) {
                                        subItem.status = value ?? false;
                                      }
                                    });
                                  },
                                ),
                                children: listOfJob[index].subItems!.map(
                                  (subItem) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
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
                                  },
                                ).toList(),
                              ),
                              !listOfJob[index].isExpanded!
                                  ? Container(
                                      width: double.infinity,
                                      color: Colors.black38,
                                      height: 2,
                                    )
                                  : SizedBox.shrink()
                            ],
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
              ButtonPrimary(
                color: bluePrimaryMain,
                mainButtonMessage: 'Simpan',
                mainButton: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
