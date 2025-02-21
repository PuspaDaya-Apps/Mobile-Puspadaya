import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

import 'detail_catatan.dart';
import 'detail_data.dart';

class DetailPengukuranTamu extends StatelessWidget {
  const DetailPengukuranTamu({super.key, required this.pengukuranId});

  final String pengukuranId;

  @override
  Widget build(BuildContext context) {
    return DetailPengukuranTamuView(pengukuranId: pengukuranId);
  }
}

class DetailPengukuranTamuView extends StatefulWidget {
  const DetailPengukuranTamuView({super.key, required this.pengukuranId});

  final String pengukuranId;

  @override
  State<DetailPengukuranTamuView> createState() =>
      _DetailPengukuranTamuViewState();
}

class _DetailPengukuranTamuViewState extends State<DetailPengukuranTamuView>
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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite10,
      appBar: PrimaryAppBar(
        title: 'Detail Pengukuran Tamu',
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          width: MediaQuery.of(context).size.width,
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
                  dividerHeight: 0,
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: bluePrimaryMain,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  unselectedLabelColor: textSecondary1,
                  labelColor: Colors.white,
                  onTap: (value) {
                    _tabController.animateTo(value);
                  },
                  tabs: const [
                    Tab(text: 'Data'),
                    Tab(text: 'Catatan'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    DetailData(),
                    DetailCatatan(
                      catatan:
                          'Harap Anak Diberikan Makanan Yang Tinggi Akan Zat Besi',
                      keluhan: '-',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
