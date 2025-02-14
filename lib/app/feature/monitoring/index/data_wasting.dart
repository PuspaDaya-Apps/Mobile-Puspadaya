import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/monitoring/detail/detail_monitoring_wasting.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../config/theme/shadow.dart';
import '../../../../utils/helper/helper_data.dart';
import '../../../view/widget/riwayat_anak_items_widget.dart';
import '../model/riwayat_monitoring_anak_model.dart'
    as RiwayatMonitoringAnakModel;

class DataWasting extends StatelessWidget {
  const DataWasting({super.key});

  @override
  Widget build(BuildContext context) {
    return DataWastingView();
  }
}

class DataWastingView extends StatefulWidget {
  const DataWastingView({super.key});

  @override
  State<DataWastingView> createState() => _DataWastingViewState();
}

class _DataWastingViewState extends State<DataWastingView> {
  List<RiwayatMonitoringAnakModel.RiwayatMonitoringAnakModel> dataWastingList =
      [
    RiwayatMonitoringAnakModel.RiwayatMonitoringAnakModel(
      message: 'Riwayat pengukuran anak berhasil didapatkan',
      data: RiwayatMonitoringAnakModel.Data(
        alamat: 'Jalan Hatu no 8',
        dusun: RiwayatMonitoringAnakModel.Dusun(
          id: '4',
          nama: 'Dusun Hatu',
          desaKelurahan: RiwayatMonitoringAnakModel.DesaKelurahan(
            id: '4',
            nama: 'Hatu',
            kecamatan: RiwayatMonitoringAnakModel.Kecamatan(
              id: '3',
              nama: 'Seram Utara',
              kabupaten: RiwayatMonitoringAnakModel.Kabupaten(
                id: '3',
                nama: 'Maluku Tengah',
                provinsi: RiwayatMonitoringAnakModel.Provinsi(
                  id: '3',
                  nama: 'Maluku',
                ),
              ),
            ),
          ),
        ),
        id: '9f84b3a2-0d45-4c88-92df-53a94a907e21',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: null,
        nik: '8010216784361111',
        namaAnak: 'Daffa Alfarizi',
        tempatLahir: 'Maluku Tengah',
        anakKe: 1,
        tanggalLahir: DateTime(2022, 3, 15),
        jenisKelamin: 'Laki-Laki',
        beratBadanLahir: '3.5',
        tinggiBadanLahir: '50',
        lingkarLenganAtasLahir: '11.5',
        lingkarKepalaLahir: '35.2',
        caraLahir: 'Normal',
        statusKelahiran: 'normal',
        statusStunting: 'normal',
        statusGizi: 'kurus',
        statusWasting: 'kurus',
        statusOrangTua: 'Orang Tua',
        pengukuran: null,
        posyandu: RiwayatMonitoringAnakModel.Posyandu(
          id: '4',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
          namaPosyandu: 'Posyandu Dahlia 5',
          alamat: 'Jl. Merdeka No. 15, Bandung',
        ),
        kartuKeluarga: RiwayatMonitoringAnakModel.KartuKeluarga(
          id: '4',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
          nomorKartuKeluarga: '8010216784398888',
        ),
        orangTua: RiwayatMonitoringAnakModel.OrangTua(
          ayah: RiwayatMonitoringAnakModel.Ayah(namaAyah: 'Rahmat Suryadi'),
          ibu: RiwayatMonitoringAnakModel.Ibu(namaIbu: 'Fitri Handayani'),
        ),
        rt: '2',
        rw: '5',
      ),
    ),
    RiwayatMonitoringAnakModel.RiwayatMonitoringAnakModel(
      message: 'Riwayat pengukuran anak berhasil didapatkan',
      data: RiwayatMonitoringAnakModel.Data(
          alamat: 'Jl Soekarno no 15',
          dusun: RiwayatMonitoringAnakModel.Dusun(
            id: '5',
            nama: 'Dusun Latu',
            desaKelurahan: RiwayatMonitoringAnakModel.DesaKelurahan(
              id: '5',
              nama: 'Latu',
              kecamatan: RiwayatMonitoringAnakModel.Kecamatan(
                id: '3',
                nama: 'Seram Utara',
                kabupaten: RiwayatMonitoringAnakModel.Kabupaten(
                  id: '3',
                  nama: 'Maluku Tengah',
                  provinsi: RiwayatMonitoringAnakModel.Provinsi(
                    id: '3',
                    nama: 'Maluku',
                  ),
                ),
              ),
            ),
          ),
          id: '3e65c9f7-2a31-4d99-842e-1dfbdf676811',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
          nik: '8010216784372222',
          namaAnak: 'Aulia Zahra',
          tempatLahir: 'Maluku Tengah',
          anakKe: 2,
          tanggalLahir: DateTime(2021, 8, 10),
          jenisKelamin: 'Perempuan',
          beratBadanLahir: '3.1',
          tinggiBadanLahir: '48',
          lingkarLenganAtasLahir: '11',
          lingkarKepalaLahir: '34.5',
          caraLahir: 'Normal',
          statusKelahiran: 'normal',
          statusStunting: 'pendek',
          statusGizi: 'normal',
          statusWasting: 'kurus',
          statusOrangTua: 'Orang Tua',
          pengukuran: null,
          posyandu: RiwayatMonitoringAnakModel.Posyandu(
            id: '5',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            deletedAt: null,
            namaPosyandu: 'Posyandu Kenanga 2',
            alamat: 'Jl. Pahlawan No. 20, Semarang',
          ),
          kartuKeluarga: RiwayatMonitoringAnakModel.KartuKeluarga(
            id: '5',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            deletedAt: null,
            nomorKartuKeluarga: '8010216784397777',
          ),
          orangTua: RiwayatMonitoringAnakModel.OrangTua(
            ayah: RiwayatMonitoringAnakModel.Ayah(namaAyah: 'Bambang Suharto'),
            ibu: RiwayatMonitoringAnakModel.Ibu(namaIbu: 'Dewi Anggraini'),
          ),
          rt: '6',
          rw: '2'),
    ),
    RiwayatMonitoringAnakModel.RiwayatMonitoringAnakModel(
      message: 'Riwayat pengukuran anak berhasil didapatkan',
      data: RiwayatMonitoringAnakModel.Data(
          alamat: 'Jalan Tuhaha no 20',
          dusun: RiwayatMonitoringAnakModel.Dusun(
            id: '6',
            nama: 'Dusun Tuhaha',
            desaKelurahan: RiwayatMonitoringAnakModel.DesaKelurahan(
              id: '6',
              nama: 'Tuhaha',
              kecamatan: RiwayatMonitoringAnakModel.Kecamatan(
                id: '3',
                nama: 'Seram Utara',
                kabupaten: RiwayatMonitoringAnakModel.Kabupaten(
                  id: '3',
                  nama: 'Maluku Tengah',
                  provinsi: RiwayatMonitoringAnakModel.Provinsi(
                    id: '3',
                    nama: 'Maluku',
                  ),
                ),
              ),
            ),
          ),
          id: '6a98b23d-71b0-49e3-910f-8f6b34a95d99',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
          nik: '8010216784383333',
          namaAnak: 'Rizky Ramadhan',
          tempatLahir: 'Maluku Tengah',
          anakKe: 3,
          tanggalLahir: DateTime(2023, 1, 25),
          jenisKelamin: 'Laki-Laki',
          beratBadanLahir: '3.3',
          tinggiBadanLahir: '49',
          lingkarLenganAtasLahir: '12',
          lingkarKepalaLahir: '35.1',
          caraLahir: 'Caesar',
          statusKelahiran: 'normal',
          statusStunting: 'sangat pendek',
          statusGizi: 'gizi buruk',
          statusWasting: 'sangat kurus',
          statusOrangTua: 'Orang Tua',
          pengukuran: null,
          posyandu: RiwayatMonitoringAnakModel.Posyandu(
            id: '6',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            deletedAt: null,
            namaPosyandu: 'Posyandu Melati 3',
            alamat: 'Jl. Ahmad Yani No. 50, Surabaya',
          ),
          kartuKeluarga: RiwayatMonitoringAnakModel.KartuKeluarga(
            id: '6',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            deletedAt: null,
            nomorKartuKeluarga: '8010216784396666',
          ),
          orangTua: RiwayatMonitoringAnakModel.OrangTua(
            ayah: RiwayatMonitoringAnakModel.Ayah(namaAyah: 'Hendra Prasetyo'),
            ibu: RiwayatMonitoringAnakModel.Ibu(namaIbu: 'Sari Indah Permata'),
          ),
          rt: '1',
          rw: '3'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataWastingList.length,
      itemBuilder: (context, index) {
        RiwayatMonitoringAnakModel.RiwayatMonitoringAnakModel dataWasting =
            dataWastingList[index];
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
              // Navigator.pushNamed(context, DETAIL_MONITORING_WASTING,
              //     arguments: '2');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailMonitoringWasting(
                        detailMonitoring: dataWasting);
                  },
                ),
              );
            },
            name: '${dataWasting.data.namaAnak}',
            nik: '${dataWasting.data.nik}',
            gender: '${dataWasting.data.jenisKelamin}',
            month: HelperData()
                .countMonthFromDateTime(dataWasting.data.tanggalLahir),
            year: HelperData()
                .countYearFromDateTime(dataWasting.data.tanggalLahir),
          ),
        );
      },
    );
  }
}
