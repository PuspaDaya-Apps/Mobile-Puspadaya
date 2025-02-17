import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class PullToRefreshWidget extends StatelessWidget {
  final RefreshController refreshController;
  final Widget child;
  final VoidCallback onRefresh;
  const PullToRefreshWidget({
    Key? key,
    required this.refreshController,
    required this.child,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullUp: true,
      physics: BouncingScrollPhysics(),
      controller: refreshController,
      onRefresh: onRefresh,
      header: ClassicHeader(
        completeDuration: Duration(seconds: 1),
        refreshStyle: RefreshStyle.Follow,
        completeText: 'Pembaruan selesai',
        failedText: 'Gagal memuat data',
        idleText: 'Tarik ke bawah untuk memuat ulang',
        refreshingText: 'Sedang memuat..',
        releaseText: 'Lepaskan untuk memuat ulang',
      ),
      child: child,
    );
  }
}
