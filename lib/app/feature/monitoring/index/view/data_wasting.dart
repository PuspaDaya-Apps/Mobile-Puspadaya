import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../../config/theme/shadow.dart';
import '../../../../../utils/helper/helper_data.dart';
import '../../../../view/screen/data_not_found_screen.dart';
import '../../../../view/widget/riwayat_anak_items_widget.dart';
import '../../model/get_all_monitoring_anak_model.dart' as GetAllMonitoringAnak;
import '../bloc/index_data_wasting_bloc.dart';

class DataWasting extends StatelessWidget {
  const DataWasting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexDataWastingBloc(),
      child: DataWastingView(),
    );
  }
}

class DataWastingView extends StatefulWidget {
  const DataWastingView({super.key});

  @override
  State<DataWastingView> createState() => _DataWastingViewState();
}

class _DataWastingViewState extends State<DataWastingView> {
  @override
  void initState() {
    context.read<IndexDataWastingBloc>().add(FetchIndexDataWasting());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexDataWastingBloc, IndexDataWastingState>(
      builder: (context, state) {
        if (state is IndexDataWastingLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is IndexDataWastingFailed) {
          return Center(
            child: Text('Gagal memuat data ${state.message}'),
          );
        } else if (state is IndexDataWastingSuccess) {
          if (state.data.data.isEmpty) {
            return DataNotFoundScreen();
          }
          return ListView.builder(
            itemCount: state.data.data.length,
            itemBuilder: (context, index) {
              GetAllMonitoringAnak.Datum dataWasting = state.data.data[index];
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
                    Navigator.pushNamed(context, DETAIL_MONITORING_WASTING,
                        arguments: dataWasting.id);
                  },
                  name: '${dataWasting.namaAnak}',
                  nik: '${dataWasting.nik}',
                  gender: 'laki laki',
                  month: HelperData().extractMonths(dataWasting.usia),
                  year: HelperData().extractYears(dataWasting.usia),
                ),
              );
            },
          );
        }

        return Container();
      },
    );
  }
}
