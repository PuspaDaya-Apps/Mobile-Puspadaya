import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/monitoring/detail/detail_monitoring_under_weight.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../config/theme/shadow.dart';
import '../../../../utils/helper/helper_data.dart';
import '../../../view/widget/riwayat_anak_items_widget.dart';
import '../model/riwayat_monitoring_anak_model.dart'
    as RiwayatMonitoringAnakModel;

class DataUnderWeight extends StatelessWidget {
  const DataUnderWeight({super.key});

  @override
  Widget build(BuildContext context) {
    return DataUnderWeightView();
  }
}

class DataUnderWeightView extends StatefulWidget {
  const DataUnderWeightView({super.key});

  @override
  State<DataUnderWeightView> createState() => _DataUnderWeightViewState();
}

class _DataUnderWeightViewState extends State<DataUnderWeightView> {
  List<RiwayatMonitoringAnakModel.RiwayatMonitoringAnakModel>
      dataUnderWeightList = [
    RiwayatMonitoringAnakModel.RiwayatMonitoringAnakModel(
      message: 'Riwayat pengukuran anak berhasil didapatkan',
      data: RiwayatMonitoringAnakModel.Data(
        id: '12a39865-0b67-4132-9e92-16e6a8438c99',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: null,
        nik: '8010216784351234',
        namaAnak: 'Ahmad Fauzan',
        tempatLahir: 'Maluku',
        anakKe: 2,
        tanggalLahir: DateTime(2022, 5, 10),
        jenisKelamin: 'Laki-Laki',
        beratBadanLahir: '3.2',
        tinggiBadanLahir: '48',
        lingkarLenganAtasLahir: '12',
        lingkarKepalaLahir: '35',
        caraLahir: 'Caesar',
        statusKelahiran: 'normal',
        statusStunting: 'pendek',
        statusGizi: 'gizi normal',
        statusWasting: 'kurus',
        statusOrangTua: 'Orang Tua',
        pengukuran: null,
        posyandu: RiwayatMonitoringAnakModel.Posyandu(
          id: '2',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
          namaPosyandu: 'Posyandu Melati 1',
          alamat: 'Jl. Melati No. 10, Jakarta',
        ),
        kartuKeluarga: RiwayatMonitoringAnakModel.KartuKeluarga(
          id: '2',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
          nomorKartuKeluarga: '8010216784312345',
        ),
        orangTua: RiwayatMonitoringAnakModel.OrangTua(
          ayah: RiwayatMonitoringAnakModel.Ayah(namaAyah: 'Hendri Kusuma'),
          ibu: RiwayatMonitoringAnakModel.Ibu(namaIbu: 'Siti Rohani'),
        ),
      ),
    ),
    RiwayatMonitoringAnakModel.RiwayatMonitoringAnakModel(
      message: 'Riwayat pengukuran anak berhasil didapatkan',
      data: RiwayatMonitoringAnakModel.Data(
        id: '56c98765-0b67-4132-9e92-16e6a8438c77',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: null,
        nik: '3510177721900981',
        namaAnak: 'Aisyah Putri',
        tempatLahir: 'Banyuwangi',
        anakKe: 3,
        tanggalLahir: DateTime(2021, 11, 25),
        jenisKelamin: 'Perempuan',
        beratBadanLahir: '2.9',
        tinggiBadanLahir: '46',
        lingkarLenganAtasLahir: '11',
        lingkarKepalaLahir: '34',
        caraLahir: 'Normal',
        statusKelahiran: 'normal',
        statusStunting: 'sangat pendek',
        statusGizi: 'gizi buruk',
        statusWasting: 'sangat kurus',
        statusOrangTua: 'Orang Tua',
        pengukuran: null,
        posyandu: RiwayatMonitoringAnakModel.Posyandu(
          id: '3',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
          namaPosyandu: 'Posyandu Mawar 3',
          alamat: 'Jl. Mawar No. 25, Surabaya',
        ),
        kartuKeluarga: RiwayatMonitoringAnakModel.KartuKeluarga(
          id: '3',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
          nomorKartuKeluarga: '3510177721900900',
        ),
        orangTua: RiwayatMonitoringAnakModel.OrangTua(
          ayah: RiwayatMonitoringAnakModel.Ayah(namaAyah: 'Budi Santoso'),
          ibu: RiwayatMonitoringAnakModel.Ibu(namaIbu: 'Dewi Lestari'),
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataUnderWeightList.length,
      itemBuilder: (context, index) {
        RiwayatMonitoringAnakModel.RiwayatMonitoringAnakModel dataUnderWeight =
            dataUnderWeightList[index];
        return Container(
          margin: const EdgeInsets.only(
            bottom: 5,
            top: 5,
            left: 16,
            right: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: shadowSm,
          ),
          child: RiwayatAnakItems(
            onTap: () {
              // Navigator.pushNamed(context, DETAIL_MONITORING_STUNTING,
              //     arguments: '2');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailMonitoringUnderWeight(
                        detailMonitoring: dataUnderWeight);
                  },
                ),
              );
            },
            name: '${dataUnderWeight.data.namaAnak}',
            nik: '${dataUnderWeight.data.nik}',
            gender: '${dataUnderWeight.data.jenisKelamin}',
            month: HelperData()
                .countMonthFromDateTime(dataUnderWeight.data.tanggalLahir),
            year: HelperData()
                .countYearFromDateTime(dataUnderWeight.data.tanggalLahir),
          ),
        );
      },
    );
  }
}
