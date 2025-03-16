import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/feature/pengukuranIbuHamil/detail/view/detail_pengukuran_ibu_hamil.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/theme/shadow.dart';
import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/screen/no_data_screen.dart';
import '../../../../view/widget/pengukuran_ibu_hamil_items_widget.dart';

import '../bloc/index_pengukuran_ibu_hamil_bloc.dart';

class IndexPengukuranIbuHamilScreen extends StatelessWidget {
  const IndexPengukuranIbuHamilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexPengukuranIbuHamilBloc(),
      child: const IndexPengukuranIbuHamilScreenView(),
    );
  }
}

class IndexPengukuranIbuHamilScreenView extends StatefulWidget {
  const IndexPengukuranIbuHamilScreenView({super.key});

  @override
  State<IndexPengukuranIbuHamilScreenView> createState() =>
      _IndexPengukuranIbuHamilScreenViewState();
}

class _IndexPengukuranIbuHamilScreenViewState
    extends State<IndexPengukuranIbuHamilScreenView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<IndexPengukuranIbuHamilBloc>(context)
        .add(GetPengukuranIbuHamilEvent());
  }

  @override
  Widget build(BuildContext context) {
    final indexPengukuranIbuHamilBloc = BlocProvider.of<IndexPengukuranIbuHamilBloc>(context);

    return BlocConsumer<IndexPengukuranIbuHamilBloc, IndexPengukuranIbuHamilState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        if(state is IndexPengukuranIbuHamilProcessState || state is IndexPengukuranIbuHamilInitial) {
          return const Center(
            child: CircularProgressIndicator(
              color: bluePrimaryMain,
            )
          );
        }
        if(state is IndexPengukuranIbuHamilSuccessState) {
          if(state.indexPengukuranIbuHamilResponseModel.data!.isEmpty) {
            return const NoDataScreen();
          }
          return ListView.builder(
            itemCount: state.indexPengukuranIbuHamilResponseModel.data!.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: shadowSm,
                ),
                child: PengukuranIbuHamilItems(
                  onTap: () {
                    Navigator.pushNamed(context, DETAIL_PENGUKURAN_IBU_HAMIL, arguments: state.indexPengukuranIbuHamilResponseModel.data![index].namaIbu).then((value) {
                      if(value != null) {
                        setState(() {
                          indexPengukuranIbuHamilBloc.add(GetPengukuranIbuHamilEvent());
                        });
                      }
                    });
                  },
                  name: state.indexPengukuranIbuHamilResponseModel.data![index].namaIbu,
                  nik: state.indexPengukuranIbuHamilResponseModel.data![index].nik,
                  date: DateFormat("d MMMM y", "ID_id").format(state.indexPengukuranIbuHamilResponseModel.data![index].tanggalPengukuran)
                ),
              );
            },
          );
        }
        return const ErrorServerScreen();
      },
    );
  }
}
