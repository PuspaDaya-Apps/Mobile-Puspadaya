import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/theme/shadow.dart';
import '../../../../../route/route_name.dart';
import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/screen/no_data_screen.dart';
import '../../../../view/widget/pengukuran_anak_items_widget.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../../authorization/bloc/blocAuthentication/authentication_bloc.dart';
import '../bloc/index_pengukuran_anak_bloc.dart';

class IndexPengukuranAnakScreen extends StatelessWidget {
  const IndexPengukuranAnakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexPengukuranAnakBloc(),
      child: const IndexPengukuranAnakScreenView(),
    );
  }
}

class IndexPengukuranAnakScreenView extends StatefulWidget {
  const IndexPengukuranAnakScreenView({super.key});

  @override
  State<IndexPengukuranAnakScreenView> createState() =>
      _IndexPengukuranAnakScreenViewState();
}

class _IndexPengukuranAnakScreenViewState
    extends State<IndexPengukuranAnakScreenView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<IndexPengukuranAnakBloc>(context)
        .add(GetPengukuranAnakEvent());
  }

  @override
  Widget build(BuildContext context) {
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    final indexPengukuranAnakBloc =
        BlocProvider.of<IndexPengukuranAnakBloc>(context);

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is RefreshTokenValid) {
          indexPengukuranAnakBloc.add(GetPengukuranAnakEvent());
        }
      },
      child: BlocConsumer<IndexPengukuranAnakBloc, IndexPengukuranAnakState>(
        listener: (context, state) {
          debugPrint(state.toString());
          if (state is IndexPengukuranAnakFailedState) {
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
          if (state is IndexPengukuranAnakTokenExpiredState) {
            authenticationBloc.add(GetAccesTokenEvent());
          }
        },
        builder: (context, state) {
          if (state is IndexPengukuranAnakProcessState ||
              state is IndexPengukuranAnakInitial ||
              state is IndexPengukuranAnakTokenExpiredState) {
            return const Center(
                child: CircularProgressIndicator(
              color: bluePrimaryMain,
            ));
          }
          if (state is IndexPengukuranAnakSuccessState) {
            if (state.indexPengukuranAnakResponseModel.data!.isEmpty) {
              return const NoDataScreen();
            }
            return ListView.builder(
              itemCount: state.indexPengukuranAnakResponseModel.data!.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: shadowSm,
                    ),
                    child: PengukuranAnakItems(
                      onTap: () {
                        Navigator.pushNamed(context, DETAIL_PENGUKURAN_ANAK,
                                arguments: state
                                    .indexPengukuranAnakResponseModel
                                    .data![index]
                                    .id)
                            .then((value) {
                          if (value != null) {
                            indexPengukuranAnakBloc
                                .add(GetPengukuranAnakEvent());
                          }
                        });
                      },
                      name: state.indexPengukuranAnakResponseModel.data![index]
                          .namaAnak,
                      nik: state
                          .indexPengukuranAnakResponseModel.data![index].nik,
                      date: state.indexPengukuranAnakResponseModel.data![index]
                          .tanggalPengukuran,
                      place: state.indexPengukuranAnakResponseModel.data![index]
                          .tempatPengukuran,
                    ));
              },
            );
          }
          return const ErrorServerScreen();
        },
      ),
    );
  }
}
