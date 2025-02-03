import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/utils/logger/logger.dart';

import '../../../../config/theme/pallet_color.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/card_orangtua_widget.dart';
import '../../../view/widget/search_text_field_widget.dart';
import '../../registerOrangTua/bloc/register_orang_tua_bloc.dart';
import '../../registerOrangTua/model/orang_tua_item_model.dart';

class SearchKartuKeluarga extends StatefulWidget {
  SearchKartuKeluarga({super.key});

  @override
  State<SearchKartuKeluarga> createState() => _SearchKartuKeluargaState();
}

class _SearchKartuKeluargaState extends State<SearchKartuKeluarga> {
  TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<RegisterOrangTuaBloc>().add(FetchOrangTua());
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: bluePrimaryMain,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 38,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
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
              BlocBuilder<RegisterOrangTuaBloc, RegisterOrangTuaState>(
                builder: (context, state) {
                  logger.d(state);
                  if (state is RegisterOrangTuaLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is RegisterOrangTuaFailure) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else if (state is RegisterOrangTuaSuccess) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.orangTuaList.length,
                        itemBuilder: (context, index) {
                          OrangTuaItemModel orangTua =
                              state.orangTuaList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: CardOrangtuaWidget(
                              onTap: () {
                                Navigator.pop(context, orangTua);
                              },
                              kk: orangTua.kk,
                              namaAyah: orangTua.husband,
                              namaIbu: orangTua.wife,
                              profile: orangTua.initial,
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
