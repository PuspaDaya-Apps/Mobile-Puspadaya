import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/screen/no_data_screen.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../bloc/getPosyanduBloc/get_posyandu_bloc.dart';
import 'search_anak.dart';
import 'package:puspadaya/app/view/widget/search_text_field_widget.dart';

import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/theme/text_style.dart';
import '../../../Kehadiran/model/list_data_tamu_model.dart';

class SearchPosyandu extends StatelessWidget {
  const SearchPosyandu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetPosyanduBloc(),
      child: const SearchPosyanduView(),
    );
  }
}

class SearchPosyanduView extends StatefulWidget {
  const SearchPosyanduView({super.key});

  @override
  State<SearchPosyanduView> createState() => _SearchPosyanduViewState();
}

class _SearchPosyanduViewState extends State<SearchPosyanduView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<GetPosyanduBloc>(context).add(GetPosyandu());
    super.initState();
  }

  @override
  void dispose() {
    _searchController
        .dispose(); // Pastikan controller dibuang setelah tidak digunakan
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final getPosyanduBloc = BlocProvider.of<GetPosyanduBloc>(context);

    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: SearchTextFieldWidget(
          hintText: 'Cari Posyandu',
          controller: _searchController,
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<GetPosyanduBloc, GetPosyanduState>(
          listener: (context, state) {
            debugPrint(state.toString());
              if (state is GetPosyanduFailedState) {
                debugPrint(state.error);
                showTopSnackBar(
                  Overlay.of(context),
                  animationDuration: const Duration(
                    milliseconds: 600
                  ),
                  displayDuration: const Duration(
                    milliseconds: 2200
                  ),
                  reverseAnimationDuration: const Duration(
                    milliseconds: 300
                  ),
                  TopSnackbarWidget().error(state.error)
                );
              }
          },
          builder: (context, state) {
            if(state is GetPosyanduProccessState) {
              return SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: Center(
                  child:CircularProgressIndicator(
                    color: bluePrimaryMain,
                  ) 
                  ),
              );
            }
            if(state is GetPosyanduSuccessState) {
              if (state.getListPosyanduResponseModel.data!.isEmpty) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  child: const NoDataScreen()
                );
              }
              return ListView.builder(
                itemCount: state.getListPosyanduResponseModel.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
                    child: Card(
                      color: Colors.white,
                      shadowColor:Colors.black.withOpacity(0.1), // Bayangan lebih soft
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return SearchAnak(
                                dataPosyandu: state.getListPosyanduResponseModel.data![index],
                              );
                            },
                          ));
                        },
                        leading: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: bluePrimaryMain.withValues(
                                alpha: 0.3), // Warna latar belakang agar lebih menarik
                            shape: BoxShape.circle, // Bentuk ikon bulat
                          ),
                          child: const FaIcon(
                            size: 20,
                            FontAwesomeIcons.houseChimneyMedical,
                            color: bluePrimaryMain,
                          ),
                        ),
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
                                state.getListPosyanduResponseModel.data![index].namaPosyandu,
                                style: AppTextStyles.primaryTextMedium.copyWith(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4), // Jarak antar teks
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Alamat: ",
                                    style:
                                        AppTextStyles.primaryTextNormal.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: state.getListPosyanduResponseModel.data![index].alamat 
                                    ?? "${state.getListPosyanduResponseModel.data![index].dusun.namaDusun}, ${state.getListPosyanduResponseModel.data![index].dusun.desaKelurahan.namaDesaKelurahan}, ${state.getListPosyanduResponseModel.data![index].dusun.desaKelurahan.kecamatan.namaKecamatan}",
                                    style:
                                        AppTextStyles.primaryTextNormal.copyWith(
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
              child: ErrorServerScreen()
            );
          },
        ),
      ),
    );
  }
}
