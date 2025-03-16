
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:puspadaya/app/feature/pengukuranAnak/alatUkur/bloc/alat_ukur_anak_bloc.dart';
import 'package:puspadaya/app/feature/pengukuranAnak/create/Bloc/searchAnakCubit/search_anak_cubit.dart';
import 'package:puspadaya/app/model/paketToScreen/paket_to_update_pengukuran_tamu_model.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/view/widget/auto_size_text_field_widget.dart';
import 'package:puspadaya/app/view/widget/dropdown_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/app/view/widget/measuring_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/app/view/widget/radio_button_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

class UpdatePengukuranTamu extends StatelessWidget {
  const UpdatePengukuranTamu({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchAnakCubit(),
        ),
        // BlocProvider(
        //   create: (context) => UpdatePengukuranTamuBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => AlatUkurAnakBloc(),
        // ),
      ],
      child: const UpdatePengukuranTamuView(),
    );
  }
}

class UpdatePengukuranTamuView extends StatefulWidget {
  const UpdatePengukuranTamuView({super.key});

  @override
  State<UpdatePengukuranTamuView> createState() =>
      _UpdatePengukuranTamuViewState();
}

class _UpdatePengukuranTamuViewState extends State<UpdatePengukuranTamuView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController upperArmCircumferenceController =
      TextEditingController();
  TextEditingController headCircumferenceController = TextEditingController();
  TextEditingController catatanController = TextEditingController();
  TextEditingController keluhanController = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  String selectedPosyandu = 'Posyandu';
  String selectedPosition = 'Terlentang';

  String selectedHeight = 'Microtoise';
  String selectedWeight = 'Timbangan Digital';
  String selectedUpperArmCircumference = 'Pita Lila';
  String selectedUterineFundalHeight = 'Metline';

  final List<String> selectPosyandu = ['Posyandu', 'Rumah'];

  final List<String> selectPosition = [
    'Terlentang',
    'Berdiri',
  ];

  late PaketToUpdatePengukuranTamuModel paket;

  int? asiEksklusifValue = 0;
  int? mpasiValue = 0;

  late String alatUkur;

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<AlatUkurAnakBloc>(context).add(GetAlatUkur());
  }

  @override
  Widget build(BuildContext context) {

    // final createPengukuranAnakBloc = BlocProvider.of<UpdatePengukuranTamuBloc>(context);

    // return BlocListener<AlatUkurAnakBloc, AlatUkurAnakState>(
    //   listener: (context, state) {
    //     debugPrint(state.toString());
    //     if (state is AlatUkurAnakSuccessState) {
    //       alatUkur = state.alatUkurResponseModel.data![0].id;
    //     }
    //   },
    //   child: Scaffold(
    //     backgroundColor: backgroundWhite10,
    //     appBar: PrimaryAppBar(
    //       title: "Perbarui Pengukuran Tamu",
    //       // actions: [__buildChangeMeasuringToolsButton(context)],
    //       onBackPressed: () => Navigator.pop(context),
    //     ),
    //     body: SafeArea(
    //       child: SingleChildScrollView(
    //         child: Container(
    //           margin: const EdgeInsets.all(20),
    //           padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
    //           decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.circular(12),
    //           ),
    //           child: Form(
    //             key: _formKey,
    //             child: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 const Text(
    //                   'NIK',
    //                   style: TextStyle(fontSize: 12),
    //                 ),
    //                 SizedBox(height: SizeConfig.calHeightMultiplier(8)),
    //                 InfoFieldWidget(text: '36501231921234'),
    //                 SizedBox(height: SizeConfig.calHeightMultiplier(16)),
    //                 const Text(
    //                   'Asal Posyandu',
    //                   style: TextStyle(fontSize: 12),
    //                 ),
    //                 SizedBox(height: SizeConfig.calHeightMultiplier(8)),
    //                 InfoFieldWidget(text: 'Posyandu Mawar 8'),
    //                 SizedBox(
    //                   height: SizeConfig.calHeightMultiplier(16),
    //                 ),
    //                 Container(
    //                   width: double.infinity,
    //                   height: 2,
    //                   color: Colors.black54,
    //                 ),
    //                 SizedBox(height: SizeConfig.calHeightMultiplier(16)),
    //                 const Text(
    //                   'Posisi Pengukuran Tinggi Badan',
    //                   style: TextStyle(
    //                     fontSize: 12,
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: SizeConfig.calHeightMultiplier(8),
    //                 ),
    //                 DropdownWidget(
    //                   items: selectPosition,
    //                   hint: 'Pilih Posisi Pengukuran Tinggi Badan',
    //                   value: selectedPosition,
    //                   onChanged: (value) {
    //                     setState(() {
    //                       selectedPosition = value;
    //                     });
    //                   },
    //                 ),
    //                 SizedBox(height: SizeConfig.calHeightMultiplier(16)),
    //                 Row(
    //                   spacing: 8,
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Expanded(
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         children: [
    //                           MeasurementWidget(
    //                             title: 'Tinggi Badan',
    //                             hintText: 'contoh: 13.5',
    //                             unit: 'cm',
    //                             // tool: 'Microtoise',
    //                             controller: heightController,
    //                           ),
    //                           SizedBox(
    //                             height: SizeConfig.calHeightMultiplier(16),
    //                           ),
    //                           MeasurementWidget(
    //                             title: 'Lingkar Lengan Atas',
    //                             hintText: 'contoh: 3.5',
    //                             unit: 'cm',
    //                             // tool: 'Pita Lila',
    //                             controller: upperArmCircumferenceController,
    //                           ),
    //                           SizedBox(
    //                             height: SizeConfig.calHeightMultiplier(16),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         children: [
    //                           MeasurementWidget(
    //                             title: 'Berat Badan',
    //                             hintText: 'contoh: 6.5',
    //                             unit: 'kg',
    //                             // tool: 'Timbangan Digital',
    //                             controller: weightController,
    //                           ),
    //                           SizedBox(
    //                             height: SizeConfig.calHeightMultiplier(16),
    //                           ),
    //                           MeasurementWidget(
    //                             title: 'Lingkar Kepala',
    //                             hintText: 'contoh: 6.5',
    //                             unit: 'cm',
    //                             // tool: 'Alat Ukur Lingkar Kepala',
    //                             controller: headCircumferenceController,
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 SizedBox(height: SizeConfig.calHeightMultiplier(16)),
    //                 Row(
    //                   children: [
    //                     Expanded(
    //                       child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text(
    //                             'Asi Ekskusif',
    //                             style: AppTextStyles.primaryTextNormal.copyWith(
    //                               fontSize: 12,
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             height: SizeConfig.calHeightMultiplier(8),
    //                           ),
    //                           // radio button
    //                           Row(
    //                             crossAxisAlignment: CrossAxisAlignment.center,
    //                             mainAxisAlignment: MainAxisAlignment.start,
    //                             children: [
    //                               CustomRadioButton(
    //                                 value: 1,
    //                                 groupValue: asiEksklusifValue!,
    //                                 onChanged: (value) {
    //                                   setState(() {
    //                                     asiEksklusifValue = value;
    //                                   });
    //                                 },
    //                                 label: 'Ya',
    //                               ),
    //                               SizedBox(
    //                                 width: SizeConfig.calHeightMultiplier(16),
    //                               ),
    //                               CustomRadioButton(
    //                                 value: 0,
    //                                 groupValue: asiEksklusifValue!,
    //                                 onChanged: (value) {
    //                                   setState(() {
    //                                     asiEksklusifValue = value;
    //                                   });
    //                                 },
    //                                 label: 'Tidak',
    //                               ),
    //                             ],
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text(
    //                             'MPASI',
    //                             style: AppTextStyles.primaryTextNormal.copyWith(
    //                               fontSize: 12,
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             height: SizeConfig.calHeightMultiplier(8),
    //                           ),
    //                           // radio button
    //                           Row(
    //                             crossAxisAlignment: CrossAxisAlignment.center,
    //                             mainAxisAlignment: MainAxisAlignment.start,
    //                             children: [
    //                               CustomRadioButton(
    //                                 value: 1,
    //                                 groupValue: mpasiValue!,
    //                                 onChanged: (value) {
    //                                   setState(() {
    //                                     mpasiValue = value;
    //                                   });
    //                                 },
    //                                 label: 'Ya',
    //                               ),
    //                               SizedBox(
    //                                 width: SizeConfig.calHeightMultiplier(16),
    //                               ),
    //                               CustomRadioButton(
    //                                 value: 0,
    //                                 groupValue: mpasiValue!,
    //                                 onChanged: (value) {
    //                                   setState(() {
    //                                     mpasiValue = value;
    //                                   });
    //                                 },
    //                                 label: 'Tidak',
    //                               ),
    //                             ],
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 SizedBox(height: SizeConfig.calHeightMultiplier(16)),
    //                 const Text(
    //                   'Catatan',
    //                   style: TextStyle(
    //                     fontSize: 12,
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: SizeConfig.calHeightMultiplier(8),
    //                 ),
    //                 AutoSizeTextFieldWidget(
    //                   controller: catatanController,
    //                   hintText: 'Masukan Catatan',
    //                 ),
    //                 SizedBox(height: SizeConfig.calHeightMultiplier(16)),
    //                 const Text(
    //                   'Keluhan',
    //                   style: TextStyle(
    //                     fontSize: 12,
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: SizeConfig.calHeightMultiplier(8),
    //                 ),
    //                 AutoSizeTextFieldWidget(
    //                   controller: keluhanController,
    //                   hintText: 'Masukan Keluhan',
    //                 ),
    //                 SizedBox(height: SizeConfig.calHeightMultiplier(16)),
    //                 ButtonPrimary(
    //                   color: bluePrimaryMain,
    //                   mainButtonMessage: 'Simpan',
    //                   mainButton: () {},
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return SizedBox();
  }

  // Widget __buildChangeMeasuringToolsButton(context) {
  //   return GestureDetector(
  //     onTap: () {
  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertChooseMeasuringTools(
  //           title: 'Pilih Alat Ukur',
  //           mainButton: () {
  //             Navigator.pop(context);
  //           },
  //           mainButtonMessage: 'Simpan',
  //           colorMainButton: bluePrimaryMain,
  //           selectedHeight: selectedHeight,
  //           selectedWeight: selectedWeight,
  //           selectedUpperArmCircumference: selectedUpperArmCircumference,
  //           selectedUterineFundalHeight: selectedUterineFundalHeight,
  //           onHeightChanged: (value) {
  //             setState(() {
  //               selectedHeight = value;
  //             });
  //           },
  //           onWeightChanged: (value) {
  //             setState(() {
  //               selectedWeight = value;
  //             });
  //           },
  //           onUpperArmCircumferenceChanged: (value) {
  //             setState(() {
  //               selectedUpperArmCircumference = value;
  //             });
  //           },
  //           onUterineFundalHeightChanged: (value) {
  //             setState(() {
  //               selectedUterineFundalHeight = value;
  //             });
  //           },
  //         ),
  //       );
  //     },
  //     child: Container(
  //       margin: const EdgeInsets.only(right: 24),
  //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //       decoration: BoxDecoration(
  //         color: bluePrimary30,
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: Row(
  //         spacing: 2,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           const Icon(
  //             FontAwesomeIcons.penToSquare,
  //             color: Colors.white,
  //             size: 14,
  //           ),
  //           Text(
  //             'Ubah Alat',
  //             style: AppTextStyles.primaryTextMedium.copyWith(
  //               fontSize: 12,
  //               color: Colors.white,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
