import 'package:easy_refresh/easy_refresh.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/card_orangtua_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/route/route_name.dart';
import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../config/theme/pallet_color.dart';
import '../../../view/screen/no_data_screen.dart';
import '../../../view/screen/search_not_found.dart';
import '../../../view/widget/pul_to_refresh.dart';
import '../../../view/widget/search_text_field_widget.dart';
import '../bloc/register_orang_tua_bloc.dart';

class RegisterOrangTua extends StatelessWidget {
  const RegisterOrangTua({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterOrangTuaBloc(),
      child: const RegisterOrangTuaView(),
    );
  }
}

class RegisterOrangTuaView extends StatefulWidget {
  const RegisterOrangTuaView({super.key});

  @override
  State<RegisterOrangTuaView> createState() => _RegisterOrangTuaViewState();
}

class _RegisterOrangTuaViewState extends State<RegisterOrangTuaView> {
  TextEditingController _searchController = TextEditingController();
  EasyRefreshController refreshController =
      EasyRefreshController(controlFinishRefresh: true);

  @override
  void initState() {
    super.initState();
    // Trigger fetch event when the view is initialized
    logger.d('trigger fetch');
    context.read<RegisterOrangTuaBloc>().add(FetchOrangTua());
    _searchController.addListener(() {
      setState(() {}); // Rebuild untuk update pen35carian
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Orang Tua',
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
          Navigator.pushNamed(context, CREATE_REGISTER_ORANG_TUA).then((value) {
            if (value != null) {
              context.read<RegisterOrangTuaBloc>().add(FetchOrangTua());
            }
          });
          // Add your navigation or functionality for adding new items
          print("Floating Action Button Pressed");
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
                child: BlocBuilder<RegisterOrangTuaBloc, RegisterOrangTuaState>(
                  builder: (context, state) {
                    if (state is RegisterOrangTuaLoading) {
                      return SizedBox(
                        child: Center(
                          child: SpinKitThreeBounce(
                            color: bluePrimaryMain,
                            size: 50.0,
                          ),
                        ),
                      );
                    } else if (state is RegisterOrangTuaSuccess) {
                      if (state.orangTuaList.isEmpty) {
                        return const NoDataScreen();
                      }
                      // Render your list of Orang Tua here
                      final filteredList = state.orangTuaList.where((orangTua) {
                        final query = _searchController.text.toLowerCase();
                        return orangTua.husband.toLowerCase().contains(query) ||
                            orangTua.wife.toLowerCase().contains(query) ||
                            orangTua.kk.toLowerCase().contains(query);
                      }).toList();
                      if (filteredList.isEmpty) {
                        return SearchNotFound();
                      }
                      return PullToRefreshWidget(
                        onRefresh: () {
                          context
                              .read<RegisterOrangTuaBloc>()
                              .add(FetchOrangTua());
                        },
                        refreshController: refreshController,
                        child: ListView.builder(
                          itemCount: filteredList
                              .length, // Ganti dengan data yang diambil
                          itemBuilder: (context, index) {
                            final orangTua = filteredList[index]; //
                            // Ganti dengan data yang diambil
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: CardOrangtuaWidget(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    DETAIL_REGISTER_ORANG_TUA,
                                    arguments: orangTua.ayahId,
                                  );
                                },
                                kk: orangTua.kk,
                                namaAyah: orangTua.husband,
                                namaIbu: orangTua.wife,
                                profile: orangTua.initial,
                                isUpdate: orangTua.updatedAtAyah != null ||
                                        orangTua.updatedAtIbu != null
                                    ? true
                                    : null,
                                inRegister: true,
                              ),
                            );
                          },
                        ),
                      );
                    } else if (state is RegisterOrangTuaFailure) {
                      return Center(child: Text('Error: ${state.error}'));
                    }
                    return Center(child: Text('No data available'));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
