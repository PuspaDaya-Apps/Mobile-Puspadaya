import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/route/route_name.dart';
import 'package:puspadaya/utils/helper/helper_data.dart';
import '../../../../view/screen/data_not_found_screen.dart';
import '../../model/get_all_monitoring_anak_model.dart' as GetAllMonitoringAnak;
import '../../../../../config/theme/shadow.dart';
import '../../../../view/widget/riwayat_anak_items_widget.dart';

import '../bloc/index_data_stunting_bloc.dart';

class DataStunting extends StatelessWidget {
  const DataStunting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexDataStuntingBloc(),
      child: DataStuntingView(),
    );
  }
}

class DataStuntingView extends StatefulWidget {
  const DataStuntingView({super.key});

  @override
  State<DataStuntingView> createState() => _DataStuntingViewState();
}

class _DataStuntingViewState extends State<DataStuntingView> {
  @override
  void initState() {
    context.read<IndexDataStuntingBloc>().add(FetchIndexDataStunting());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexDataStuntingBloc, IndexDataStuntingState>(
      builder: (context, state) {
        if (state is IndexDataStuntingLoading) {
          return SizedBox(
            child: Center(
              child: SpinKitThreeBounce(
                color: bluePrimaryMain,
                size: 50.0,
              ),
            ),
          );
        } else if (state is IndexDataStuntingFailed) {
          return Center(
            child: Text('Gagal memuat data ${state.message}'),
          );
        } else if (state is IndexDataStuntingSuccess) {
          if (state.data.data.isEmpty) {
            return DataNotFoundScreen();
          }
          return ListView.builder(
            itemCount: state.data.data.length,
            itemBuilder: (context, index) {
              GetAllMonitoringAnak.Datum dataStunting = state.data.data[index];
              return Container(
                margin: const EdgeInsets.only(
                  bottom: 5,
                  top: 5,
                  left: 16,
                  right: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: shadowSm,
                ),
                child: RiwayatAnakItems(
                  onTap: () {
                    Navigator.pushNamed(context, DETAIL_MONITORING_STUNTING,
                        arguments: dataStunting.id);
                  },
                  name: '${dataStunting.namaAnak}',
                  nik: '${dataStunting.nik}',
                  gender: 'laki laki',
                  month: HelperData().extractMonths(dataStunting.usia),
                  year: HelperData().extractYears(dataStunting.usia),
                ),
              );
            },
          );
        }
        ;
        return Container();
      },
    );
  }
}
