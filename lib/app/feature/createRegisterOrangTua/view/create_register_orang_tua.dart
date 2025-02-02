import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/alamat/bloc/alamat_bloc.dart';
import 'package:puspadaya/app/feature/alamat/model/get_provinsi_response.dart'
    as ProvinsiModel;
import 'package:puspadaya/app/feature/alamat/model/get_kabupaten_response.dart'
    as KabupatenModel;
import 'package:puspadaya/app/feature/alamat/model/get_kecamatan_response.dart'
    as KecamatanModel;
import 'package:puspadaya/app/feature/alamat/model/get_desa_kelurahan_response.dart'
    as DesaKelurahanModel;
import 'package:puspadaya/app/feature/alamat/model/get_dusun_response.dart'
    as DusunModel;

import 'package:puspadaya/app/feature/createRegisterOrangTua/view/data_ayah.dart';
import 'package:puspadaya/app/feature/createRegisterOrangTua/view/data_ibu.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

import '../../../../utils/logger/logger.dart';
import '../bloc/create_register_orang_tua_bloc.dart';

class CreateRegisterOrangTua extends StatelessWidget {
  const CreateRegisterOrangTua({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AlamatBloc>(
          create: (BuildContext context) => AlamatBloc(),
        ),
      ],
      child: CreateRegisterOrangTuaView(),
    );
  }
}

class CreateRegisterOrangTuaView extends StatefulWidget {
  const CreateRegisterOrangTuaView({super.key});

  @override
  State<CreateRegisterOrangTuaView> createState() =>
      _CreateRegisterOrangTuaViewState();
}

class _CreateRegisterOrangTuaViewState extends State<CreateRegisterOrangTuaView>
    with SingleTickerProviderStateMixin {
  final formkey = GlobalKey<FormState>();
  late TabController _tabController;

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

  String? selectedProvinsiAyah;
  String? selectedKabupatenAyah;
  String? selectedKecamatanAyah;
  String? selectedDesaAyah;
  String? selectedDusunAyah;
  String? selectedGolDarahAyah;

  // Status checkbox untuk disabilitas
  List<bool> selectedDisabilitiesAyah = [];
  List<String> selectedDisabilityLabelsAyah = [];

  // ? ibu

  String? selectedProvinsiIbu;
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
    logger.d('trigger fetch');
    context
        .read<AlamatBloc>()
        .add(ShowAllSectionEvent()); //! triger get all data
    // final List<ProvinsiModel.Datum> selectProvinsi = [];
  }

  @override
  void dispose() {
    // Dispose TabController
    _tabController.dispose();
    super.dispose();
  }

  void _goToNextTab() {
    if (formkey.currentState!.validate()) {
      _tabController.animateTo(1); // Pindah ke tab Data Ibu
    } else {
      print("Form tidak valid");
    }
  }

  void _navigateBack() {
    _tabController.animateTo(0);
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
                Container(
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
                SizedBox(height: 20),
                BlocBuilder<AlamatBloc, AlamatState>(
                  buildWhen: (previous, current) => current is ShowAllSection,
                  builder: (context, state) {
                    if (state is ShowAllSection) {
                      final List<ProvinsiModel.Datum> selectProvinsi =
                          state.provinsi;
                      final List<KabupatenModel.Datum> selectKabupaten =
                          state.kabupaten;
                      final List<KecamatanModel.Datum> selectKecamatan =
                          state.kecamatan;
                      final List<DesaKelurahanModel.Datum> selectDesaKelurahan =
                          state.desaKelurahan;
                      final List<DusunModel.Datum> selectDusun = state.dusun;

                      return Expanded(
                        child: Form(
                          key: formkey,
                          child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _tabController,
                            children: [
                              DataAyah(
                                key: UniqueKey(),
                                onNext: _goToNextTab,
                                selectKabupaten: selectKabupaten,
                                selectKecamatan: selectKecamatan,
                                selectDusun: selectDusun,
                                selectProvinsi: selectProvinsi,
                                selectDesaKelurahan: selectDesaKelurahan,
                                selectGolDarah: selectGolDarah,
                                disabilities: disabilities,
                              ),
                              // Container(),
                              DataIbu(
                                key: UniqueKey(),
                                navigateBack: _navigateBack,
                                selectKabupaten: selectKabupaten,
                                selectKecamatan: selectKecamatan,
                                selectDusun: selectDusun,
                                selectGolDarah: selectGolDarah,
                                disabilities: disabilities,
                                selectProvinsi: selectProvinsi,
                                selectDesaKelurahan: selectDesaKelurahan,
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    // Handle other states...
                    return Container(); // Ganti dengan widget yang sesuai
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
