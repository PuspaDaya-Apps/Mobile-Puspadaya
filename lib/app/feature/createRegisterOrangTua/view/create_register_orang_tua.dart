import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/alamat/bloc/alamatSaveCubit/alamat_save_cubit.dart';
import 'package:puspadaya/app/feature/createRegisterAnak/cubit/generate_kk_cubit.dart';
import 'package:puspadaya/app/feature/createRegisterAnak/cubit/generate_nik_cubit.dart';
import 'package:puspadaya/app/feature/createRegisterOrangTua/bloc/create_register_orang_tua_bloc.dart';
import 'package:puspadaya/app/feature/createRegisterOrangTua/cubit/orang_tua_form_cubit.dart';
import 'package:puspadaya/app/feature/createRegisterOrangTua/model/post_orang_tua_body.dart';
import 'package:puspadaya/app/feature/createRegisterOrangTua/view/create_register_ayah.dart';
import 'package:puspadaya/app/feature/createRegisterOrangTua/view/create_register_ibu.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/top_snackbar/top_snackbar_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/utils/logger/logger.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


class CreateRegisterOrangTua extends StatelessWidget {
  const CreateRegisterOrangTua({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GenerateKkCubit()),
        BlocProvider(create: (context) => GenerateNikCubit()),
        BlocProvider<AlamatSaveCubit>(
          create: (BuildContext context) => AlamatSaveCubit(),
        ),
        BlocProvider<CreateRegisterOrangTuaBloc>(
          create: (BuildContext context) => CreateRegisterOrangTuaBloc(),
        ),
        BlocProvider<OrangTuaFormCubit>(
            create: (BuildContext context) => OrangTuaFormCubit()),
      ],
      child: CreateRegisterOrangTuaView(),
    );
  }
}

class CreateRegisterOrangTuaView extends StatefulWidget {
  const CreateRegisterOrangTuaView({super.key});

  @override
  State<CreateRegisterOrangTuaView> createState() =>
      _CreateRegisterOrangTuaViewState();
}

class _CreateRegisterOrangTuaViewState extends State<CreateRegisterOrangTuaView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late OrangTuaFormCubit orangTuaCubit;

  // Data yang akan dikumpulkan

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    logger.d('trigger fetch');
    context.read<AlamatSaveCubit>().getDataWilayah();
    orangTuaCubit = context.read<OrangTuaFormCubit>();
  }

  void _submitAllData() {
    PostOrangTuaBody postData = orangTuaCubit.getPostBody();
    // post_orang_tua postData = orangTuaCubit.getPostBody();
    logger.d(postData);
    context
        .read<CreateRegisterOrangTuaBloc>()
        .add(SendRegisterOrangTua(postOrangTuaBody: postData));
  }

  @override
  void dispose() {
    // Dispose TabController
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Tambah Data Orang Tua',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body:
          BlocListener<CreateRegisterOrangTuaBloc, CreateRegisterOrangTuaState>(
        listener: (context, state) {
          if (state is CreateRegisterOrangTuaFailedState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showTopSnackBar(
                Overlay.of(context),
                animationDuration: const Duration(milliseconds: 600),
                displayDuration: const Duration(milliseconds: 2200),
                reverseAnimationDuration: const Duration(milliseconds: 300),
                TopSnackbarWidget().error(state.error),
              );
            });
          }
          if (state is CreateRegisterOrangTuaSuccesState) {
            Navigator.pop(context, 1);
          }
        },
        child: SafeArea(
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
                        Tab(text: 'Data Ayah'),
                        Tab(text: 'Data Ibu'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        // ! Ayah
                        CreateRegisterAyah(
                          cubit: orangTuaCubit,
                          onNext: () => _tabController.animateTo(1),
                        ),

                        //!IBU
                        CreateRegisterIbu(
                          cubit: orangTuaCubit,
                          onSave: () => _submitAllData(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
