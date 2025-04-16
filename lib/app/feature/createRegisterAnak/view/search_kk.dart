import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../config/theme/pallet_color.dart';
import '../../../model/paketToScreen/paket_to_create_anak_model.dart';
import '../../../view/screen/error_server_screen.dart';
import '../../../view/screen/no_data_screen.dart';
import '../../../view/screen/search_not_found.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/card_orangtua_widget.dart';
import '../../../view/widget/search_text_field_widget.dart';

import '../bloc/getListOrangTuaBloc/get_lis_orang_tua_bloc.dart';

class SearchKartuKeluarga extends StatelessWidget {
  const SearchKartuKeluarga({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetLisOrangTuaBloc(),
      child: const SearchKartuKeluargaView(),
    );
  }
}

class SearchKartuKeluargaView extends StatefulWidget {
  const SearchKartuKeluargaView({super.key});

  @override
  State<SearchKartuKeluargaView> createState() =>
      _SearchKartuKeluargaViewState();
}

class _SearchKartuKeluargaViewState extends State<SearchKartuKeluargaView> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetLisOrangTuaBloc>(context).add(GetListOrangTua());
    searchController.addListener(() {
      setState(() {}); // Rebuild untuk update pencarian
    });
  }

  // List<OrangTuaItemModel> listOrangTua = [
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Pilih KK',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Expanded(
                    child: SearchTextFieldWidget(
                      controller: searchController,
                      hintText: 'Cari Data Orang Tua',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      size: 30,
                      FluentIcons.filter_24_filled,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: BlocConsumer<GetLisOrangTuaBloc, GetLisOrangTuaState>(
                  listener: (context, state) {
                    debugPrint(state.toString());
                    if (state is GetListOrangTuaFailedState) {}
                  },
                  builder: (context, state) {
                    if (state is GetListOrangTuaProccessState ||
                        state is GetListOrangTuaTokenExpiredState) {
                      return SizedBox(
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width,
                        child: Center(
                          child: SpinKitThreeBounce(
                            color: bluePrimaryMain,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    if (state is GetListOrangTuaSuccessState) {
                      if (state.getListOrangTuaResponseModel.data!.isEmpty) {
                        return const NoDataScreen();
                      }
                      final filteredList = state
                          .getListOrangTuaResponseModel.data!
                          .where((searchKK) {
                        final query = searchController.text.toLowerCase();
                        return searchKK.ayah.namaAyah
                                .toLowerCase()
                                .contains(query) ||
                            searchKK.ibu.namaIbu.toLowerCase().contains(query);
                      }).toList();
                      if (filteredList.isEmpty) {
                        return SearchNotFound();
                      }
                      return ListView.builder(
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: CardOrangtuaWidget(
                              onTap: () {
                                Navigator.pop(
                                  context,
                                  PaketToCreateAnakModel(
                                    provinsi: filteredList[index]
                                        .ibu
                                        .dusun
                                        .desaKelurahan
                                        .kecamatan
                                        .kabupatenKota
                                        .provinsi
                                        .namaProvinsi,
                                    idKartuKeluarga: filteredList[index]
                                        .ibu
                                        .kartuKeluarga
                                        .id,
                                    nomorKartuKeluarga: filteredList[index]
                                        .ibu
                                        .kartuKeluarga
                                        .nomorKartuKeluarga,
                                    namaAyah: filteredList[index].ayah.namaAyah,
                                    namaIbu: filteredList[index].ibu.namaIbu,
                                    kabupaten: filteredList[index]
                                        .ibu
                                        .dusun
                                        .desaKelurahan
                                        .kecamatan
                                        .kabupatenKota
                                        .namaKabupatenKota,
                                    kecamatan: filteredList[index]
                                        .ibu
                                        .dusun
                                        .desaKelurahan
                                        .kecamatan
                                        .namaKecamatan,
                                  ),
                                );
                              },
                              kk: filteredList[index]
                                  .ayah
                                  .kartuKeluarga
                                  .nomorKartuKeluarga,
                              namaAyah: filteredList[index].ayah.namaAyah,
                              namaIbu: filteredList[index].ibu.namaIbu,
                              profile: filteredList[index].avatarOrangTua,
                            ),
                          );
                        },
                      );
                    }
                    return const ErrorServerScreen();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
