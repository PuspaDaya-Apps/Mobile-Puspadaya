import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/createRegisterAnggotaKader/view/create_import.dart';
import 'package:puspadaya/app/feature/createRegisterAnggotaKader/view/create_individu.dart';
import 'package:puspadaya/app/view/screen/error_server_screen.dart';
// import 'package:puspadaya/app/feature/alamat/model/get_provinsi_response.dart'
//     as ProvinsiModel;
// import 'package:puspadaya/app/feature/alamat/model/get_kabupaten_response.dart'
//     as KabupatenModel;
// import 'package:puspadaya/app/feature/alamat/model/get_kecamatan_response.dart'
//     as KecamatanModel;
// import 'package:puspadaya/app/feature/alamat/model/get_desa_kelurahan_response.dart'
//     as DesaKelurahanModel;
// import 'package:puspadaya/app/feature/alamat/model/get_dusun_response.dart'
//     as DusunModel;
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../config/theme/pallet_color.dart';
import '../../../../route/route_name.dart';
import '../../../view/widget/appbar_widget.dart';
import '../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../../alamat/bloc/alamat_bloc.dart';
import '../../authorization/bloc/blocAuthorization/authorization_bloc.dart';
import '../bloc/createAnggotaKaderBloc/create_anggota_kader_bloc.dart';
import '../bloc/currentUserCubit/current_user_cubit.dart';

class CreateRegisterAnggotaKader extends StatelessWidget {
  const CreateRegisterAnggotaKader({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateAnggotaKaderBloc(),
        ),
        // BlocProvider(
        //   create: (context) => AlamatBloc(),
        // ),
        BlocProvider(
          create: (context) => CurrentUserCubit(),
        ),
      ],
      child: const CreateRegisterAnggotaKaderView(),
    );
  }
}

class CreateRegisterAnggotaKaderView extends StatefulWidget {
  const CreateRegisterAnggotaKaderView({super.key});

  @override
  State<CreateRegisterAnggotaKaderView> createState() =>
      _CreateRegisterAnggotaKaderViewState();
}

class _CreateRegisterAnggotaKaderViewState
    extends State<CreateRegisterAnggotaKaderView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // BlocProvider.of<AlamatBloc>(context).add(ShowAllSectionEvent());
    BlocProvider.of<CurrentUserCubit>(context).getCurrentUserModel();
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final createAnggotaKaderBloc = BlocProvider.of<CreateAnggotaKaderBloc>(context);
    final authorizationBloc = BlocProvider.of<AuthorizationBloc>(context);

    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Tambah Data Anggota Kader',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: BlocListener<AuthorizationBloc, AuthorizationState>(
        listener: (context, state) {
          debugPrint(state.toString());
          if(state is AuthorizationFalse) {
            Navigator.pushReplacementNamed(context, LOGIN);
          }
        },
        child: BlocConsumer<CurrentUserCubit, CurrentUserState>(
          listener: (context, state) {
            debugPrint(state.toString());
            if (state is CurrentUserFailedState) {
              authorizationBloc.add(AuthorizationFalseEvent());
              showTopSnackBar(
                Overlay.of(context),
                animationDuration: const Duration(
                    milliseconds: 600),
                displayDuration: const Duration(
                    milliseconds: 2200),
                reverseAnimationDuration:
                    const Duration(
                        milliseconds: 300),
                TopSnackbarWidget()
                    .error('User tidak dapat ditemukan\n harap login kembali'));
            }
          },
          builder: (context, userState) {
            if (userState is CurrentUserProccessState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: bluePrimaryMain,
                ),
              );
            }
            if (userState is CurrentUserSuccessState) {

              // return BlocConsumer<AlamatBloc, AlamatState>(
              //   listener: (context, state) {
              //     debugPrint(state.toString());
              //   },
              //   builder: (context, state) {
              //     if (state is AlamatLoading) {
              //       return const Center(
              //         child: CircularProgressIndicator(
              //           color: bluePrimaryMain,
              //         ),
              //       );
              //     }
              //     if (state is ShowAllSection) {
                    // List<ProvinsiModel.Datum> selectProvinsi = state.provinsi;
                    // List<KabupatenModel.Datum> selectKabupaten =
                    //     state.kabupaten;
                    // List<KecamatanModel.Datum> selectKecamatan =
                    //     state.kecamatan;
                    // List<DesaKelurahanModel.Datum> selectDesaKelurahan =
                    //     state.desaKelurahan;
                    // List<DusunModel.Datum> selectDusun = state.dusun;

                    return SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 20),
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 20),
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
                                indicatorAnimation:
                                    TabIndicatorAnimation.elastic,
                                dividerHeight: 0,
                                controller: _tabController,
                                indicator: BoxDecoration(
                                  color: bluePrimaryMain,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                unselectedLabelColor: textSecoundary,
                                labelColor: Colors.white,
                                tabs: const [
                                  Tab(text: 'Individu'),
                                  Tab(text: 'Import'),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Expanded(
                              child: TabBarView(
                                physics: const NeverScrollableScrollPhysics(),
                                controller: _tabController,
                                children: [
                                  CreateIndividu(
                                    // selectProvinsi: selectProvinsi,
                                    // selectKabupaten: selectKabupaten,
                                    // selectKecamatan: selectKecamatan,
                                    // selectDesaKelurahan: selectDesaKelurahan,
                                    // selectDusun: selectDusun,
                                    currentUserModel: userState.currentUserModel,
                                  ),
                                  CreateImport(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );

              //     }
              //     return const ErrorServerScreen();
              //   },
              // );

            }
            return const ErrorServerScreen();
          },
        ),
      )),
    );
  }
}
