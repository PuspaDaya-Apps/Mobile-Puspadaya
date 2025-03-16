import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/view/widget/dropdown_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/screen_config/size_config.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../../utils/logger/logger.dart';
import '../../feature/alatUkurSave/bloc/saveAlatUkurBloc/save_alat_ukur_bloc.dart';
import '../../model/alat_ukur_response_model.dart';
import '../../model/alat_ukur_save_model.dart';
import 'dropdown_alat_ukur_widget.dart';

class AlertChooseMeasuringToolsIbuHamil extends StatefulWidget {
  final String title;
  final VoidCallback mainButton;
  final String mainButtonMessage;
  final Color colorMainButton;

  AlatUkurSaveModel? alatUkurIbuHamilSave;
  final AlatUkurResponseModel listAlatUkur;

  final SaveAlatUkurBloc saveAlatUkurBloc;

  AlertChooseMeasuringToolsIbuHamil(
      {super.key,
      required this.title,
      required this.mainButton,
      required this.mainButtonMessage,
      required this.colorMainButton,
      this.alatUkurIbuHamilSave,
      required this.listAlatUkur,
      required this.saveAlatUkurBloc});

  @override
  State<AlertChooseMeasuringToolsIbuHamil> createState() => _AlertChooseMeasuringToolsState();
}

class _AlertChooseMeasuringToolsState extends State<AlertChooseMeasuringToolsIbuHamil> {
  AlatUkurSaveModel alatUkurIbuHamil = AlatUkurSaveModel();

  @override
  void initState() {
    if (widget.alatUkurIbuHamilSave != null) {
      alatUkurIbuHamil = widget.alatUkurIbuHamilSave!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.saveAlatUkurBloc,
      child: AlertDialog(
        scrollable: true, // Make the dialog scrollable
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  widget.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.calHeightMultiplier(16),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(16)),
              Text(
                'Tinggi Badan',
                style: AppTextStyles.primaryTextNormal.copyWith(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(8)),
              DropdownAlatUkurWidget(
                items: widget.listAlatUkur.data!,
                itemsId: widget.listAlatUkur.data!.map((value) => value.id).toList(),
                hint: 'Tinggi Badan',
                value: alatUkurIbuHamil.alatUkurTinggi,
                onChanged: (value) {
                  alatUkurIbuHamil.alatUkurTinggi = widget.listAlatUkur.data!.firstWhere((values) => values.id == value);
                }, // Update selected height
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(16)),
              Text(
                'Berat Badan',
                style: AppTextStyles.primaryTextNormal.copyWith(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(8)),
              DropdownAlatUkurWidget(
                items: widget.listAlatUkur.data!,
                itemsId: widget.listAlatUkur.data!.map((value) => value.id).toList(),
                hint: 'Berat Badan',
                value: alatUkurIbuHamil.alatUkurBerat,
                onChanged: (value) {
                  alatUkurIbuHamil.alatUkurBerat = widget.listAlatUkur.data!.firstWhere((values) => values.id == value);
                }, // Update selected weight
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(16)),
              Text(
                'Lingkar Lengan Atas',
                style: AppTextStyles.primaryTextNormal.copyWith(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(8)),
              DropdownAlatUkurWidget(
                items: widget.listAlatUkur.data!,
                itemsId: widget.listAlatUkur.data!.map((value) => value.id).toList(),
                hint: 'Lingkar Lengan Atas',
                value: alatUkurIbuHamil.alatUkurLingkarLengan,
                onChanged: (value) {
                  alatUkurIbuHamil.alatUkurLingkarLengan = widget.listAlatUkur.data!.firstWhere((values) => values.id == value);
                }, // Update selected upper arm circumference
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(16)),
              Text(
                'Tinggi Fundus Uteri',
                style: AppTextStyles.primaryTextNormal.copyWith(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(8)),
              DropdownAlatUkurWidget(
                items: widget.listAlatUkur.data!,
                itemsId: widget.listAlatUkur.data!.map((value) => value.id).toList(),
                hint: 'Tinggi Fundus Uteri',
                value: alatUkurIbuHamil.alatUkurTinggiFundus,
                onChanged: (value) {
                  alatUkurIbuHamil.alatUkurTinggiFundus = widget.listAlatUkur.data!.firstWhere((values) => values.id == value);
                }, // Update selected uterine fundal height
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(30)),
              BlocConsumer<SaveAlatUkurBloc, SaveAlatUkurState>(
                bloc: widget.saveAlatUkurBloc,
                listener: (context, state) {
                  logger.i(state);
                  if (state is SaveAlatUkurIbuHamilSuccessState) {
                    Navigator.pop(context, alatUkurIbuHamil);
                  }
                  if (state is SaveAlatUkurIbuHamilFailedState) {
                    logger.e(state.error);
                  }
                },
                builder: (context, state) {
                  return ButtonPrimary(
                    mainButtonMessage: widget.mainButtonMessage,
                    mainButton: () {
                      if (alatUkurIbuHamil.alatUkurBerat != null &&
                          alatUkurIbuHamil.alatUkurTinggi != null && 
                          alatUkurIbuHamil.alatUkurLingkarLengan != null &&
                          alatUkurIbuHamil.alatUkurTinggiFundus != null) {
                        BlocProvider.of<SaveAlatUkurBloc>(context).add(SaveAlatUkurIbuHamil(alatUkurIbuHamil));
                      } else {
                        logger.e("Pilih Alat Ukur Terlebih Dahulu");
                      }
                    },
                    color: widget.colorMainButton,
                    isLoading:
                        state is SaveAlatUkurIbuHamilProccessState ? true : null,
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
