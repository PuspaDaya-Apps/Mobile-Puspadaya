import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puspadaya/app/feature/pengukuranAnak/detail/view/detail_catatan.dart';
import 'package:puspadaya/app/feature/pengukuranAnak/detail/view/detail_data.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../view/screen/error_server_screen.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../bloc/hapusPengukuranAnakBloc/hapus_pengukuran_anak_bloc.dart';
import '../bloc/detailPengukuranAnakBloc/detail_pengukuran_anak_bloc.dart';

class DetailPengukuranAnak extends StatelessWidget {
  const DetailPengukuranAnak({super.key, required this.pengukuranId});
  final String pengukuranId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DetailPengukuranAnakBloc(),
        ),
        BlocProvider(
          create: (context) => HapusPengukuranAnakBloc(),
        ),
      ],
      child: DetailPengukuranAnakView(pengukuranId: pengukuranId),
    );
  }
}

class DetailPengukuranAnakView extends StatefulWidget {
  const DetailPengukuranAnakView({super.key, required this.pengukuranId});
  final String pengukuranId;

  @override
  State<DetailPengukuranAnakView> createState() =>
      _DetailPengukuranAnakViewState();
}

class _DetailPengukuranAnakViewState extends State<DetailPengukuranAnakView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailPengukuranAnakBloc>(context)
        .add(GetDetailPengukuranAnak(widget.pengukuranId));
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Detail Pengukuran Anak',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<DetailPengukuranAnakBloc, DetailPengukuranAnakState>(
            listener: (context, state) {
              if (state is DetailPengukuranAnakFailedState) {
                showTopSnackBar(
                    Overlay.of(context),
                    animationDuration: const Duration(milliseconds: 600),
                    displayDuration: const Duration(milliseconds: 2200),
                    reverseAnimationDuration: const Duration(milliseconds: 300),
                    TopSnackbarWidget().error(state.error));
              }
              if (state is DetailPengukuanAnakTokenExpiredState) {}
            },
            builder: (context, state) {
              if (state is DetailPengukuranAnakProcessState) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  child: Center(
                    child: SpinKitThreeBounce(
                      color: bluePrimaryMain,
                      size: 50.0,
                    ),
                  ),
                );
              }
              if (state is DetailPengukuranAnakSuccesState) {
                return Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
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
                        padding: const EdgeInsets.all(4),
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
                          ), //
                          unselectedLabelColor: textSecondary1,
                          labelColor: Colors.white,

                          onTap: (value) {
                            setState(() {
                              _tabController.animateTo(value);
                            });
                          },
                          tabs: const [
                            Tab(
                              text: 'Data',
                            ),
                            Tab(
                              text: 'Catatan',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            DetailData(
                                pengukuranId: widget.pengukuranId,
                                detailPengukuranAnakResponseModel:
                                    state.detailPengukuranAnakResponseModel),
                            DetailCatatan(
                                catatan: state.detailPengukuranAnakResponseModel
                                    .data!.catatan,
                                keluhan: state.detailPengukuranAnakResponseModel
                                    .data!.keluhan),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return SizedBox(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child: const ErrorServerScreen()
              );
            },
          ),
        ),
      ),
    );
  }
}
