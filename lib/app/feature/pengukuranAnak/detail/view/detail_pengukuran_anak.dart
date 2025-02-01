import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/pengukuranAnak/detail/view/detail_catatan.dart';
import 'package:puspadaya/app/feature/pengukuranAnak/detail/view/detail_data.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

class DetailPengukuranAnak extends StatelessWidget {
  const DetailPengukuranAnak({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailPengukuranAnakView();
  }
}

class DetailPengukuranAnakView extends StatefulWidget {
  const DetailPengukuranAnakView({super.key});

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
                    ), //
                    unselectedLabelColor: textSecoundary,
                    labelColor: Colors.white,

                    onTap: (value) {
                      setState(() {
                        _tabController.animateTo(value);
                      });
                    },
                    tabs: [
                      Tab(
                        text: 'Data',
                      ),
                      Tab(
                        text: 'Catatan',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      DetailData(),
                      DetailCatatan(),
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
