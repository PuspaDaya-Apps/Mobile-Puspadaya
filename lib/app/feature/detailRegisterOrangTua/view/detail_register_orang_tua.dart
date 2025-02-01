import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/detailRegisterOrangTua/view/detail_data_ayah.dart';
import 'package:puspadaya/app/feature/detailRegisterOrangTua/view/detail_data_ibu.dart';

import '../../../../config/theme/pallet_color.dart';
import '../../../view/widget/appbar_widget.dart';

class DetailRegisterOrangTua extends StatelessWidget {
  const DetailRegisterOrangTua({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailRegisterOrangTuaView();
  }
}

class DetailRegisterOrangTuaView extends StatefulWidget {
  const DetailRegisterOrangTuaView({super.key});

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
        title: 'Tambah Data Orang Tua',
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
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      DetailDataAyah(),
                      DetailDataIbu(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
