import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/theme/shadow.dart';
import '../../../../../route/route_name.dart';
import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/screen/no_data_screen.dart';
import '../../../../view/widget/pengukuran_tamu_items_widget.dart';
import '../../../../view/widget/pul_to_refresh.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../bloc/index_pengukuran_tamu_bloc.dart';

class IndexPengukuranTamuScreen extends StatelessWidget {
  const IndexPengukuranTamuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexPengukuranTamuBloc(),
      child: const IndexPengukuranTamuScreenView(),
    );
  }
}

class IndexPengukuranTamuScreenView extends StatefulWidget {
  const IndexPengukuranTamuScreenView({super.key});

  @override
  State<IndexPengukuranTamuScreenView> createState() => _IndexPengukuranTamuScreenViewState();
}

class _IndexPengukuranTamuScreenViewState extends State<IndexPengukuranTamuScreenView> {
  
  EasyRefreshController refreshController = EasyRefreshController(controlFinishRefresh: true);

  @override
  void initState() {
    BlocProvider.of<IndexPengukuranTamuBloc>(context).add(GetPengukuranTamuEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IndexPengukuranTamuBloc, IndexPengukuranTamuState>(
      listener: (context, state) {
        debugPrint(state.toString());
        if (state is IndexPengukuranTamuFailedState) {
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
        if (state is IndexPengukuranTamuTokenExpiredState) {}
      },
      builder: (context, state) {
        if (state is IndexPengukuranTamuProcessState ||
            state is IndexPengukuranTamuInitial ||
            state is IndexPengukuranTamuTokenExpiredState) {
          return const Center(
            child: CircularProgressIndicator(
              color: bluePrimaryMain,
            )
          );
        }
        if(state is IndexPengukuranTamuSuccessState) {
          if (state.indexPengukuranTamuResponseModel.data!.isEmpty) {
            return const NoDataScreen();
          }

          return PullToRefreshWidget(
            onRefresh: () {
              BlocProvider.of<IndexPengukuranTamuBloc>(context).add(GetPengukuranTamuEvent());
            },
            refreshController: refreshController,
            child: ListView.builder(
              itemCount: state.indexPengukuranTamuResponseModel.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: shadowSm,
                  ),
                  child: PengukuranTamuItems(
                    onTap: () {
                      Navigator.pushNamed(
                        context, 
                        DETAIL_PENGUKURAN_TAMU, 
                        arguments: state.indexPengukuranTamuResponseModel.data![index].id
                      ).then((value) {
                        if(value != null) {
                          BlocProvider.of<IndexPengukuranTamuBloc>(context).add(GetPengukuranTamuEvent());
                        }
                      });
                    },
                    name: state.indexPengukuranTamuResponseModel.data![index].namaAnak,
                    nik: state.indexPengukuranTamuResponseModel.data![index].nik,
                    date: DateFormat("d MMMM y", "ID_id").format(state.indexPengukuranTamuResponseModel.data![index].tanggalPengukuran),
                    place: state.indexPengukuranTamuResponseModel.data![index].posyanduAsal,
                    pengukuranIsNull: state.indexPengukuranTamuResponseModel.data![index].beratBadan != null && state.indexPengukuranTamuResponseModel.data![index].tinggiBadan != null
                    ? true : null,
                  ),
                );
              },
            ),
          );
        }
       
        return const ErrorServerScreen();
      },
    );
  }
}
