import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/route/route_name.dart';
import '../../../../../config/screen_config/image_config.dart';
import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/text_style.dart';
import '../../../../view/widget/alert_dialog_widget.dart';
import '../../../../view/widget/appbar_widget.dart';
import '../../../../view/widget/info_field_widget.dart';
import '../../model/alat_ukur_Item_model.dart';

class DetailAlatUkur extends StatelessWidget {
  final AlatUkurItemModel alatUkur;

  DetailAlatUkur({super.key, required this.alatUkur});

  @override
  Widget build(BuildContext context) {
    return DetailAlatUkurView(alatUkur: alatUkur);
  }
}

class DetailAlatUkurView extends StatefulWidget {
  final AlatUkurItemModel alatUkur;

  DetailAlatUkurView({super.key, required this.alatUkur});

  @override
  State<DetailAlatUkurView> createState() => _DetailAlatUkurViewState();
}

class _DetailAlatUkurViewState extends State<DetailAlatUkurView> {
  final TextEditingController _otherController = TextEditingController();

  List<Map<String, dynamic>> alatDeteksiDini = [
    {'label': 'Kubus', 'isChecked': false, 'isOther': false},
    {'label': 'Lonceng', 'isChecked': true, 'isOther': false},
    {'label': 'Kartu Bergambar', 'isChecked': true, 'isOther': false},
    {'label': 'Bola Ulir', 'isChecked': false, 'isOther': false},
    {'label': 'Lainnya', 'isChecked': false, 'isOther': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Detail Alat Ukur',
        onBackPressed: () {
          Navigator.pop(context);
        },
        background: Colors.white,
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Jenis Alat',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                InfoFieldWidget(text: '${widget.alatUkur.nama}'),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                if (widget.alatUkur.nama ==
                    'Alat Deteksi Dini Perkembangan (SDIDTK kit)') ...[
                  const Text(
                    'Alat Deteksi Dini (opsional)',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                  Column(
                    children: alatDeteksiDini.map((alat) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IntrinsicWidth(
                            child: CheckboxListWidget(
                              isChecked: alat['isChecked'],
                              label: alat['label'],
                              onChanged: (value) {},
                            ),
                          ),
                          if (alat['isOther'] == true &&
                              alat['isChecked'] == true) ...[
                            const SizedBox(
                                width: 4), // Jarak antara checkbox dan input
                            Expanded(
                              child: TextField(
                                enabled: alat['isChecked'],
                                controller: _otherController,
                                decoration: const InputDecoration(
                                  border:
                                      UnderlineInputBorder(), // Menghilangkan outline
                                  isDense: true, // Memperkecil tinggi input
                                ),
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ],
                      );
                    }).toList(),
                  ),
                ] else
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(8), // Berikan border radius
                    child: Image.asset(
                      widget.alatUkur.image!,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Merek Alat',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                InfoFieldWidget(text: widget.alatUkur.merek),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                const Text(
                  'Kondisi Alat',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                InfoFieldWidget(text: widget.alatUkur.kondisi),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                ButtonPrimary(
                  color: goldPrimaryMain,
                  mainButtonMessage: 'Perbarui',
                  mainButton: () {
                    Navigator.pushNamed(context, UPDATE_ALAT_UKUR);
                  },
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
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
                          mainButton: () {},
                          image: imageDeleteItems,
                          mainButtonMessage: 'Iya, Hapus Alat Ukur',
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
      ),
    );
  }
}

class CheckboxListWidget extends StatelessWidget {
  final bool isChecked;
  final String label;
  final ValueChanged<bool?> onChanged;

  const CheckboxListWidget({
    Key? key,
    required this.isChecked,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            side: BorderSide(color: stroke10, width: 2),
            activeColor: bluePrimaryMain,
            checkColor: Colors.white,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: isChecked,
            onChanged: onChanged,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(!isChecked),
              child: Text(
                label,
                style: AppTextStyles.primaryTextNormal.copyWith(fontSize: 12),
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
