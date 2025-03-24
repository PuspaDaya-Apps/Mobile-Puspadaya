import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../config/theme/shadow.dart';
import '../../../../../route/route_name.dart';
import '../../../../view/screen/data_not_found_screen.dart';
import '../../../../view/widget/daftar_kehadiran_items_widget.dart';
import '../bloc/index_kehadiran_bloc.dart';
import 'model/list_kehadiran_model.dart';

class IndexKehadiranScreen extends StatelessWidget {
  bool isTrue;
  IndexKehadiranScreen({super.key, this.isTrue = false});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexKehadiranBloc(),
      child: IndexKehadiranScreenView(
        isTrue: isTrue,
      ),
    );
  }
}

class IndexKehadiranScreenView extends StatefulWidget {
  bool isTrue;
  IndexKehadiranScreenView({super.key, this.isTrue = false});

  @override
  State<IndexKehadiranScreenView> createState() =>
      _IndexKehadiranScreenViewState();
}

class _IndexKehadiranScreenViewState extends State<IndexKehadiranScreenView> {
  @override
  void initState() {
    // TODO: implement initState
    if (widget.isTrue = true) {
      context.read<IndexKehadiranBloc>().add(GetIndexKehadiranEvent());
    }
    super.initState();
    context.read<IndexKehadiranBloc>().add(GetIndexKehadiranEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexKehadiranBloc, IndexKehadiranState>(
      builder: (context, state) {
        if (state is IndexKehadiranLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is IndexKehadiranFailed) {
          return Center(child: Text(state.message));
        }
        if (state is IndexKehadiranSuccess) {
          if (state.data.data.isEmpty) {
            return DataNotFoundScreen();
          } else {
            return ListView.builder(
              itemCount: state.data.data.length,
              itemBuilder: (context, index) {
                final kehadiran = state.data.data[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: shadowSm,
                  ),
                  child: DaftarKehadiranItems(
                    onTap: () async {
                      final isTrue = await Navigator.pushNamed(
                        context,
                        DETAIL_KEHADIRAN,
                        arguments: kehadiran.id,
                      );

                      if (isTrue == true) {
                        context
                            .read<IndexKehadiranBloc>()
                            .add(GetIndexKehadiranEvent());
                      }
                    },
                    location: kehadiran.posyandu.namaPosyandu,
                    date: DateFormat('dd MMMM yyyy', 'id_ID')
                        .format(kehadiran.tanggalPelaksanaan),
                    duration: kehadiran.durasi,
                    status: kehadiran.statusKegiatan,
                  ),
                );
              },
            );
          }
        }
        return Container();
      },
    );
  }
}
