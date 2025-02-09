import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:puspadaya/app/feature/RiwayatAnak/detail/view/detail_riwayat_balita.dart';
import 'package:puspadaya/utils/helper/helper_data.dart';

import '../../../../../config/theme/shadow.dart';
import '../../../../../route/route_name.dart';
import '../../../../view/widget/riwayat_anak_items_widget.dart';
import '../../../monitoring/model/riwayat_monitoring_anak_model.dart'
    as RiwayatMonitoringAnakModel;

class IndexRiwayatAnakScreen extends StatelessWidget {
  const IndexRiwayatAnakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const IndexRiwayatAnakScreenView();
  }
}

class IndexRiwayatAnakScreenView extends StatefulWidget {
  const IndexRiwayatAnakScreenView({super.key});

  @override
  State<IndexRiwayatAnakScreenView> createState() =>
      _IndexRiwayatAnakScreenViewState();
}

class _IndexRiwayatAnakScreenViewState
    extends State<IndexRiwayatAnakScreenView> {
  List<RiwayatMonitoringAnakModel.RiwayatMonitoringAnakModel> dataAnakList = [
    RiwayatMonitoringAnakModel.RiwayatMonitoringAnakModel(
      message: 'Riwayat pengukuran anak berhasil didapatkan',
      data: RiwayatMonitoringAnakModel.Data(
        alamat: 'Jl KH Wahid Hasyim No. 1',
        dusun: RiwayatMonitoringAnakModel.Dusun(
          id: '4',
          nama: 'Dusun Jalen',
          desaKelurahan: RiwayatMonitoringAnakModel.DesaKelurahan(
            id: '4',
            nama: 'Setail',
            kecamatan: RiwayatMonitoringAnakModel.Kecamatan(
              id: '4',
              nama: 'Genteng',
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
        namaAnak: 'Rinaldy Farandy',
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
        statusStunting: 'normal',
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
          ayah: RiwayatMonitoringAnakModel.Ayah(namaAyah: 'Jhon Anwar'),
          ibu: RiwayatMonitoringAnakModel.Ibu(namaIbu: 'Indah Triutami'),
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
        namaAnak: 'Rofiqotul Octaza',
        tempatLahir: 'Maluku Tengah',
        anakKe: 2,
        tanggalLahir: DateTime(2023, 5, 12),
        jenisKelamin: 'Perempuan',
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
          ayah: RiwayatMonitoringAnakModel.Ayah(namaAyah: 'Aulia Himawan'),
          ibu: RiwayatMonitoringAnakModel.Ibu(namaIbu: 'Selfita Hamada'),
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
        namaAnak: 'Indah Triutami',
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
          ayah: RiwayatMonitoringAnakModel.Ayah(namaAyah: 'Satrya Mirza'),
          ibu: RiwayatMonitoringAnakModel.Ibu(namaIbu: 'Laras Krisnanto'),
        ),
        rt: '3',
        rw: '7',
        alamat: 'Jalan Tanah Merah No. 3',
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
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataAnakList.length,
      itemBuilder: (context, index) {
        RiwayatMonitoringAnakModel.RiwayatMonitoringAnakModel anak =
            dataAnakList[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: shadowSm,
          ),
          child: RiwayatAnakItems(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailRiwayatBalita(
                      detailRiwayatAnak: anak,
                    );
                  },
                ),
              );
              // Navigator.pushNamed(context, DETAIL_RIWAYAT_ANAK);
            },
            name: anak.data.namaAnak,
            nik: anak.data.nik,
            gender: anak.data.jenisKelamin,
            month: HelperData().countMonthFromDateTime(anak.data.tanggalLahir),
            year: HelperData().countYearFromDateTime(anak.data.tanggalLahir),
          ),
        );
      },
    );
  }
}
