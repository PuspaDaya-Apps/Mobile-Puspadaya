import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/view/screen/no_data_screen.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/beban_kader_items_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/shadow.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../view/screen/error_server_screen.dart';
import '../bloc/index_beban_kerja_bloc.dart';

class BebanKerja extends StatelessWidget {
  const BebanKerja({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexBebanKerjaBloc(),
      child: const BebanKerjaView(),
    );
  }
}

class BebanKerjaView extends StatefulWidget {
  const BebanKerjaView({super.key});

  @override
  State<BebanKerjaView> createState() => _BebanKerjaViewState();
}

class _BebanKerjaViewState extends State<BebanKerjaView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<IndexBebanKerjaBloc>(context).add(GetBebanKerjaEvent());
  }

  @override
  Widget build(BuildContext context) {
    final indexBebanKerja = BlocProvider.of<IndexBebanKerjaBloc>(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        // kirim data true kelauar dari halaman ini
        return Navigator.pop(context, true);
      },
      child: Scaffold(
        backgroundColor: backgroundWhite10,
        appBar: PrimaryAppBar(
          background: Colors.white,
          title: 'Riwayat Beban Kerja Kader',
          onBackPressed: () {
            // kirim data true kelauar dari halaman ini
            Navigator.pop(context, true);
          },
        ),
        body: SafeArea(
          child: BlocConsumer<IndexBebanKerjaBloc, IndexBebanKerjaState>(
            listener: (context, state) {
              debugPrint(state.toString());
            },
            builder: (context, state) {
              if (state is IndexBebanKerjaProcessState) {
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
              if (state is IndexBebanKerjaSuccessState) {
                if (state.indexBebanKerjaResponseModel.data!.isEmpty) {
                  return const NoDataScreen();
                }
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView.builder(
                    itemCount: state.indexBebanKerjaResponseModel.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: shadowMd,
                        ),
                        child: BebanKerjaItems(
                          onTap: () {
                            Navigator.pushNamed(context, DETAIL_BEBAN_KERJA,
                                    arguments: state
                                        .indexBebanKerjaResponseModel
                                        .data![index]
                                        .id)
                                .then((value) {
                              if (value != null) {
                                indexBebanKerja.add(GetBebanKerjaEvent());
                              }
                            });
                          },
                          place: "Posyandu ${state.posyandu}",
                          date: DateFormat('MMMM y', 'id_ID').format(state
                              .indexBebanKerjaResponseModel.data![index].bulan),
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: bluePrimary40,
          shape: const CircleBorder(),
          child: const Icon(
            size: 38,
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, CREATE_BEBAN_KERJA).then((value) {
              if (value != null) {
                indexBebanKerja.add(GetBebanKerjaEvent());
              }
            });
          },
        ),
      ),
    );
  }
}
