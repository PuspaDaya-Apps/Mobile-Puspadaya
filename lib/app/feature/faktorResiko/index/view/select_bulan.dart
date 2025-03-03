import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart'; // Import intl for date formatting
import 'package:puspadaya/app/view/screen/data_not_found_screen.dart';

import '../../../../../config/theme/pallet_color.dart';
import '../../../../../route/route_name.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../view/widget/appbar_widget.dart';
import '../../../../view/widget/card_select_bulan_widget.dart';
import '../../../../view/widget/pul_to_refresh.dart';
import '../bloc/riwayat_faktor_resiko_bloc.dart';

class SelectBulan extends StatelessWidget {
  final String id;
  const SelectBulan({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RiwayatFaktorResikoBloc(),
      child: SelectBulanView(
        id: id,
      ),
    );
  }
}

class SelectBulanView extends StatefulWidget {
  final String id;
  const SelectBulanView({super.key, required this.id});

  @override
  State<SelectBulanView> createState() => _SelectBulanViewState();
}

class _SelectBulanViewState extends State<SelectBulanView> {
  // List<SelectBulanModel> itemBulan = [
  //   SelectBulanModel(id: '1', namaBulan: 'February', tahun: '2025'),
  // ];
  EasyRefreshController refreshController =
      EasyRefreshController(controlFinishRefresh: true);

  @override
  void initState() {
    context
        .read<RiwayatFaktorResikoBloc>()
        .add(FeatchRiwayatFaktorResiko(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Riwayat Faktor Resiko Permasalahan Gizi',
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
          Navigator.pushNamed(
            context,
            PARAMETER_FAKTOR_RESIKO_CREATE,
            arguments: widget.id,
          );
        },
      ),
      backgroundColor: backgroundWhite10,
      body: BlocBuilder<RiwayatFaktorResikoBloc, RiwayatFaktorResikoState>(
        builder: (context, state) {
          if (state is RiwayatFaktorResikoLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is RiwayatFaktorResikoFailed) {
            return Center(
              child: Text('Gagal Mendapatkan Faktor Resiko ${state.message}'),
            );
          }
          if (state is RiwayatFaktorResikoSuccess) {
            if (state.data.data.isEmpty) {
              return DataNotFoundScreen();
            }
            return PullToRefreshWidget(
              onRefresh: () {
                context
                    .read<RiwayatFaktorResikoBloc>()
                    .add(FeatchRiwayatFaktorResiko(widget.id));
              },
              refreshController: refreshController,
              child: ListView.builder(
                itemCount: state.data.data.length,
                itemBuilder: (context, index) {
                  final bulan = state.data.data[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                        bottom: 5, top: 5, left: 16, right: 16),
                    child: CardSelectBulanWidget(
                      bulan: DateFormat('MMMM', 'id_ID')
                          .format(bulan.tanggalPeriode),
                      tahun: DateFormat('yyyy', 'id_ID')
                          .format(bulan.tanggalPeriode),
                      onTap: () async {
                        logger.d('cliked faktor resiko detail');
                        final isTrue = await Navigator.pushNamed(
                          context,
                          PARAMETER_FAKTOR_RESIKO_DETAIL,
                          arguments: {
                            'id': bulan.id,
                          },
                        );
                        if (isTrue == true) {
                          context
                              .read<RiwayatFaktorResikoBloc>()
                              .add(FeatchRiwayatFaktorResiko(widget.id));
                        }
                      },
                    ),
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
