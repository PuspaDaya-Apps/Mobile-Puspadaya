import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/view/widget/auto_size_text_info_field_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_measuring_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../config/screen_config/size_config.dart';
import '../../../../config/theme/text_style.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/primary_button_widget.dart';
import '../bloc/get_detail_ibu_hamil_bloc.dart';
import '../../../model/paketToScreen/paketToUpdateRegisterIbuHamil.dart';

class DetailRegisterIbuHamil extends StatelessWidget {
  final String id;
  const DetailRegisterIbuHamil({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetDetailIbuHamilBloc(),
        child: DetailRegisterIbuHamilView(
          id: id,
        ));
  }
}

class DetailRegisterIbuHamilView extends StatefulWidget {
  final String id;
  const DetailRegisterIbuHamilView({super.key, required this.id});

  @override
  State<DetailRegisterIbuHamilView> createState() =>
      _DetailRegisterIbuHamilViewState();
}

class _DetailRegisterIbuHamilViewState
    extends State<DetailRegisterIbuHamilView> {
  bool _isExpanded = false;

  // Sample data for display
  // final String nama = "Mentari Kumala Sari";
  // final String usia = "28";
  // final String nik = "213124123412";
  // final String namaSuami = "Joko";
  // final String tinggiBadan = "150 cm";
  // final String beratBadan = "60 kg";
  // final String lingkarKepala = "35 cm";
  // final String hemoglobin = "12 g/dl";
  // final String tempatPengukuran = "Posyandu A";
  // final String catatan = "Catatan penting di sini";

  @override
  void initState() {
    context
        .read<GetDetailIbuHamilBloc>()
        .add(FetchDetailIbuHamil(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sizeHeighofSingleForm = MediaQuery.of(context).size.height / 9;
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Detail Ibu Hamil',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<GetDetailIbuHamilBloc, GetDetailIbuHamilState>(
            builder: (context, state) {
              if (state is GetDetailIbuHamilLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is GetDetailIbuHamilFailed) {
                return Center(
                  child: Text('Gagal Mendapatkan Data ${state.message}'),
                );
              }
              if (state is GetDetailIbuHamilSuccess) {
                return Container(
                  margin: EdgeInsets.all(20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        height: _isExpanded
                            ? sizeHeighofSingleForm * 8.9
                            : sizeHeighofSingleForm,
                        child: SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Nama Ibu Hamil',
                                style: AppTextStyles.primaryTextNormal.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              InfoFieldWidget(text: 'Nama Ibu'),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16)),
                              Text(
                                'NIK',
                                style: AppTextStyles.primaryTextNormal.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              InfoFieldWidget(text: 'NIK Ibu'),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16)),
                              Text(
                                'Nomor Telepon',
                                style: AppTextStyles.primaryTextNormal.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              InfoFieldWidget(text: 'Telepon Ibu'),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16)),
                              Text(
                                'Umur',
                                style: AppTextStyles.primaryTextNormal
                                    .copyWith(fontSize: 12),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              InfoFieldWidget(text: 'umur Ibu'),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16)),
                              Text(
                                'Nama Suami',
                                style: AppTextStyles.primaryTextNormal
                                    .copyWith(fontSize: 12),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              InfoFieldWidget(text: 'nama suami'),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16)),
                              const Text(
                                'Alamat',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(8),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 8,
                                children: [
                                  Expanded(
                                    child: InfoFieldWidget(text: 'Jawa Timur'),
                                  ),
                                  Expanded(
                                    child: InfoFieldWidget(text: 'Banyuwangi'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(8),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 8,
                                children: [
                                  Expanded(
                                    child: InfoFieldWidget(text: 'Kabat'),
                                  ),
                                  Expanded(
                                    child: InfoFieldWidget(text: 'Kabat'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(8),
                              ),
                              InfoFieldWidget(text: 'Bunder'),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(8),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 8,
                                children: [
                                  Expanded(
                                    child: InfoFieldWidget(text: '2'),
                                  ),
                                  Expanded(
                                    child: InfoFieldWidget(text: '14'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(8),
                              ),
                              InfoFieldWidget(text: 'Alamat Lengkap'),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Detail Ibu Hamil',
                                style: AppTextStyles.primaryTextMedium.copyWith(
                                  fontSize: 10,
                                ),
                              ),
                              Icon(
                                size: 20,
                                _isExpanded
                                    ? FluentIcons.chevron_up_20_filled
                                    : FluentIcons.chevron_down_20_filled,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: Colors.black54,
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      // Text(
                      //   'Tanggal',
                      //   style: AppTextStyles.primaryTextNormal.copyWith(
                      //     fontSize: 12,
                      //   ),
                      // ),
                      // SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      // InfoFieldWidget(text: '12/10/2024'),
                      // SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      Text(
                        'Usia Kehamilan',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      InfoFieldWidget(
                          text: '${state.data.data.usiaKehamilan} Minggu'),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          Expanded(
                            child: Column(
                              spacing: 8,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InfoFieldMeasuringWidget(
                                  title: 'Tinggi Badan',
                                  unit: 'cm',
                                  value: state.data.data.tinggiBadan,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InfoFieldMeasuringWidget(
                                  title: 'Lingkar Kepala',
                                  unit: 'cm',
                                  value: 'lingkar kepala',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [
                          Expanded(
                            child: Column(
                              spacing: 8,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InfoFieldMeasuringWidget(
                                  title: 'Lingkar Lengan Atas',
                                  unit: 'cm',
                                  value: state.data.data.lingkarLenganAtas,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InfoFieldMeasuringWidget(
                                  title: 'Tinggi Fundus Uteri',
                                  unit: 'cm',
                                  value: state.data.data.tinggiFundusUteri,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      Text(
                        'Hemoboglin',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Expanded(
                            child: InfoFieldWidget(
                                text: state.data.data.hemoglobin
                                    .replaceAll('.00', '')),
                          ),
                          Text(
                            'g/dl',
                          )
                        ],
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      Text(
                        'Taggal Terakhir Haid',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      InfoFieldWidget(
                          text:
                              '${DateFormat('d MMMM y', 'id_ID').format(state.data.data.tanggalTerakhirHaid)}'),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Text(
                                  'Terpapar Asap Rokok',
                                  style:
                                      AppTextStyles.primaryTextNormal.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                                InfoFieldWidget(
                                    text: state.data.data.terpaparAsapRokok),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Text(
                                  'Tablet FE',
                                  style:
                                      AppTextStyles.primaryTextNormal.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                                InfoFieldWidget(
                                    text: state.data.data.jumlahTabletFe
                                        .toString()),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      Text(
                        'Kepemilikan BPJS',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      InfoFieldWidget(
                        text: state.data.data.namaBPJS == null
                        ? "Tidak Memiliki BPJS"
                        : state.data.data.namaBPJS!
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      Text(
                        'Catatan',
                        style: AppTextStyles.primaryTextNormal.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                      AutoSizeTextInfoFieldWidget(
                        text: state.data.data.catatan,
                      ),
                      SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                      ButtonPrimary(
                        color: goldPrimaryMain,
                        mainButtonMessage: 'Perbarui',
                        mainButton: () {
                          PaketToUpdateRegisterIbuHamil data = PaketToUpdateRegisterIbuHamil(
                            id: widget.id, data: state.data.data);
                          Navigator.pushNamed(
                            context,
                            UPDATE_REGISTER_IBU_HAMIL,
                            arguments: data,
                          ).then((value) {
                            if(value != null) {
                              BlocProvider.of<GetDetailIbuHamilBloc>(context).add(FetchDetailIbuHamil(id: widget.id));
                            }
                          });
                        },
                      ),
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
