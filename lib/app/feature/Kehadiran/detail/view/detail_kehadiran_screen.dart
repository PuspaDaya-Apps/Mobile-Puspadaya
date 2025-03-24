import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/route/route_name.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../config/screen_config/image_config.dart';
import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/pallet_color.dart';
import '../../../../../config/theme/text_style.dart';
import '../../../../../utils/helper/helper_data.dart';
import '../../../../../utils/logger/logger.dart';
import '../../../../view/widget/alert_dialog_widget.dart';
import '../../../../view/widget/appbar_widget.dart';
import '../../../../view/widget/info_field_widget.dart';
import '../../../../view/widget/primary_button_widget.dart';
import '../../../../view/widget/top_snackbar/top_snackbar_widget.dart';
import '../bloc/detail_kehadiran_bloc.dart';
import 'list_data_anak.dart';
import 'list_data_ibu.dart';
import 'list_data_tamu.dart';
import '../model/get_detail_kehadiran_model.dart' as get_detail_kehadiran_model; 

class DetailKehadiranScreen extends StatelessWidget {
  final String id;
  const DetailKehadiranScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailKehadiranBloc(),
      child: DetailKehadiranScreenView(
        id: id,
      ),
    );
  }
}

class DetailKehadiranScreenView extends StatefulWidget {
  final String id;
  const DetailKehadiranScreenView({super.key, required this.id});

  @override
  State<DetailKehadiranScreenView> createState() => _DetailKehadiranViewState();
}

class _DetailKehadiranViewState extends State<DetailKehadiranScreenView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    context
        .read<DetailKehadiranBloc>()
        .add(GetDetailKehadiranEvent(id: widget.id));

    // final List<ProvinsiModel.Datum> selectProvinsi = [];
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
      bottomNavigationBar:
          BlocListener<DetailKehadiranBloc, DetailKehadiranState>(
        listener: (context, state) {
          if (state is DeleteKehadiranFailed) {
            showTopSnackBar(
              Overlay.of(context),
              animationDuration: const Duration(milliseconds: 600),
              displayDuration: const Duration(milliseconds: 2200),
              reverseAnimationDuration: const Duration(milliseconds: 300),
              TopSnackbarWidget().error(state.message),
            );
          }
          if (state is DeleteKehadiranSuccess) {
            showTopSnackBar(
              Overlay.of(context),
              animationDuration: const Duration(milliseconds: 600),
              displayDuration: const Duration(milliseconds: 2200),
              reverseAnimationDuration: const Duration(milliseconds: 300),
              TopSnackbarWidget().success("Berhasil Menghapus Kehadiran"),
            );
            Navigator.pop(context, true);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            spacing: 8,
            children: [
              Expanded(
                child: ButtonPrimary(
                  color: goldPrimaryMain,
                  mainButtonMessage: 'Perbarui',
                  mainButton: () {
                    Navigator.pushNamed(context, UPDATE_KEHADIRAN);
                  },
                ),
              ),
              Expanded(
                child: ButtonPrimary(
                  color: redPrimaryMain,
                  mainButtonMessage: 'Hapus',
                  mainButton: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialogWidget(
                          title: 'Apakah Anda Yakin?',
                          message:
                              'Data Akan di hapus secara permanen dan tidak dapat dibatalkan',
                          mainButton: () {
                            logger.d("Deleting kehadiran");
                            context
                                .read<DetailKehadiranBloc>()
                                .add(DeleteKehadiranEvent(id: widget.id));
                            Navigator.pop(context);
                          },
                          image: imageDeleteItems,
                          mainButtonMessage: 'Iya, Hapus Kehadiran',
                          colorMainButton: redPrimaryMain,
                          cancelButton: () {
                            Navigator.pop(context);
                          },
                          cancelButtonMessage: 'Batalkan',
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: PrimaryAppBar(
        title: 'Daftar hadir',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Container(
          child: BlocBuilder<DetailKehadiranBloc, DetailKehadiranState>(
            builder: (context, state) {
              if (state is DetailKehadiranLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is DetailKehadiranFailed) {
                return Center(
                  child: Text(state.message),
                );
              }
              if (state is DetailKehadiranSuccess) {
                return Column(
                  children: [
                    _buildTopSection(state.data.data),
                    _buildSectionMenu(state.data.data),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Container _buildTopSection(get_detail_kehadiran_model.Data data) {
    return Container(
      decoration: BoxDecoration(
        color: bluePrimaryMain,
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mulai',
                      style: AppTextStyles.primaryTextNormal.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.calHeightMultiplier(8),
                    ),
                    InfoFieldWidget(text: data.waktuMulai),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selesai',
                      style: AppTextStyles.primaryTextNormal.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.calHeightMultiplier(8),
                    ),
                    InfoFieldWidget(text: data.waktuSelesai),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.calHeightMultiplier(16),
          ),
          Text(
            'Durasi',
            style: AppTextStyles.primaryTextNormal.copyWith(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: SizeConfig.calHeightMultiplier(8),
          ),
          InfoFieldWidget(text: HelperData().konversiDurasiHHMMKeString(data.durasi)),
          SizedBox(
            height: SizeConfig.calHeightMultiplier(16),
          ),
          Text(
            'Status Kegiatan',
            style: AppTextStyles.primaryTextNormal.copyWith(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: SizeConfig.calHeightMultiplier(8),
          ),
          InfoFieldWidget(text: data.statusKegiatan),
          SizedBox(
            height: SizeConfig.calHeightMultiplier(16),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionMenu(get_detail_kehadiran_model.Data data) {
    return Expanded(
      child: Column(children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
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
              Tab(text: 'Anak'),
              Tab(text: 'Ibu Hamil'),
              Tab(text: 'Tamu'),
            ],
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              ListDataAnak(data: data.kehadiranAnak,),
              ListDataIbu(data: data.kehadiranIbuHamil,),
              ListDataTamu(data: data.kehadiranTamu,),
            ],
          ),
        )
      ]),
    );
  }
}
