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

class AlertChooseMeasuringToolsAnak extends StatefulWidget {
  final String title;
  final VoidCallback mainButton;
  final String mainButtonMessage;
  final Color colorMainButton;

  AlatUkurSaveModel? alatUkurAnakSave;
  final AlatUkurResponseModel listAlatUkur;

  final SaveAlatUkurBloc saveAlatUkurBloc;

  AlertChooseMeasuringToolsAnak(
      {super.key,
      required this.title,
      required this.mainButton,
      required this.mainButtonMessage,
      required this.colorMainButton,
      this.alatUkurAnakSave,
      required this.listAlatUkur,
      required this.saveAlatUkurBloc});

  @override
  State<AlertChooseMeasuringToolsAnak> createState() => _AlertChooseMeasuringToolsState();
}

class _AlertChooseMeasuringToolsState extends State<AlertChooseMeasuringToolsAnak> {
  AlatUkurSaveModel alatUkurAnak = AlatUkurSaveModel();

  @override
  void initState() {
    if (widget.alatUkurAnakSave != null) {
      alatUkurAnak = widget.alatUkurAnakSave!;
      logger.i(alatUkurAnak.alatUkurBerat);
      logger.i(alatUkurAnak.alatUkurTinggi);
      logger.i(alatUkurAnak.alatUkurLingkarKepala);
      logger.i(alatUkurAnak.alatUkurLingkarLengan);
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
                value: alatUkurAnak.alatUkurTinggi,
                onChanged: (value) {
                  alatUkurAnak.alatUkurTinggi = widget.listAlatUkur.data!.firstWhere((values) => values.id == value);
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
                value: alatUkurAnak.alatUkurBerat,
                onChanged: (value) {
                  alatUkurAnak.alatUkurBerat = widget.listAlatUkur.data!.firstWhere((values) => values.id == value);
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
                value: alatUkurAnak.alatUkurLingkarLengan,
                onChanged: (value) {
                  alatUkurAnak.alatUkurLingkarLengan = widget.listAlatUkur.data!.firstWhere((values) => values.id == value);
                }, // Update selected upper arm circumference
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(16)),
              Text(
                'Lingkar Kepala',
                style: AppTextStyles.primaryTextNormal.copyWith(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(8)),
              DropdownAlatUkurWidget(
                items: widget.listAlatUkur.data!,
                itemsId: widget.listAlatUkur.data!.map((value) => value.id).toList(),
                hint: 'Lingkar Kepala',
                value: alatUkurAnak.alatUkurLingkarKepala,
                onChanged: (value) {
                  alatUkurAnak.alatUkurLingkarKepala = widget.listAlatUkur.data!.firstWhere((values) => values.id == value);
                }, // Update selected uterine fundal height
              ),
              SizedBox(height: SizeConfig.calHeightMultiplier(30)),
              BlocConsumer<SaveAlatUkurBloc, SaveAlatUkurState>(
                bloc: widget.saveAlatUkurBloc,
                listener: (context, state) {
                  logger.i(state);
                  if (state is SaveAlatUkurAnakSuccessState) {
                    Navigator.pop(context, alatUkurAnak);
                  }
                  if (state is SaveAlatUkurAnakFailedState) {
                    logger.e(state.error);
                  }
                },
                builder: (context, state) {
                  return ButtonPrimary(
                    mainButtonMessage: widget.mainButtonMessage,
                    mainButton: () {
                      if (alatUkurAnak.alatUkurBerat != null &&
                          alatUkurAnak.alatUkurTinggi != null && 
                          alatUkurAnak.alatUkurLingkarKepala != null &&
                          alatUkurAnak.alatUkurLingkarLengan != null) {
                        BlocProvider.of<SaveAlatUkurBloc>(context).add(SaveAlatUkurAnak(alatUkurAnak));
                      } else {
                        logger.e("Pilih Alat Ukur Terlebih Dahulu");
                      }
                    },
                    color: widget.colorMainButton,
                    isLoading:
                        state is SaveAlatUkurAnakProccessState ? true : null,
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
