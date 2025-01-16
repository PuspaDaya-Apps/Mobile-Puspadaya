import 'dart:ffi';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/createPengukuranBalita/bloc/cubit/search_balita_cubit.dart';
import 'package:puspadaya/app/feature/createPengukuranBalita/view/search_balita.dart';
import 'package:puspadaya/app/view/widget/appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/view/widget/dropdown_widget.dart';
import 'package:puspadaya/app/view/widget/textField_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';
import 'package:puspadaya/config/validator/pengukuran_balita_validator.dart';

class CreatePengukuranBalita extends StatelessWidget {
  const CreatePengukuranBalita({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBalitaCubit(),
      child: const CreatePengukuranBalitaView(),
    );
  }
}

class CreatePengukuranBalitaView extends StatefulWidget {
  const CreatePengukuranBalitaView({super.key});

  @override
  State<CreatePengukuranBalitaView> createState() =>
      _CreatePengukuranBalitaViewState();
}

class _CreatePengukuranBalitaViewState
    extends State<CreatePengukuranBalitaView> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _nikController = TextEditingController();
  bool _isExpanded = false;
  final _formKey = GlobalKey<FormState>();
  String selectedPosyandu = 'Posyandu A';
  String selectedPosition = 'Terlentang';

  final List<String> selectPosyandu = [
    'Posyandu A',
    'Posyandu B',
    'Posyandu C',
    'Posyandu D'
  ];

  final List<String> selectPosition = [
    'Terlentang',
    'Berdiri',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: "Create Pengukuran Balita",
        actions: [],
        onBackPressed: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Nama',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  BlocListener<SearchBalitaCubit, SearchBalitaState>(
                    listener: (context, state) {
                      if (state is SearchBalitaSelected) {
                        _nameController.text = state.name;
                      }
                    },
                    child: TextFormFieldSearch(nameController: _nameController),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'NIK',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  TextFieldWidget(
                    controller: _nikController,
                    hintText: "NIK",
                    isPasswordField: false,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    validator: (value) {},
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Usia',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  TextFieldWidget(
                    controller: _nikController,
                    hintText: "Usia",
                    isPasswordField: false,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    validator: (value) {},
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize:
                          MainAxisSize.min, // Ukuran Row hanya mengikuti konten
                      children: [
                        Text(
                          'Detail Anak',
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
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: Colors.black54,
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Tempat Pengukuran',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  DropdownWidget(
                    items: selectPosyandu,
                    hint: 'Pilih Tempat Posyandu',
                    value: selectedPosyandu,
                    onChanged: (value) {
                      setState(() {
                        selectedPosyandu = value;
                      });
                    },
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                  const Text(
                    'Posisi Pengukuran Tinggi Badan',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.calHeightMultiplier(8),
                  ),
                  DropdownWidget(
                    items: selectPosition,
                    hint: 'Pilih Posisi Pengukuran Tinggi Badan',
                    value: selectedPosition,
                    onChanged: (value) {
                      setState(() {
                        selectedPosition = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFormFieldSearch extends StatelessWidget {
  const TextFormFieldSearch({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        PengukuranBalitaValidator.validateNama(value!);
      },
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchBalita(),
          ),
        );
        if (result != null) {
          context.read<SearchBalitaCubit>().selectBalita(result);
        }
      },
      controller: _nameController,
      style: Theme.of(context).textTheme.bodySmall,
      keyboardType: TextInputType.text,
      obscureText: false,
      decoration: InputDecoration(
        suffixIcon: Icon(
          FluentIcons.search_24_regular,
        ),
        hintText: 'Pilih Anak',
        hintStyle:
            Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),
        filled: true,
        fillColor: backgroundWhite10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: bluePrimaryMain),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: Colors.red),
        ),
      ),
    );
  }
}
