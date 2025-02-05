import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puspadaya/app/feature/Kehadiran/model/list_data_anak_model.dart';
import 'package:puspadaya/app/feature/PengukuranTamu/create/view/create_pengukuran_tamu.dart';
import 'package:puspadaya/app/view/widget/alert_dialog_content.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/utils/helper/helper_core.dart';

import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/theme/text_style.dart';
import '../../../../../config/validator/validator.dart';
import '../../../../view/widget/date_time_picker_widget.dart';
import '../../../../view/widget/textField_widget.dart';

class SearchAnak extends StatelessWidget {
  const SearchAnak({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchAnakView();
  }
}

class SearchAnakView extends StatefulWidget {
  const SearchAnakView({super.key});

  @override
  State<SearchAnakView> createState() => _SearchAnakViewState();
}

class _SearchAnakViewState extends State<SearchAnakView> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _tempatController = TextEditingController();
  final String date = HelperCore.convertformatDateToIndonesian( DateTime.now());
  final _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    _searchController.dispose();
    _tempatController.dispose();
    super.dispose();
  }

  final List<ListDataAnakModel> dataPosyandu = [
    ListDataAnakModel(
      nik: '362155428233263',
      namaIbu: 'Aisyah Zahra Putri',
      nama: 'Muhammad Kaivan Al Hakim',
    ),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Pilih Anak',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: dataPosyandu.length,
          itemBuilder: (context, index) {
            ListDataAnakModel dataPosyanduItem = dataPosyandu[index];
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
              child: Card(
                color: Colors.white,
                shadowColor: Colors.black.withOpacity(0.1),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  onTap: () {
                    String nama = dataPosyanduItem.nama;
                    String nik = dataPosyanduItem.nik!;
                    String namaIbu = dataPosyanduItem.namaIbu!;
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialogContent(
                          title: 'Anak',
                          content: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'NIK : $nik',
                                  style:
                                      AppTextStyles.primaryTextNormal.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Nama : $nama',
                                  style:
                                      AppTextStyles.primaryTextNormal.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Nama Ibu : $namaIbu',
                                  style:
                                      AppTextStyles.primaryTextNormal.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 2,
                                  color: Colors.black54,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Pengukuran Terakhir',
                                  style:
                                      AppTextStyles.primaryTextNormal.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16)),
                                const Text(
                                  'Tempat',
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(8)),
                                TextFieldWidget(
                                  controller: _tempatController,
                                  hintText: "Tempat",
                                  isPasswordField: false,
                                  keyboardType: TextInputType.text,
                                  obscureText: false,
                                  validators: [
                                    (value) => Validator.required(
                                        value, "Kata sandi tidak boleh kosong"),
                                  ],
                                ),
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16)),
                                const Text(
                                  'Tanggal',
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(8)),
                                InfoFieldWidget(text: '${date}'),
                                SizedBox(
                                    height: SizeConfig.calHeightMultiplier(16)),
                              ],
                            ),
                          ),
                          mainButton: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CreatePengukuranTamu();
                                  },
                                ),
                              );
                            }
                          },
                          mainButtonMessage: 'Tambah Pengukuran',
                          colorMainButton: bluePrimaryMain,
                        );
                      },
                    );
                  },
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: bluePrimary50,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          dataPosyanduItem.nama,
                          style: AppTextStyles.primaryTextMedium.copyWith(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "NIK : ",
                              style: AppTextStyles.primaryTextNormal.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            TextSpan(
                              text: dataPosyanduItem.nik!,
                              style: AppTextStyles.primaryTextNormal.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Nama Ibu: ",
                              style: AppTextStyles.primaryTextNormal.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            TextSpan(
                              text: dataPosyanduItem.namaIbu!,
                              style: AppTextStyles.primaryTextNormal.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: bluePrimary50,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
