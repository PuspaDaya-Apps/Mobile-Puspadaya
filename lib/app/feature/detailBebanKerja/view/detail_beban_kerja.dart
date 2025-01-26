import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/detailBebanKerja/view/model/jobitem.dart';
import 'package:puspadaya/app/view/widget/alert_dialog_widget.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class DetailBebanKerja extends StatelessWidget {
  const DetailBebanKerja({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailBebanKerjaView();
  }
}

class DetailBebanKerjaView extends StatefulWidget {
  const DetailBebanKerjaView({super.key});

  @override
  State<DetailBebanKerjaView> createState() => _DetailBebanKerjaViewState();
}

class _DetailBebanKerjaViewState extends State<DetailBebanKerjaView> {
  List<Jobitem> jobItems = [
    Jobitem(
      label: 'Administrasi',
      subItems: [
        Jobitem(
          label: 'Malakukan Komunikasi Efektif',
        ),
        Jobitem(
          label: 'Pendaftaran ibu hamil',
        ),
        Jobitem(
          label: 'Pendaftaran bayi dan balita',
        ),
        Jobitem(
          label: 'Pencatatan',
        ),
        Jobitem(
          label: 'Pencatatan dan pelaporan',
        ),
      ],
    ),
    Jobitem(
      label: 'Keterampilan Bayi dan Balita Tugas Lainnya',
      subItems: [
        Jobitem(
          label: 'Penyuluhan Imunisasi ',
        ),
        Jobitem(
          label:
              'Penyuluhan hasil penimbangan dan pengukuran, serta tindak lanjutnya',
        ),
        Jobitem(
          label: 'Penyuluhan penggunaan buku KIA ',
        ),
        Jobitem(
          label: 'Penyuluhan ASI eksklusif',
        ),
        Jobitem(
          label: 'Penyuluhan MPASI ',
        ),
        Jobitem(
          label: 'Penyuluhan pemantauan tanda bahaya bayi dan balita',
        ),
        Jobitem(
          label: 'Penimbangan dan pengukuran ',
        ),
        Jobitem(
          label: 'Penyuluhan ASI eksklusif',
        ),
        Jobitem(
          label: 'Penyuluhan MPASI',
        ),
        Jobitem(
          label: 'Penyuluhan pemantauan tanda bahaya bayi dan balita',
        ),
        Jobitem(
          label: 'Penimbangan dan pengukuran',
        ),
        Jobitem(
          label: 'Penyuluhan vit A',
        ),
        Jobitem(
          label: 'Penyuluhan obat cacing',
        ),
        Jobitem(
          label: 'Penyuluhan stimulasi perkembangan',
        ),
        Jobitem(
          label: 'Memberikan vit A',
        ),
        Jobitem(
          label: 'Memberikan obat cacing',
        ),
        Jobitem(
          label: 'Penimbangan dan pengukuran',
        ),
        Jobitem(
          label: 'Penyuluhan vit A',
        ),
        Jobitem(
          label: 'Penyuluhan obat cacing',
        ),
      ],
    ),
    Jobitem(
      label: 'Keterampilan Ibu Hamil & Menyusui',
      subItems: [
        Jobitem(
          label: 'Penyuluhan Isi Piring ku',
        ),
        Jobitem(
          label: 'Memberikan TTD (Tablet Tambah Darah)',
        ),
      ],
    ),
    Jobitem(
      label: 'Tambahan',
      subItems: [
        Jobitem(
          label: 'Penyuluhan aktifitas fisik',
        ),
        Jobitem(
          label: 'Penyuluhan KB',
        ),
        Jobitem(
          label: 'Penyuluhan manfaat PMT Ibu Hamil dan Balita',
        ),
        Jobitem(
          label: 'Memberikan PMT untuk balita & ibu hamil',
        ),
      ],
    ),
    Jobitem(
      label: 'Tugas Lainnya',
      subItems: [
        Jobitem(
          label: 'Memasak & Menyiapkan PMT',
        ),
        Jobitem(
          label: 'Negosisasi/Advokasi',
        ),
        Jobitem(
          label: 'Presentasi',
        ),
        Jobitem(
          label: 'Pelatihan, Jambore,',
        ),
        Jobitem(
          label: 'Menghadiri Rapat/ Kegiatan',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Detail Beban Kerja',
        onBackPressed: () {
          Navigator.pop(context);
        },
        background: Colors.white,
      ),
      backgroundColor: backgroundWhite10,
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
              InfoFieldWidget(text: 'September 2024'),
              SizedBox(height: SizeConfig.calHeightMultiplier(16)),
              Container(
                width: double.infinity,
                height: 2,
                color: Colors.black54,
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(12)),
              Center(
                child: Text(
                  'Daftar Pekerjaan',
                  style: AppTextStyles.primaryTextMedium.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(12)),
              Expanded(
                child: ListView.builder(
                  itemCount: jobItems.length,
                  itemBuilder: (context, index) {
                    if (jobItems[index].subItems != null &&
                        jobItems[index].subItems!.isNotEmpty) {
                      return ExpansionTile(
                        tilePadding: EdgeInsets
                            .zero, // Menghapus padding pada judul tile
                        childrenPadding:
                            EdgeInsets.zero, // Menghapus padding anak-anak
                        expandedCrossAxisAlignment: CrossAxisAlignment
                            .start, // Pastikan anak-anak rata kiri
                        title: Text(
                          jobItems[index].label,
                          style: AppTextStyles.primaryTextMedium.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        children: jobItems[index].subItems!.map((subItem) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 4,
                                  bottom: 4,
                                  left: 4), // Optional padding
                              child: Text(
                                subItem.label,
                                textAlign: TextAlign.start,
                                style: AppTextStyles.primaryTextMedium
                                    .copyWith(fontSize: 14),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          jobItems[index].label,
                          style: AppTextStyles.primaryTextMedium
                              .copyWith(fontSize: 14),
                        ),
                      );
                    }
                  },
                ),
              ),
              ButtonPrimary(
                color: redPrimaryMain,
                mainButtonMessage: 'Hapus',
                mainButton: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialogWidget(
                        title: 'Apakah Anda Yakin?',
                        message:
                            'Data Akan di hapus secara permanen dan tidak dapat dibatalkan',
                        mainButton: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        image: imageDeleteItems,
                        mainButtonMessage: 'Iya, Hapus Kegiatan',
                        colorMainButton: redPrimaryMain,
                        cancelButton: () {
                          Navigator.pop(context);
                        },
                        cancelButtonMessage: 'Batalkan',
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
