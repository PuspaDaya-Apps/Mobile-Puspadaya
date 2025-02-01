import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/createBebanKerja/model/JobItems.dart';
import 'package:puspadaya/app/feature/createBebanKerja/view/widget/thropy_alert.dart';
import 'package:puspadaya/app/view/widget/alert_dialog_widget.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/checkbox_list_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
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
    Jobitems(
      label: 'Administrasi',
      status: false,
      subItems: [
        Jobitems(label: 'Malakukan Komunikasi Efektif', status: false),
        Jobitems(label: 'Pendaftaran ibu hamil', status: false),
        Jobitems(label: 'Pendaftaran bayi dan balita', status: false),
        Jobitems(
          label: 'Pencatatan',
          status: false,
        ),
        Jobitems(
          label: 'Pencatatan dan pelaporan',
          status: false,
        ),
      ],
      isExpanded: false,
    ),
    Jobitems(
      label: 'Keterampilan Bayi dan Balita Tugas Lainnya',
      status: false,
      subItems: [
        Jobitems(label: 'Penyuluhan Imunisasi ', status: false),
        Jobitems(
            label:
                'Penyuluhan hasil penimbangan dan pengukuran, serta tindak lanjutnya',
            status: false),
        Jobitems(label: 'Penyuluhan penggunaan buku KIA ', status: false),
        Jobitems(label: 'Penyuluhan ASI eksklusif', status: false),
        Jobitems(label: 'Penyuluhan MPASI ', status: false),
        Jobitems(
            label: 'Penyuluhan pemantauan tanda bahaya bayi dan balita',
            status: false),
        Jobitems(label: 'Penimbangan dan pengukuran ', status: false),
        Jobitems(label: 'Penyuluhan ASI eksklusif', status: false),
        Jobitems(label: 'Penyuluhan MPASI', status: false),
        Jobitems(
            label: 'Penyuluhan pemantauan tanda bahaya bayi dan balita',
            status: false),
        Jobitems(label: 'Penimbangan dan pengukuran', status: false),
        Jobitems(label: 'Penyuluhan vit A', status: false),
        Jobitems(label: 'Penyuluhan obat cacing', status: false),
        Jobitems(label: 'Penyuluhan stimulasi perkembangan', status: false),
        Jobitems(label: 'Memberikan vit A', status: false),
        Jobitems(label: 'Memberikan obat cacing', status: false),
        Jobitems(label: 'Penimbangan dan pengukuran', status: false),
        Jobitems(label: 'Penyuluhan vit A', status: false),
        Jobitems(label: 'Penyuluhan obat cacing', status: false),
      ],
      isExpanded: false,
    ),
    Jobitems(
      label: 'Keterampilan Ibu Hamil & Menyusui',
      status: false,
      subItems: [
        Jobitems(label: 'Penyuluhan Isi Piring ku', status: false),
        Jobitems(label: 'Memberikan TTD (Tablet Tambah Darah)', status: false),
        Jobitems(
            label: 'Menjelaskan Pemeriksaan Ibu Hamil dan Ibu Nifas',
            status: false),
        Jobitems(
            label:
                'Menjelaskan bahwa ibu hamil perlu memantau berat badan, lingkar lengan dan tekanan darah dengan kurva Buku KIA',
            status: false),
        Jobitems(
            label: 'Menjelaskan pemantauan tanda bahaya ibu hamil, ibu nifas',
            status: false),
        Jobitems(
            label: 'Menjelaskan Penggunaan Buku KIA bagian ibu hamil, nifas',
            status: false),
      ],
      isExpanded: false,
    ),
    Jobitems(
      label: 'Tambahan',
      status: false,
      subItems: [
        Jobitems(label: 'Penyuluhan aktifitas fisik', status: false),
        Jobitems(label: 'Penyuluhan KB', status: false),
        Jobitems(
            label: 'Penyuluhan manfaat PMT Ibu Hamil dan Balita',
            status: false),
        Jobitems(
            label: 'Memberikan PMT untuk balita & ibu hamil', status: false),
      ],
      isExpanded: false,
    ),
    Jobitems(
      label: 'Tugas Lainnya',
      status: false,
      subItems: [
        Jobitems(label: 'Memasak & Menyiapkan PMT', status: false),
        Jobitems(label: 'Negosisasi/Advokasi', status: false),
        Jobitems(label: 'Presentasi', status: false),
        Jobitems(label: 'Pelatihan, Jambore,', status: false),
        Jobitems(label: 'Menghadiri Rapat/ Kegiatan', status: false),
      ],
      isExpanded: false,
    ),
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
                mainButton: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return ThropyAlert(
                        image: imageThropy,
                        title: 'Total Bobot Yang Anda Dapatkan 87.9',
                        message:
                            'Terus pertahankan semangat dan konsistensi, karena setiap usaha kamu sangat berarti. Ayo, kita capai lebih tinggi lagi!',
                        mainButton: () {
                          Navigator.pop(context);
                        },
                        cancelButton: () {
                          Navigator.pop(context);
                        },
                        cancelButtonMessage: 'Batalkan',
                        mainButtonMessage: "Simpan",
                        colorMainButton: bluePrimaryMain,
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
