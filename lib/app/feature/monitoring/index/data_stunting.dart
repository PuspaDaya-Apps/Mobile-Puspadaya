import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/monitoring/detail/detail_monitoring_stunting.dart';
import 'package:puspadaya/route/route_name.dart';
import 'package:puspadaya/utils/helper/helper_data.dart';

import '../../../../config/theme/shadow.dart';
import '../../../view/widget/riwayat_anak_items_widget.dart';
import '../model/riwayat_monitoring_anak_model.dart'
    as RiwayatMonitoringAnakModel;

class DataStunting extends StatelessWidget {
  const DataStunting({super.key});

  @override
  Widget build(BuildContext context) {
    return DataStuntingView();
  }
}

class DataStuntingView extends StatefulWidget {
  const DataStuntingView({super.key});

  @override
  State<DataStuntingView> createState() => _DataStuntingViewState();
}

/**
 *  List<StuntingItemModel> listDataStunting = [
    StuntingItemModel(
      nama: 'Budi Santoso',
      jenisKelamin: 'Laki Laki',
      nik: '810126787538246',
      bulan: 2,
      tahun: 1,
    ),
    StuntingItemModel(
      nama: 'Agus Wijaya',
      jenisKelamin: 'Laki Laki',
      nik: '3510188760651290',
      bulan: 1,
      tahun: 0,
    ),
    StuntingItemModel(
      nama: 'Doni Saputra',
      jenisKelamin: 'Laki Laki',
      nik: '810126787511890',
      bulan: 1,
      tahun: 8,
    ),
    StuntingItemModel(
      nama: 'Dewi Lestari',
      jenisKelamin: 'Perempuan',
      nik: '810126787006537',
      bulan: 2,
      tahun: 2,
    ),
    StuntingItemModel(
      nama: 'Rina Amelia',
      jenisKelamin: 'Perempuan',
      nik: '810126998776100',
      bulan: 1,
      tahun: 1,
    ),
  ];
 */
class _DataStuntingViewState extends State<DataStuntingView> {
  List<RiwayatMonitoringAnakModel.RiwayatMonitoringAnakModel> dataStuntingList =
      [
    RiwayatMonitoringAnakModel.RiwayatMonitoringAnakModel(
      message: 'Riwayat pengukuran anak berhasil didapatkan',
      data: RiwayatMonitoringAnakModel.Data(
        alamat: 'Jalan Raya Muncar No. 12',
        dusun: RiwayatMonitoringAnakModel.Dusun(
          id: '4',
          nama: 'Dusun Krajan',
          desaKelurahan: RiwayatMonitoringAnakModel.DesaKelurahan(
            id: '4',
            nama: 'Kedungrejo',
            kecamatan: RiwayatMonitoringAnakModel.Kecamatan(
              id: '4',
              nama: 'Muncar',
              kabupaten: RiwayatMonitoringAnakModel.Kabupaten(
                id: '4',
                nama: 'Banyuwangi',
                provinsi: RiwayatMonitoringAnakModel.Provinsi(
                    id: '4', nama: 'Jawa Timur'),
              ),
            ),
          ),
        ),
        rt: '4',
        rw: '4',
        id: '05b39865-0b67-4132-9e92-16e6a8438c24',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: null,
        nik: '3501255678394121',
        namaAnak: 'Budy Setiawan',
        tempatLahir: 'Banyuwangi',
        anakKe: 1,
        tanggalLahir: DateTime(2023, 9, 2),
        jenisKelamin: 'Laki-Laki',
        beratBadanLahir: '35',
        tinggiBadanLahir: '23',
        lingkarLenganAtasLahir: '3',
        lingkarKepalaLahir: '4',
        caraLahir: 'normal',
        statusKelahiran: 'normal',
        statusStunting: 'pendek',
        statusGizi: 'gizi buruk',
        statusWasting: 'normal',
        statusOrangTua: 'Wali',
        pengukuran: null,
        posyandu: RiwayatMonitoringAnakModel.Posyandu(
          id: '1',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
          namaPosyandu: 'Posyandu Anggrek 2',
          alamat: null,
        ),
        kartuKeluarga: RiwayatMonitoringAnakModel.KartuKeluarga(
          id: '1',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
          nomorKartuKeluarga: '3501255678390002',
        ),
        orangTua: RiwayatMonitoringAnakModel.OrangTua(
          ayah: RiwayatMonitoringAnakModel.Ayah(namaAyah: 'Muhammad Handoko'),
          ibu: RiwayatMonitoringAnakModel.Ibu(namaIbu: 'Nadia Anata Putri'),
        ),
      ),
    ),
    RiwayatMonitoringAnakModel.RiwayatMonitoringAnakModel(
      message: 'Riwayat pengukuran anak berhasil didapatkan',
      data: RiwayatMonitoringAnakModel.Data(
        alamat: 'Jalan Raya Soahuku No. 5,',
        id: 'a1b2c3d4-5678-9101-1121-314151617181',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: null,
        nik: '8010216784352688',
        namaAnak: 'Rizky Pratama',
        tempatLahir: 'Maluku Tengah',
        anakKe: 2,
        tanggalLahir: DateTime(2023, 5, 12),
        jenisKelamin: 'Laki-Laki',
        beratBadanLahir: '36',
        tinggiBadanLahir: '25',
        lingkarLenganAtasLahir: '4',
        lingkarKepalaLahir: '5',
        caraLahir: 'sesar',
        statusKelahiran: 'normal',
        statusStunting: 'pendek',
        statusGizi: 'gizi normal',
        statusWasting: 'kurus',
        statusOrangTua: 'Orang Tua Kandung',
        pengukuran: null,
        posyandu: RiwayatMonitoringAnakModel.Posyandu(
          id: '2',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
          namaPosyandu: 'Posyandu Melati 1',
          alamat: null,
        ),
        kartuKeluarga: RiwayatMonitoringAnakModel.KartuKeluarga(
          id: '2',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
          nomorKartuKeluarga: '8010216784301234',
        ),
        orangTua: RiwayatMonitoringAnakModel.OrangTua(
          ayah: RiwayatMonitoringAnakModel.Ayah(namaAyah: 'Andi Sulaiman'),
          ibu: RiwayatMonitoringAnakModel.Ibu(namaIbu: 'Siti Aminah'),
        ),
        rt: '2',
        rw: '2',
        dusun: RiwayatMonitoringAnakModel.Dusun(
          id: '1',
          nama: 'Dusun Batu Merah',
          desaKelurahan: RiwayatMonitoringAnakModel.DesaKelurahan(
            id: '1',
            nama: 'Soahuku',
            kecamatan: RiwayatMonitoringAnakModel.Kecamatan(
              id: '1',
              nama: 'Amahai',
              kabupaten: RiwayatMonitoringAnakModel.Kabupaten(
                id: '1',
                nama: 'Maluku Tengah',
                provinsi: RiwayatMonitoringAnakModel.Provinsi(
                    id: '1', nama: 'Maluku'),
              ),
            ),
          ),
        ),
      ),
    ),
    RiwayatMonitoringAnakModel.RiwayatMonitoringAnakModel(
      message: 'Riwayat pengukuran anak berhasil didapatkan',
      data: RiwayatMonitoringAnakModel.Data(
        id: 'b2c3d4e5-6789-1011-1213-141516171819',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: null,
        nik: '8010216784352677',
        namaAnak: 'Nadia Kusuma',
        tempatLahir: 'Maluku Tengah',
        anakKe: 3,
        tanggalLahir: DateTime(2023, 3, 8),
        jenisKelamin: 'Perempuan',
        beratBadanLahir: '34',
        tinggiBadanLahir: '22',
        lingkarLenganAtasLahir: '3',
        lingkarKepalaLahir: '4',
        caraLahir: 'normal',
        statusKelahiran: 'normal',
        statusStunting: 'sangat pendek',
        statusGizi: 'normal',
        statusWasting: 'sangat kurus',
        statusOrangTua: 'Orang Tua Kandung',
        pengukuran: null,
        posyandu: RiwayatMonitoringAnakModel.Posyandu(
          id: '3',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
          namaPosyandu: 'Posyandu Mawar 3',
          alamat: null,
        ),
        kartuKeluarga: RiwayatMonitoringAnakModel.KartuKeluarga(
          id: '3',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
          nomorKartuKeluarga: '8010216784305678',
        ),
        orangTua: RiwayatMonitoringAnakModel.OrangTua(
          ayah: RiwayatMonitoringAnakModel.Ayah(namaAyah: 'Fauzan Prasetyo'),
          ibu: RiwayatMonitoringAnakModel.Ibu(namaIbu: 'Dewi Lestari'),
        ),
        rt: '3',
        rw: '7',
        alamat: 'Jalan Tanah Merah No. 10',
        dusun: RiwayatMonitoringAnakModel.Dusun(
          id: '2',
          nama: 'Dusun Tanah Merah',
          desaKelurahan: RiwayatMonitoringAnakModel.DesaKelurahan(
            id: '2',
            nama: 'Tulehu',
            kecamatan: RiwayatMonitoringAnakModel.Kecamatan(
              id: '2',
              nama: 'Salahutu',
              kabupaten: RiwayatMonitoringAnakModel.Kabupaten(
                id: '2',
                nama: 'Maluku Tengah',
                provinsi: RiwayatMonitoringAnakModel.Provinsi(
                    id: '1', nama: 'Maluku'),
              ),
            ),
          ),
        ),
      ),
    ),
    RiwayatMonitoringAnakModel.RiwayatMonitoringAnakModel(
      message: 'Riwayat pengukuran anak berhasil didapatkan',
      data: RiwayatMonitoringAnakModel.Data(
        alamat: 'Jalan Wahai No. 15s',
        id: 'c3d4e5f6-7890-1112-1314-151617181920',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: null,
        nik: '8010216784352666',
        namaAnak: 'Aulia Rahman',
        tempatLahir: 'Maluku Tengah',
        anakKe: 4,
        tanggalLahir: DateTime(2023, 7, 20),
        jenisKelamin: 'Laki-Laki',
        beratBadanLahir: '37',
        tinggiBadanLahir: '24',
        lingkarLenganAtasLahir: '4',
        lingkarKepalaLahir: '5',
        caraLahir: 'sesar',
        statusKelahiran: 'normal',
        statusStunting: 'pendek',
        statusGizi: 'gizi normal',
        statusWasting: 'normal',
        statusOrangTua: 'Orang Tua Kandung',
        pengukuran: null,
        posyandu: RiwayatMonitoringAnakModel.Posyandu(
          id: '4',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
          namaPosyandu: 'Posyandu Cempaka 4',
          alamat: null,
        ),
        kartuKeluarga: RiwayatMonitoringAnakModel.KartuKeluarga(
          id: '4',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: null,
          nomorKartuKeluarga: '8010216784306789',
        ),
        orangTua: RiwayatMonitoringAnakModel.OrangTua(
          ayah: RiwayatMonitoringAnakModel.Ayah(namaAyah: 'Rahmat Hidayat'),
          ibu: RiwayatMonitoringAnakModel.Ibu(namaIbu: 'Sri Wahyuni'),
        ),
        rt: '6',
        rw: '3',
        dusun: RiwayatMonitoringAnakModel.Dusun(
          id: '3',
          nama: 'Dusun Air Besar',
          desaKelurahan: RiwayatMonitoringAnakModel.DesaKelurahan(
            id: '3',
            nama: 'Wahai',
            kecamatan: RiwayatMonitoringAnakModel.Kecamatan(
              id: '3',
              nama: 'Seram Utara',
              kabupaten: RiwayatMonitoringAnakModel.Kabupaten(
                id: '3',
                nama: 'Maluku Tengah',
                provinsi: RiwayatMonitoringAnakModel.Provinsi(
                    id: '3', nama: 'Maluku'),
              ),
            ),
          ),
        ),
      ),
    ),
  ];
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataStuntingList.length,
      itemBuilder: (context, index) {
        RiwayatMonitoringAnakModel.RiwayatMonitoringAnakModel dataStunting =
            dataStuntingList[index];
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
                    return DetailMonitoringStunting(
                        detailMonitoring: dataStunting);
                  },
                ),
              );
            },
            name: '${dataStunting.data.namaAnak}',
            nik: '${dataStunting.data.nik}',
            gender: '${dataStunting.data.jenisKelamin}',
            month: HelperData()
                .countMonthFromDateTime(dataStunting.data.tanggalLahir),
            year: HelperData()
                .countYearFromDateTime(dataStunting.data.tanggalLahir),
          ),
        );
      },
    );
  }
}
