import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/detailRegisterOrangTua/view/detail_data_ayah.dart';
import 'package:puspadaya/app/feature/detailRegisterOrangTua/view/detail_data_ibu.dart';

import '../../../../config/theme/pallet_color.dart';
import '../../../../utils/logger/logger.dart';
import '../../../view/widget/appbar_widget.dart';
import '../bloc/detail_register_orang_tua_bloc.dart';

class DetailRegisterOrangTua extends StatelessWidget {
  final String ayahId;

  const DetailRegisterOrangTua({
    super.key,
    required this.ayahId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailRegisterOrangTuaBloc(),
      child: DetailRegisterOrangTuaView(ayahId: ayahId), // Kirim ke View
    );
  }
}

class DetailRegisterOrangTuaView extends StatefulWidget {
  final String ayahId;
  const DetailRegisterOrangTuaView({super.key, required this.ayahId});

  @override
  State<DetailRegisterOrangTuaView> createState() =>
      _DetailRegisterOrangTuaViewState();
}

class _DetailRegisterOrangTuaViewState extends State<DetailRegisterOrangTuaView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    logger.d('trigger fetch');
    logger.d('id ayah ${widget.ayahId}');
    context.read<DetailRegisterOrangTuaBloc>().add(
          FeathingDetailRegisterOrangTua(ayahId: widget.ayahId),
        );
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Detail Orang Tua',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height / 1.2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: backgroundWhite20,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: TabBar(
                    isScrollable: false,
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorAnimation: TabIndicatorAnimation.elastic,
                    dividerHeight: 0,
                    controller: _tabController,
                    indicator: BoxDecoration(
                      color: bluePrimaryMain,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    unselectedLabelColor: textSecoundary,
                    labelColor: Colors.white,
                    tabs: [
                      Tab(text: 'Data Ayah'),
                      Tab(text: 'Data Ibu'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: BlocBuilder<DetailRegisterOrangTuaBloc,
                      DetailRegisterOrangTuaState>(
                    builder: (context, state) {
                      if (state is DetailRegisterOrangTuaLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is DetailRegisterOrangTuaSuccess) {
                        final result = state.getOrangTuaDetailResponse;
                        return TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: _tabController,
                          children: [
                            DetailDataAyah(getOrangtuaDetailResponse: result),
                            DetailDataIbu(getOrangtuaDetailResponse: result),
                            // DetailDataAyah(
                            //   getOrangtuaDetailResponse:
                            //       state.getOrangTuaDetailResponse,
                            // ),
                            // DetailDataIbu(
                            //   getOrangtuaDetailResponse:
                            //       state.getOrangTuaDetailResponse,
                            // ),
                          ],
                        );
                      } else if (state is DetailRegisterOrangTuaFailure) {
                        return Center(child: Text('Error: ${state.error}'));
                      }
                      return Center(child: Text('No data available'));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
