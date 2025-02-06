import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:puspadaya/app/feature/monitoring/index/data_ibu_hamil.dart';
import 'package:puspadaya/app/feature/monitoring/index/data_stunting.dart';
import 'package:puspadaya/app/feature/monitoring/index/data_under_weight.dart';
import 'package:puspadaya/app/feature/monitoring/index/data_wasting.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';

import '../../../../utils/logger/logger.dart';

class Monitoring extends StatelessWidget {
  const Monitoring({super.key});

  @override
  Widget build(BuildContext context) {
    return MonitoringView();
  }
}

class MonitoringView extends StatefulWidget {
  const MonitoringView({super.key});

  @override
  State<MonitoringView> createState() => _MonitoringViewState();
}

class _MonitoringViewState extends State<MonitoringView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
    logger.d('trigger fetch');
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
      appBar: PrimaryAppBar(
        title: 'Monitoring',
        background: Colors.white,
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // padding: const EdgeInsets.symmetric(vertical: 25),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TabBar(
                    tabAlignment: TabAlignment.center,
                    isScrollable: true,
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorAnimation: TabIndicatorAnimation.elastic,
                    dividerHeight: 0,
                    controller: _tabController,
                    indicator: BoxDecoration(
                      color: bluePrimaryMain,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    unselectedLabelColor: textSecoundary,
                    labelColor: Colors.white,
                    tabs: [
                      Tab(text: 'Stunting'),
                      Tab(text: 'Under Weight'),
                      Tab(text: 'Wasting'),
                      Tab(text: 'Ibu Hamil'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      DataStunting(),
                      DataUnderWeight(),
                      DataWasting(),
                      DataIbuHamil()
                    ],
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
