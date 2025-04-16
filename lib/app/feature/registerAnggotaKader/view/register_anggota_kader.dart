import 'package:easy_refresh/easy_refresh.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puspadaya/app/view/widget/card_anggotakader_widget.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../config/theme/pallet_color.dart';
import '../../../view/screen/error_server_screen.dart';
import '../../../view/screen/no_data_screen.dart';
import '../../../view/screen/search_not_found.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/pul_to_refresh.dart';
import '../../../view/widget/search_text_field_widget.dart';
import '../bloc/index_anggota_kader_bloc.dart';

class RegisterAnggotaKader extends StatelessWidget {
  const RegisterAnggotaKader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexAnggotaKaderBloc(),
      child: const RegisterAnggotaKaderView(),
    );
  }
}

class RegisterAnggotaKaderView extends StatefulWidget {
  const RegisterAnggotaKaderView({super.key});

  @override
  State<RegisterAnggotaKaderView> createState() =>
      _RegisterAnggotaKaderViewState();
}

class _RegisterAnggotaKaderViewState extends State<RegisterAnggotaKaderView> {
  TextEditingController _searchController = TextEditingController();

  EasyRefreshController refreshController =
      EasyRefreshController(controlFinishRefresh: true);

  // List<AnggotaKaderItemModel> listKader = [
  //   AnggotaKaderItemModel(
  //     name: 'Muhammad Kaivan Al Hakim',
  //     email: 'kaivan@gmail.com',
  //     initial: 'MK',
  //   ),
  //   AnggotaKaderItemModel(
  //     name: 'Intan wahyuni Soraya',
  //     email: 'intan@gmail.com',
  //     initial: 'IW',
  //   ),
  // ];
  bool isKetuaKader = true;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<IndexAnggotaKaderBloc>(context)
        .add(GetListAnggotaKaderEvent());
    _searchController.addListener(() {
      setState(() {}); // Rebuild untuk update pencarian
    });
  }

  @override
  Widget build(BuildContext context) {
    final indexAnggotKaderBloc =
        BlocProvider.of<IndexAnggotaKaderBloc>(context);

    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Kelola  Anggota Kader',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: bluePrimaryMain,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 38,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, CREATE_REGISTER_ANGGOTA_KADER)
              .then((value) {
            if (value != null) {
              indexAnggotKaderBloc.add(GetListAnggotaKaderEvent());
            }
          });
          // Add your navigation or functionality for adding new items
          // print("Floating Action Button Pressed");
        },
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Expanded(
                    child: SearchTextFieldWidget(
                      controller: _searchController,
                      hintText: 'Cari Data Kader',
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
                child:
                    BlocConsumer<IndexAnggotaKaderBloc, IndexAnggotaKaderState>(
                  listener: (context, state) {
                    debugPrint(state.toString());
                  },
                  builder: (context, state) {
                    if (state is IndexAnggotaKaderProcessState) {
                      return SizedBox(
                        child: Center(
                          child: SpinKitThreeBounce(
                            color: bluePrimaryMain,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    if (state is IndexAnggotaKaderSuccessState) {
                      if (state.indexAnggotaKaderResponseModel.data!.isEmpty) {
                        return const NoDataScreen();
                      }
                      final filteredList = state
                          .indexAnggotaKaderResponseModel.data!
                          .where((anggotaKader) {
                        final query = _searchController.text.toLowerCase();
                        return anggotaKader.namaLengkap
                            .toLowerCase()
                            .contains(query);
                      }).toList();
                      if (filteredList.isEmpty) {
                        return SearchNotFound();
                      }

                      return PullToRefreshWidget(
                        onRefresh: () {
                          BlocProvider.of<IndexAnggotaKaderBloc>(context)
                              .add(GetListAnggotaKaderEvent());
                        },
                        refreshController: refreshController,
                        child: ListView.builder(
                          itemCount: filteredList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: CardAnggotakaderWidget(
                                onTap: () {
                                  Navigator.pushNamed(context,
                                          DETAIL_REGISTER_ANGGOTA_KADER,
                                          arguments:
                                              filteredList[index].id)
                                      .then((value) {
                                    if (value != null) {
                                      indexAnggotKaderBloc.add(
                                          GetListAnggotaKaderEvent());
                                    }
                                  });
                                },
                                email: filteredList[index].nomorTelepon,
                                profile: filteredList[index].avatar,
                                nama: filteredList[index].namaLengkap,
                              ),
                            );
                          },
                        ),
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
