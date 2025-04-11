import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../config/theme/pallet_color.dart';
import '../../../view/screen/error_server_screen.dart';
import '../../../view/screen/no_data_screen.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/card_pengasuh_widget.dart';
import '../../../view/widget/search_text_field_widget.dart';
import '../bloc/pengasuh_posyandu_bloc.dart';

class RegisterPengasuh extends StatelessWidget {
  const RegisterPengasuh({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PengasuhPosyanduBloc(),
      child: const RegisterPengasuhView(),
    );
  }
}

class RegisterPengasuhView extends StatefulWidget {
  const RegisterPengasuhView({super.key});

  @override
  State<RegisterPengasuhView> createState() => _RegisterPengasuhViewState();
}

class _RegisterPengasuhViewState extends State<RegisterPengasuhView> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PengasuhPosyanduBloc>(context).add(GetListPengasuh());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Pengasuh',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
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
                      hintText: 'Cari Data Pengasuh',
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
                    BlocConsumer<PengasuhPosyanduBloc, PengasuhPosyanduState>(
                  listener: (context, state) {
                    debugPrint(state.toString());
                  },
                  builder: (context, state) {
                    if (state is PengasuhPosyanduLoading) {
                      return SizedBox(
                        child: Center(
                          child: SpinKitThreeBounce(
                            color: bluePrimaryMain,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    if (state is PengasuhPosyanduSuccess) {
                      if (state.pengasuhResponseModel.data!.isEmpty) {
                        return const NoDataScreen();
                      }
                      return ListView.builder(
                        itemCount: state.pengasuhResponseModel.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: CardPengasuhWidget(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, DETAIL_REGISTER_PENGASUH,
                                    arguments: state
                                        .pengasuhResponseModel.data![index].id);
                              },
                              nama: state.pengasuhResponseModel.data![index]
                                  .namaPengasuh,
                              namaAnak: state.pengasuhResponseModel.data![index]
                                  .anak.namaAnak,
                              nik: state.pengasuhResponseModel.data![index].nik,
                              isUpdate: state.pengasuhResponseModel.data![index].updatedAt != null ? true : null,
                              inRegister: true,
                            ),
                          );
                        },
                      );
                    }
                    return const ErrorServerScreen();
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
