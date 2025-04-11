import 'package:easy_refresh/easy_refresh.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puspadaya/app/view/widget/card_ibuhamil_widget.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../config/theme/pallet_color.dart';
import '../../../view/screen/data_not_found_screen.dart';
import '../../../view/screen/no_data_screen.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/pul_to_refresh.dart';
import '../../../view/widget/search_text_field_widget.dart';
import '../bloc/get_index_ibu_hamil_bloc.dart';

class RegisterIbuHamil extends StatelessWidget {
  const RegisterIbuHamil({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIndexIbuHamilBloc(),
      child: const RegisterIbuHamilView(),
    );
  }
}

class RegisterIbuHamilView extends StatefulWidget {
  const RegisterIbuHamilView({super.key});

  @override
  State<RegisterIbuHamilView> createState() => _RegisterIbuHamilViewState();
}

class _RegisterIbuHamilViewState extends State<RegisterIbuHamilView> {
  TextEditingController _searchController = TextEditingController();
  EasyRefreshController refreshController = EasyRefreshController(controlFinishRefresh: true);

  @override
  void initState() {
    context.read<GetIndexIbuHamilBloc>().add(FetchIndexIbuHamil());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Ibu Hamil',
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
          Navigator.pushNamed(context, CREATE_REGISTER_IBU_HAMIL).then((value) {
            if (value != null) {
              BlocProvider.of<GetIndexIbuHamilBloc>(context)
                  .add(FetchIndexIbuHamil());
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
                      hintText: 'Cari Data Ibu Hamil',
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
                child: BlocBuilder<GetIndexIbuHamilBloc, GetIndexIbuHamilState>(
                  builder: (context, state) {
                    if (state is GetIndexIbuHamilLoading) {
                      return SizedBox(
                        child: Center(
                          child: SpinKitThreeBounce(
                            color: bluePrimaryMain,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    if (state is GetIndexIbuHamilFailed) {
                      return Center(
                        child: Text(
                            'Gagal Mendapatkan Data Ibu Hamil ${state.message}'),
                      );
                    }
                    if (state is GetIndexIbuHamilSuccess) {
                      if (state.data.data.isEmpty) {
                        return NoDataScreen();
                      }
                      return PullToRefreshWidget(
                        onRefresh: () {
                          context.read<GetIndexIbuHamilBloc>().add(FetchIndexIbuHamil());
                        },
                        refreshController: refreshController,
                        child: ListView.builder(
                          itemCount: state.data.data.length,
                          itemBuilder: (context, index) {
                            final orangTua = state.data.data[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: CardIbuHamilWidget(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    DETAIL_REGISTER_IBU_HAMIL,
                                    arguments: orangTua.id,
                                  );
                                },
                                nama: orangTua.namaIbu,
                                nik: orangTua.nik,
                                bulan: orangTua.usiaKehamilan,
                                isUpdate: orangTua.updatedAt != null ? true : null,
                                inRegister: true,
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return Container();
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
