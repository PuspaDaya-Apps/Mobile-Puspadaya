import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/Kehadiran/create/view/list_data_tamu.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/app/view/widget/primary_button_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/config/theme/text_style.dart';

import '../../../../../config/screen_config/size_config.dart';
import '../../../../view/widget/info_field_widget.dart';
import 'list_data_anak.dart';
import 'list_data_ibu.dart';

class CreateKehadiranScreen extends StatelessWidget {
  const CreateKehadiranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateKehadiranScreenView();
  }
}

class CreateKehadiranScreenView extends StatefulWidget {
  const CreateKehadiranScreenView({super.key});

  @override
  State<CreateKehadiranScreenView> createState() => _CreateKehadiranViewState();
}

class _CreateKehadiranViewState extends State<CreateKehadiranScreenView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: ButtonPrimary(
          color: bluePrimaryMain,
          mainButtonMessage: 'Selesai',
          mainButton: () {
            Navigator.pop(context);
          },
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
          child: Column(
            children: [
              _buildTopSection(),
              _buildSectionMenu(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildTopSection() {
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
                    InfoFieldWidget(text: '07.30'),
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
                    InfoFieldWidget(text: '13.30'),
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
          InfoFieldWidget(text: '-'),
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
          InfoFieldWidget(text: 'Sedang Berjalan'),
          SizedBox(
            height: SizeConfig.calHeightMultiplier(16),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionMenu() {
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
              ListDataAnak(
                key: UniqueKey(),
              ),
              ListDataIbu(
                key: UniqueKey(),
              ),
              ListDataTamu(
                key: UniqueKey(),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
