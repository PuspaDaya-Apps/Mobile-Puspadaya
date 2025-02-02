import 'package:flutter/material.dart';

import '../../../../config/theme/pallet_color.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../createRegisterOrangTua/view/data_ayah.dart';
import '../../createRegisterOrangTua/view/data_ibu.dart';

class UpdateRegisterOrangTua extends StatelessWidget {
  const UpdateRegisterOrangTua({super.key});

  @override
  Widget build(BuildContext context) {
    return const UpdateRegisterOrangTuaView();
  }
}

class UpdateRegisterOrangTuaView extends StatefulWidget {
  const UpdateRegisterOrangTuaView({super.key});

  @override
  State<UpdateRegisterOrangTuaView> createState() =>
      _UpdateRegisterOrangTuaViewState();
}

class _UpdateRegisterOrangTuaViewState extends State<UpdateRegisterOrangTuaView>
    with SingleTickerProviderStateMixin {
  final formkey = GlobalKey<FormState>();
  late TabController _tabController;

  final List<String> selectProvinsi = [
    'Jawa Timur',
    'Maluku',
  ];

  final List<String> selectKabupaten = [
    'Banyuwangi',
    'Maluku',
  ];

  final List<String> selectKecamatan = [
    'Kecamatan 1',
    'Kecamatan 2',
  ];

  final List<String> selectDesa = [
    'Banyuwangi',
    'Maluku',
  ];

  final List<String> selectDusun = [
    'Kecamatan 1',
    'Kecamatan 2',
  ];

  final List<String> selectGolDarah = [
    // A+, A-, B+, B-, AB+, AB-, O+, O-, Tidak Tahu, -
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
    'Tidak Tahu',
    '-',
  ];
  final List<String> disabilities = [
    'Tunanetra',
    'Tunarungu',
    'Tunawicara',
    'Tunadaksa',
    'Tunagharita',
    "Autisme",
  ];
  final List<String> selectJenisKB = [
    'Pil',
    'IUD',
    'Suntik',
    'Implant',
    'Lainnya'
  ];

  // Controller untuk Data Ayah dan Data Ibu
  // ? ayah
  final TextEditingController kkAyahController = TextEditingController();
  final TextEditingController nikAyahController = TextEditingController();
  final TextEditingController namaAyahController = TextEditingController();
  final TextEditingController tempatLahirAyahController =
      TextEditingController();
  final TextEditingController tanggalLahirAyahController =
      TextEditingController();
  final TextEditingController rTAyahController = TextEditingController();
  final TextEditingController rWAyahController = TextEditingController();
  final TextEditingController alamatAyahController = TextEditingController();
  final TextEditingController teleponAyahController = TextEditingController();
  String? selectedKabupatenAyah;
  String? selectedKecamatanAyah;
  String? selectedDesaAyah;
  String? selectedDusunAyah;
  String? selectedGolDarahAyah;
  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesAyah = [];
  List<String> selectedDisabilityLabelsAyah = [];

  // ? ibu
  final TextEditingController kkIbuController = TextEditingController();
  final TextEditingController nikIbuController = TextEditingController();
  final TextEditingController namaIbuController = TextEditingController();
  final TextEditingController tempatLahirIbuController =
      TextEditingController();
  final TextEditingController tanggalLahirIbuController =
      TextEditingController();
  final TextEditingController rTIbuController = TextEditingController();
  final TextEditingController rWIbuController = TextEditingController();
  final TextEditingController alamatIbuController = TextEditingController();
  final TextEditingController teleponIbuController = TextEditingController();
  final TextEditingController tanggalKelahiranAnakSebelumnyaIbuController =
      TextEditingController();
  final TextEditingController jumlahAnakIbuController = TextEditingController();

  String? selectedKabupatenIbu;
  String? selectedJenisKBIbu;
  String? selectedGolonnganDarahIbu;
  String? selectedKecamatanIbu;
  String? selectedDesaIbu;
  String? selectedDusunIbu;
  String? selectedGolDarahIbu;
  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesIbu = [];
  List<String> selectedDisabilityLabelsIbu = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );

    //? ayah
    kkAyahController.text = '1234567890';
    nikAyahController.text = '1234567890123456';
    namaAyahController.text = 'John Doe';
    tempatLahirAyahController.text = 'Jakarta';
    tanggalLahirAyahController.text = '01/01/1990';
    rTAyahController.text = '01';
    rWAyahController.text = '02';
    alamatAyahController.text = 'Jl. Contoh No. 123';
    teleponAyahController.text = '081234567890';
    selectedKabupatenAyah = selectKabupaten[0];
    selectedKecamatanAyah = selectKecamatan[0];
    selectedDesaAyah = selectDesa[0];
    selectedDusunAyah = selectDusun[0];
    selectedGolDarahAyah = selectGolDarah[0];
    selectedDisabilitiesAyah = List<bool>.filled(disabilities.length, false);
    selectedDisabilityLabelsAyah = [];

    //?ibu
    kkIbuController.text = '0987654321';
    nikIbuController.text = '6543210987654321';
    namaIbuController.text = 'Jane Doe';
    tempatLahirIbuController.text = 'Surabaya';
    tanggalLahirIbuController.text = '02/02/1991';
    rTIbuController.text = '03';
    rWIbuController.text = '04';
    alamatIbuController.text = 'Jl. Contoh No. 456';
    teleponIbuController.text = '081234567891';
    selectedKabupatenIbu = selectKabupaten[1];
    selectedJenisKBIbu = selectJenisKB[0];
    selectedGolDarahIbu = selectGolDarah[1];
    selectedKecamatanIbu = selectKecamatan[1];
    selectedDesaIbu = selectDesa[1];
    selectedDusunIbu = selectDusun[1];
    selectedGolDarahIbu = selectGolDarah[1];
    selectedDisabilitiesIbu = List<bool>.filled(disabilities.length, false);
    selectedDisabilityLabelsIbu = [];
  }

  @override
  void dispose() {
    // Dispose Ayah Controllers
    kkAyahController.dispose();
    nikAyahController.dispose();
    namaAyahController.dispose();
    tempatLahirAyahController.dispose();
    tanggalLahirAyahController.dispose();
    rTAyahController.dispose();
    rWAyahController.dispose();
    alamatAyahController.dispose();
    teleponAyahController.dispose();

    // Dispose Ibu Controllers
    kkIbuController.dispose();
    nikIbuController.dispose();
    namaIbuController.dispose();
    tempatLahirIbuController.dispose();
    tanggalLahirIbuController.dispose();
    rTIbuController.dispose();
    rWIbuController.dispose();
    alamatIbuController.dispose();
    teleponIbuController.dispose();
    tanggalKelahiranAnakSebelumnyaIbuController.dispose();
    jumlahAnakIbuController.dispose();

    // Dispose TabController
    _tabController.dispose();

    super.dispose();
  }

  void _goToNextTab() {
    if (formkey.currentState!.validate()) {
      // Jika validasi berhasil, lakukan sesuatu
      print("Form valid, simpan data");
      print("KK Ayah: ${kkAyahController.text}");
      print("KK Ibu: ${kkIbuController.text}");
      _tabController.animateTo(1); // Pindah ke tab Data Ibu
    } else {
      print("Form tidak valid");
    }
  }

  void _navigateBack() {
    _tabController.animateTo(0);
  }

  void _submitForm() {
    // Validasi semua field
    if (formkey.currentState!.validate()) {
      // Data Ayah
      print("===== DATA AYAH =====");
      print("KK Ayah: ${kkAyahController.text}");
      print("NIK Ayah: ${nikAyahController.text}");
      print("Nama Ayah: ${namaAyahController.text}");
      print("Tempat Lahir Ayah: ${tempatLahirAyahController.text}");
      print("Tanggal Lahir Ayah: ${tanggalLahirAyahController.text}");
      print("RT Ayah: ${rTAyahController.text}");
      print("RW Ayah: ${rWAyahController.text}");
      print("Alamat Ayah: ${alamatAyahController.text}");
      print("Telepon Ayah: ${teleponAyahController.text}");

      // Selected Dropdown Values Ayah
      print("Kabupaten Ayah: ${selectedKabupatenAyah ?? 'Tidak Dipilih'}");
      print("Kecamatan Ayah: ${selectedKecamatanAyah ?? 'Tidak Dipilih'}");
      print("Desa Ayah: ${selectedDesaAyah ?? 'Tidak Dipilih'}");
      print("Dusun Ayah: ${selectedDusunAyah ?? 'Tidak Dipilih'}");
      print("Golongan Darah Ayah: ${selectedGolDarahAyah ?? 'Tidak Dipilih'}");

      // Disabilitas Ayah
      print("Disabilitas Ayah:");
      if (selectedDisabilityLabelsAyah.isNotEmpty) {
        for (var disability in selectedDisabilityLabelsAyah) {
          print("- $disability");
        }
      } else {
        print("Tidak ada disabilitas dipilih");
      }

      // Data Ibu
      print("\n===== DATA IBU =====");
      print("KK Ibu: ${kkIbuController.text}");
      print("NIK Ibu: ${nikIbuController.text}");
      print("Nama Ibu: ${namaIbuController.text}");
      print("Tempat Lahir Ibu: ${tempatLahirIbuController.text}");
      print("Tanggal Lahir Ibu: ${tanggalLahirIbuController.text}");
      print("RT Ibu: ${rTIbuController.text}");
      print("RW Ibu: ${rWIbuController.text}");
      print("Alamat Ibu: ${alamatIbuController.text}");
      print("Telepon Ibu: ${teleponIbuController.text}");
      print(
          "Tanggal Kelahiran Anak Sebelumnya: ${tanggalKelahiranAnakSebelumnyaIbuController.text}");
      print("Jumlah Anak: ${jumlahAnakIbuController.text}");

      // Selected Dropdown Values Ibu
      print("Kabupaten Ibu: ${selectedKabupatenIbu ?? 'Tidak Dipilih'}");
      print("Kecamatan Ibu: ${selectedKecamatanIbu ?? 'Tidak Dipilih'}");
      print("Desa Ibu: ${selectedDesaIbu ?? 'Tidak Dipilih'}");
      print("Dusun Ibu: ${selectedDusunIbu ?? 'Tidak Dipilih'}");
      print("Golongan Darah Ibu: ${selectedGolDarahIbu ?? 'Tidak Dipilih'}");
      print("Jenis KB: ${selectedJenisKBIbu ?? 'Tidak Dipilih'}");

      // Disabilitas Ibu
      print("Disabilitas Ibu:");
      if (selectedDisabilityLabelsIbu.isNotEmpty) {
        for (var disability in selectedDisabilityLabelsIbu) {
          print("- $disability");
        }
      } else {
        print("Tidak ada disabilitas dipilih");
      }
    } else {
      print("Form tidak valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Tambah Data Orang Tua',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height / 1.2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                IgnorePointer(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: backgroundWhite20,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TabBar(
                      isScrollable: false,
                      padding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorAnimation: TabIndicatorAnimation.elastic,
                      dividerHeight: 0,
                      controller: _tabController,
                      indicator: BoxDecoration(
                        color: bluePrimaryMain,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      unselectedLabelColor: textSecoundary,
                      labelColor: Colors.white,
                      tabs: [
                        Tab(text: 'Data Ayah'),
                        Tab(text: 'Data Ibu'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Expanded(
                //   child: Form(
                //     key: formkey,
                //     child: TabBarView(
                //       physics: NeverScrollableScrollPhysics(),
                //       controller: _tabController,
                //       children: [
                //         DataAyah(
                //           onNext: _goToNextTab,
                //           kkAyahController: kkAyahController,
                //           nikAyahController: nikAyahController,
                //           namaAyahController: namaAyahController,
                //           tempatLahirAyahController: tempatLahirAyahController,
                //           tanggalLahirAyahController:
                //               tanggalLahirAyahController,
                //           selectKabupaten: selectKabupaten,
                //           selectKecamatan: selectKecamatan,
                //           selectDesa: selectDesa,
                //           selectDusun: selectDusun,
                //           selectGolDarah: selectGolDarah,
                //           disabilities: disabilities,
                //           alamatAyahController: alamatAyahController,
                //           teleponAyahController: teleponAyahController,
                //           rTAyahController: rTAyahController,
                //           rWAyahController: rWAyahController, selectProvinsi: [],
                //         ),
                //         DataIbu(
                //           onSubmit: _submitForm,
                //           navigateBack: _navigateBack,
                //           kkIbuController: kkIbuController,
                //           nikIbuController: nikIbuController,
                //           namaIbuController: namaIbuController,
                //           tempatLahirIbuController: tempatLahirIbuController,
                //           tanggalLahirIbuController: tanggalLahirIbuController,
                //           alamatIbuController: alamatIbuController,
                //           teleponIbuController: teleponIbuController,
                //           rTIbuController: rTIbuController,
                //           rWIbuController: rWIbuController,
                //           tanggalKelahiranAnakSebelumnyaIbuController:
                //               tanggalKelahiranAnakSebelumnyaIbuController,
                //           jumlahAnakIbuController: jumlahAnakIbuController,
                //           selectKabupaten: selectKabupaten,
                //           selectKecamatan: selectKecamatan,
                //           selectDesa: selectDesa,
                //           selectDusun: selectDusun,
                //           selectGolDarah: selectGolDarah,
                //           disabilities: disabilities, selectProvinsi: [],
                //         )
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
