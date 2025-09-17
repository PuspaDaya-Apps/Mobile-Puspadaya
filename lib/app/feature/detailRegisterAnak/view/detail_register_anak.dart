import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puspadaya/app/feature/detailRegisterAnak/bloc/detail_register_anak_bloc.dart';
import 'package:puspadaya/app/feature/detailRegisterAnak/view/detail_data_anak.dart';
import 'package:puspadaya/app/feature/detailRegisterAnak/view/detail_data_kia.dart';

import '../../../../config/theme/pallet_color.dart';
import '../../../../utils/logger/logger.dart';
import '../../../view/widget/appbar_widget.dart';

class DetailRegisterAnak extends StatelessWidget {
  final String id;
  const DetailRegisterAnak({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailRegisterAnakBloc(),
      child: DetailRegisterAnakView(
        anakId: id,
      ),
    );
  }
}

class DetailRegisterAnakView extends StatefulWidget {
  final String anakId;
  const DetailRegisterAnakView({super.key, required this.anakId});

  @override
  State<DetailRegisterAnakView> createState() => _DetailRegisterAnakViewState();
}

class _DetailRegisterAnakViewState extends State<DetailRegisterAnakView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    logger.d('trigger fetch');
    logger.d('anak id ${widget.anakId}');
    context
        .read<DetailRegisterAnakBloc>()
        .add(FeathingDetailRegisterAnak(anakId: widget.anakId));
  }

  @override
  Widget build(BuildContext context) {
    final detailRegisterAnakBloc =
        BlocProvider.of<DetailRegisterAnakBloc>(context);

    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Detail Data Anak',
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
                    unselectedLabelColor: textSecondary1,
                    labelColor: Colors.white,
                    tabs: [
                      Tab(text: 'Data Anak'),
                      Tab(text: 'KIA'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                BlocBuilder<DetailRegisterAnakBloc, DetailRegisterAnakState>(
                    builder: (context, state) {
                  if (state is DetailRegisterAnakLoading) {
                    return SizedBox(
                      height: MediaQuery.sizeOf(context).height/2,
                      width: MediaQuery.sizeOf(context).width,
                      child: Center(
                        child: SpinKitThreeBounce(
                          color: bluePrimaryMain,
                          size: 50.0,
                        ),
                      ),
                    );
                  } else if (state is DetailRegisterAnakFailure) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else if (state is DetailRegisterAnakSuccess) {
                    // logger.d(
                    //     'detail pengukuran ${state.getDetailRegisterAnak.data!.pengukuranAnak?[0].tinggiBadan ?? []}');
                    return Expanded(
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _tabController,
                        children: [
                          DetailDataAnak(
                            detailResponse: state.getDetailRegisterAnak,
                            detailRegisterAnakBloc: detailRegisterAnakBloc,
                            anakId: widget.anakId,
                            statusAnak: state.statusAnak,
                          ),
                          DetailDataKIA(
                            detailResponse: state.getDetailRegisterAnak,
                            dataGrafik: state.dataGrafik,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
