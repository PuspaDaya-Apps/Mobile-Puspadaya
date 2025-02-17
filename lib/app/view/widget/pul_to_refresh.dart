import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';

import '../../../config/theme/pallet_color.dart';
import '../../../config/theme/text_style.dart';

class PullToRefreshWidget extends StatelessWidget {
  final EasyRefreshController refreshController;
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
    return EasyRefresh(
      footer: null,
      header: ClassicHeader(
        messageStyle: AppTextStyles.primaryTextNormal.copyWith(
          fontSize: 14,
          color: textPrimary30,
        ),
        processedDuration: const Duration(seconds: 1),
        dragText: 'Geser ke bawah untuk memuat',
        noMoreText: 'Tidak ada data tambahan',
        armedText: 'Lepaskan untuk memuat ulang',
        messageText: 'Memuat data...',
        processedText: 'Data berhasil dimuat',
        processingText: 'Sedang memperbarui data...',
        readyText: 'Muat ulang data',
        failedText: 'Gagal memuat data. Coba lagi.',
      ),
      // enablePullUp: false,
      // physics: const BouncingScrollPhysics(),
      controller: refreshController,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
