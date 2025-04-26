import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:puspadaya/app/view/widget/alert_dialog_content.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/info_field_widget.dart';
import 'package:puspadaya/utils/helper/helper_core.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/theme/text_style.dart';
import '../../../../model/paketToScreen/paket_to_create_pengukuran_tamu_model.dart';
import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/screen/no_data_screen.dart';
// ignore: library_prefixes
import '../../../../view/screen/search_not_found.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../bloc/getAnakTamuBloc/get_anak_tamu_bloc.dart';
import '../model/get_list_posyandu_response_model.dart' show Data;
import 'create_pengukuran_tamu.dart';

class SearchAnak extends StatelessWidget {
  const SearchAnak({super.key, required this.dataPosyandu});
  final Data dataPosyandu;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAnakTamuBloc(),
      child: SearchAnakView(
        dataPosyandu: dataPosyandu,
      ),
    );
  }
}

class SearchAnakView extends StatefulWidget {
  const SearchAnakView({super.key, required this.dataPosyandu});
  final Data dataPosyandu;

  @override
  State<SearchAnakView> createState() => _SearchAnakViewState();
}

class _SearchAnakViewState extends State<SearchAnakView> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _tempatController = TextEditingController();
  final String date = HelperCore.convertformatDateToIndonesian(DateTime.now());

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAnakTamuBloc>(context)
        .add(GetAnakTamu(widget.dataPosyandu.id));
    _searchController.addListener(() {
      setState(() {}); // Rebuild untuk update pencarian
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tempatController.dispose();
    super.dispose();
  }

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
        child: BlocConsumer<GetAnakTamuBloc, GetAnakTamuState>(
          listener: (context, state) {
            debugPrint(state.toString());
            if (state is GetAnakTamuFailedState) {
              debugPrint(state.error);
              showTopSnackBar(
                  Overlay.of(context),
                  animationDuration: const Duration(milliseconds: 600),
                  displayDuration: const Duration(milliseconds: 2200),
                  reverseAnimationDuration: const Duration(milliseconds: 300),
                  TopSnackbarWidget().error(state.error));
            }
          },
          builder: (context, state) {
            if (state is GetAnakTamuProccessState) {
              return SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: Center(
                    child: CircularProgressIndicator(
                  color: bluePrimaryMain,
                )),
              );
            }
            if (state is GetAnakTamuSuccessState) {
              final filteredList =
                  state.getListTamuResponseModel.data!.where((anak) {
                final query = _searchController.text.toLowerCase();
                return anak.namaAnak.toLowerCase().contains(query);
              }).toList();
              if (filteredList.isEmpty) {
                return SearchNotFound();
              }
              if (state.getListTamuResponseModel.data!.isEmpty) {
                return SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    child: const NoDataScreen());
              }

              return ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 4),
                    child: Card(
                      color: Colors.white,
                      shadowColor: Colors.black.withValues(alpha: .1),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        onTap: () {
                          String nama = filteredList[index].namaAnak;
                          String nik =
                              filteredList[index].nik;
                          String namaIbu = filteredList[index].kartuKeluarga.ibu.namaIbu;
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialogContent(
                                title: 'Anak',
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'NIK : $nik',
                                      style: AppTextStyles.primaryTextNormal
                                          .copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      'Nama : $nama',
                                      style: AppTextStyles.primaryTextNormal
                                          .copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      'Nama Ibu : $namaIbu',
                                      style: AppTextStyles.primaryTextNormal
                                          .copyWith(
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
                                      style: AppTextStyles.primaryTextNormal
                                          .copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.calHeightMultiplier(16)),
                                    const Text(
                                      'Tempat',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.calHeightMultiplier(8)),
                                    InfoFieldWidget(
                                        text: filteredList[index]
                                                .pengukuran
                                                ?.posyandu
                                                .namaPosyandu ??
                                            "Belum Melakukan Pengukuran"),
                                    SizedBox(
                                        height:
                                            SizeConfig.calHeightMultiplier(16)),
                                    const Text(
                                      'Tanggal',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.calHeightMultiplier(8)),
                                    InfoFieldWidget(
                                        text: filteredList[index].pengukuran !=
                                                null
                                            ? DateFormat("d MMMM y", "ID_id")
                                                .format(filteredList[index]
                                                    .pengukuran!
                                                    .tanggalPengukuran)
                                            : "Belum Melakukan Pengukuran"),
                                    SizedBox(
                                        height:
                                            SizeConfig.calHeightMultiplier(16)),
                                  ],
                                ),
                                mainButton: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return CreatePengukuranTamu(
                                          dataAnak:
                                              PaketToCreatePengukuranTamuModel(
                                                  dataPosyandu:
                                                      widget.dataPosyandu,
                                                  dataTamu: filteredList[index]),
                                        );
                                      },
                                    ),
                                  );
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
                                filteredList[index]
                                    .namaAnak,
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
                                    style: AppTextStyles.primaryTextNormal
                                        .copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: filteredList[index].nik,
                                    style: AppTextStyles.primaryTextNormal
                                        .copyWith(
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
                                    style: AppTextStyles.primaryTextNormal
                                        .copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: filteredList[index].kartuKeluarga.ibu.namaIbu,
                                    style: AppTextStyles.primaryTextNormal
                                        .copyWith(
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
              );
            }

            return SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: ErrorServerScreen());
          },
        ),
      ),
    );
  }
}
