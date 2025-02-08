import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/app/view/widget/appbar_widget.dart';
import 'package:puspadaya/config/screen_config/image_config.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import '../../../../../config/screen_config/size_config.dart';
import '../../../../../config/theme/text_style.dart';
import '../../../view/widget/info_field_widget.dart';
import '../model/riwayat_monitoring_ibu_hamil_model.dart';

class DetailMonitoringIbuHamil extends StatelessWidget {
  final RiwayatMonitoringIbuHamilModel detailMonitoring;
  const DetailMonitoringIbuHamil({super.key, required this.detailMonitoring});

  @override
  Widget build(BuildContext context) {
    return DetailMonitoringIbuHamilView(
      detailMonitoring: detailMonitoring,
    );
  }
}

class DetailMonitoringIbuHamilView extends StatefulWidget {
  final RiwayatMonitoringIbuHamilModel detailMonitoring;
  const DetailMonitoringIbuHamilView(
      {super.key, required this.detailMonitoring});

  @override
  State<DetailMonitoringIbuHamilView> createState() =>
      _DetailMonitoringIbuHamilViewState();
}

class _DetailMonitoringIbuHamilViewState
    extends State<DetailMonitoringIbuHamilView> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double sizeHeighofSingleForm = MediaQuery.of(context).size.height / 2.9;
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Detail Monitoring Wasting',
        onBackPressed: () {
          Navigator.pop(context);
        },
        background: Colors.white,
      ),
      backgroundColor: backgroundWhite10,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: _isExpanded
                      ? sizeHeighofSingleForm * 2.9
                      : sizeHeighofSingleForm,
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'NIK',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        InfoFieldWidget(
                            text: widget.detailMonitoring.data.ibuAnak.nik),
                        SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                        const Text(
                          'Nama',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        InfoFieldWidget(
                            text: widget.detailMonitoring.data.ibuAnak.nama),
                        SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                        const Text(
                          'Usia Kandungan',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: SizeConfig.calHeightMultiplier(8)),
                        InfoFieldWidget(
                            text: widget.detailMonitoring.data.usiaKehamilan),
                        Visibility(
                          visible: _isExpanded,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(16)),
                              const Text(
                                'Nomor Kartu Keluarga',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              InfoFieldWidget(
                                  text: widget.detailMonitoring.data.ibuAnak
                                      .kartuKeluarga.nomorKk),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(16),
                              ),
                              const Text(
                                'Nama Suami',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                  height: SizeConfig.calHeightMultiplier(8)),
                              InfoFieldWidget(
                                  text: widget
                                      .detailMonitoring.data.ibuAnak.ayah.nama),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(16),
                              ),
                              const Text(
                                textAlign: TextAlign.start,
                                'Alamat',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(8),
                              ),
                              Row(
                                spacing: 8,
                                children: [
                                  Expanded(
                                    child: InfoFieldWidget(
                                        text: widget
                                            .detailMonitoring
                                            .data
                                            .ibuAnak
                                            .dusun
                                            .desaKelurahan
                                            .kecamatan
                                            .kabupatenKota
                                            .provinsi
                                            .nama),
                                  ),
                                  Expanded(
                                    child: InfoFieldWidget(
                                        text: widget
                                            .detailMonitoring
                                            .data
                                            .ibuAnak
                                            .dusun
                                            .desaKelurahan
                                            .kecamatan
                                            .kabupatenKota
                                            .nama),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(8),
                              ),
                              Row(
                                spacing: 8,
                                children: [
                                  Expanded(
                                    child: InfoFieldWidget(
                                        text: widget
                                            .detailMonitoring
                                            .data
                                            .ibuAnak
                                            .dusun
                                            .desaKelurahan
                                            .kecamatan
                                            .nama),
                                  ),
                                  Expanded(
                                    child: InfoFieldWidget(
                                        text: widget.detailMonitoring.data
                                            .ibuAnak.dusun.desaKelurahan.nama),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(8),
                              ),
                              InfoFieldWidget(
                                  text: widget.detailMonitoring.data.ibuAnak
                                      .dusun.nama),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(8),
                              ),
                              Row(
                                spacing: 8,
                                children: [
                                  Expanded(
                                    child: InfoFieldWidget(
                                        text: widget
                                            .detailMonitoring.data.ibuAnak.rt),
                                  ),
                                  Expanded(
                                    child: InfoFieldWidget(
                                        text: widget
                                            .detailMonitoring.data.ibuAnak.rw),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.calHeightMultiplier(8),
                              ),
                              InfoFieldWidget(
                                text: widget.detailMonitoring.data.alamat,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Detail Ibu Hamil',
                          style: AppTextStyles.primaryTextMedium.copyWith(
                            fontSize: 10,
                          ),
                        ),
                        Icon(
                          size: 20,
                          _isExpanded
                              ? FluentIcons.chevron_up_20_filled
                              : FluentIcons.chevron_down_20_filled,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.black54,
                ),
                SizedBox(height: SizeConfig.calHeightMultiplier(16)),
                Text(
                  'Riwayat Pengukuran',
                  style: AppTextStyles.primaryTextMedium.copyWith(
                    fontSize: 12,
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
