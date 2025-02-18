import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/monitoring/detail/view/detail_monitoring_under_weight.dart';
import 'package:puspadaya/route/route_name.dart';
import '../../model/get_all_monitoring_anak_model.dart' as GetAllMonitoringAnak;
import '../../../../../config/theme/shadow.dart';
import '../../../../../utils/helper/helper_data.dart';
import '../../../../view/screen/data_not_found_screen.dart';
import '../../../../view/widget/riwayat_anak_items_widget.dart';
import '../bloc/index_data_under_weight_bloc.dart';

class DataUnderWeight extends StatelessWidget {
  const DataUnderWeight({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexDataUnderWeightBloc(),
      child: DataUnderWeightView(),
    );
  }
}

class DataUnderWeightView extends StatefulWidget {
  const DataUnderWeightView({super.key});

  @override
  State<DataUnderWeightView> createState() => _DataUnderWeightViewState();
}

class _DataUnderWeightViewState extends State<DataUnderWeightView> {
  @override
  void initState() {
    context.read<IndexDataUnderWeightBloc>().add(FetchIndexDataUnderWeight());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexDataUnderWeightBloc, IndexDataUnderWeightState>(
      builder: (context, state) {
        if (state is IndexDataUnderWeightLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is IndexDataUnderWeightFailed) {
          return Center(
            child: Text('Gagal memuat data ${state.message}'),
          );
        } else if (state is IndexDataUnderWeightSuccess) {
          if (state.data.data.isEmpty) {
            return DataNotFoundScreen();
          }
          return ListView.builder(
            itemCount: state.data.data.length,
            itemBuilder: (context, index) {
              GetAllMonitoringAnak.Datum dataUnderWight =
                  state.data.data[index];
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
                    Navigator.pushNamed(context, DETAIL_MONITORING_UNDER_WEIGHT,
                        arguments: dataUnderWight.id);
                  },
                  name: '${dataUnderWight.namaAnak}',
                  nik: '${dataUnderWight.nik}',
                  gender: 'laki laki',
                  month: HelperData().extractMonths(dataUnderWight.usia),
                  year: HelperData().extractYears(dataUnderWight.usia),
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
