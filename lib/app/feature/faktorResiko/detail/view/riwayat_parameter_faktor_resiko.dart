import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/feature/faktorResiko/detail/bloc/detail_faktor_resiko_bloc.dart';

import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/theme/shadow.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../view/widget/alert_dialog_petunjuk_faktor_resiko.dart';
import '../../../../view/widget/appbar_widget.dart';
import '../../../../view/widget/parameter_faktor_resiko_item.dart';
import '../../../../view/widget/primary_button_widget.dart';
import 'detail_riwayat_parameter_faktor_resiko.dart';

class RiwayatParameterFaktorResiko extends StatelessWidget {
  final String anakId;
  const RiwayatParameterFaktorResiko({super.key, required this.anakId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailFaktorResikoBloc(),
      child: RiwayatParameterFaktorResikoView(
        anakId: anakId,
      ),
    );
  }
}

class RiwayatParameterFaktorResikoView extends StatefulWidget {
  final String anakId;
  const RiwayatParameterFaktorResikoView({super.key, required this.anakId});

  @override
  State<RiwayatParameterFaktorResikoView> createState() =>
      _RiwayatParameterFaktorResikoViewState();
}

class _RiwayatParameterFaktorResikoViewState
    extends State<RiwayatParameterFaktorResikoView> {
  @override
  void initState() {
    logger.d(widget.anakId);
    context
        .read<DetailFaktorResikoBloc>()
        .add(FetchDetailFaktorResiko(id: widget.anakId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Faktor Resiko Permasalahan Gizi',
        background: Colors.white,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16), // Add some margin
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialogPetunjuk();
                  },
                );
              },
              child: Icon(
                FontAwesomeIcons.circleExclamation, // Font Awesome icon
                color: greenPrimaryMain, // Icon color
                size: 24, // Icon size
              ),
            ),
          ),
        ],
        onBackPressed: () {
          Navigator.pop(context, true);
        },
      ),
      backgroundColor: backgroundWhite10,
      body: BlocBuilder<DetailFaktorResikoBloc, DetailFaktorResikoState>(
        builder: (context, state) {
          if (state is DetailFaktorResikoLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is DetailFaktorResikoFailed) {
            return Center(
              child: Text('Error Detail Faktor Resiko ${state.message}'),
            );
          }
          if (state is DetailFaktorResikoSuccess) {
            return ListView.builder(
              itemCount: state.data.data.faktorResiko.length,
              itemBuilder: (context, index) {
                final parameter = state.data.data.faktorResiko[index];

                return Padding(
                  padding: const EdgeInsets.only(
                      bottom: 5, top: 5, left: 16, right: 16),
                  child: ParameterFaktorResikoItem(
                    isDone: false,
                    status: true,
                    judul: parameter.namaFaktorResiko,
                    keterangan: parameter.keterangan,
                    terakhirDiisi: parameter.lastCompleted,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailRiwayatParameterFaktorResiko(
                              data: parameter,
                            );
                          },
                        ),
                      );
                    },
                    isRiwayat: true,
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
