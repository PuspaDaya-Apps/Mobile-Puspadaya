import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puspadaya/app/feature/RiwayatAnak/detail/view/detail_riwayat_balita.dart';
import 'package:puspadaya/app/feature/RiwayatIbuHamil/detail/view/detail_riwayat_ibu_hamil.dart';
import 'package:puspadaya/app/feature/monitoring/model/riwayat_monitoring_ibu_hamil_model.dart'
    as RiwayatMonitoringIbuHamilModel;

import '../../../../../config/theme/shadow.dart';
import '../../../../../route/route_name.dart';
import '../../../../view/widget/riwayat_ibu_hamil_items_widget.dart';
import '../../../monitoring/model/riwayat_monitoring_ibu_hamil_model.dart';

class IndexRiwayatIbuHamilScreen extends StatelessWidget {
  const IndexRiwayatIbuHamilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const IndexRiwayatIbuHamilScreenView();
  }
}

class IndexRiwayatIbuHamilScreenView extends StatefulWidget {
  const IndexRiwayatIbuHamilScreenView({super.key});

  @override
  State<IndexRiwayatIbuHamilScreenView> createState() =>
      _IndexRiwayatIbuHamilScreenViewState();
}

class _IndexRiwayatIbuHamilScreenViewState
    extends State<IndexRiwayatIbuHamilScreenView> {
  List<RiwayatMonitoringIbuHamilModel.RiwayatMonitoringIbuHamilModel>
      listRiwayatIbuHamil = [
    RiwayatMonitoringIbuHamilModel.RiwayatMonitoringIbuHamilModel(
      message: 'Berhasil mendapatkan data ibu hamil',
      data: RiwayatMonitoringIbuHamilModel.Data(
        id: '1',
        posyandu: RiwayatMonitoringIbuHamilModel.Posyandu(
            id: '1',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            deletedAt: null,
            namaPosyandu: 'Posyandu Mawar 10',
            alamat: ''),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: null,
        usiaKehamilan: '6 Bulan',
        beratBadan: '65',
        tinggiBadan: '165',
        hemoglobin: '12.5',
        jumlahTabletFe: 20,
        tanggalPertamaHaid: DateTime.now()..subtract(Duration(days: 6 * 30)),
        tanggalTerakhirHaid: DateTime.now()..subtract(Duration(days: 5 * 30)),
        lingkarLenganAtas: '12.40',
        tinggiFundusUteri: '30.20',
        terpaparAsapRokok: 'Ya',
        catatan: 'catatan',
        ibuAnak: RiwayatMonitoringIbuHamilModel.IbuAnak(
            rt: '2',
            rw: '4',
            id: '1',
            nik: '351009021412331',
            nama: "Jane Zulaika",
            tempatLahir: 'Banyuwangi',
            tanggalLahir: DateTime(2001, 5, 21),
            dusun: RiwayatMonitoringIbuHamilModel.Dusun(
              id: '4',
              nama: 'Dusun Krajan',
              desaKelurahan: RiwayatMonitoringIbuHamilModel.DesaKelurahan(
                id: '4',
                nama: 'Kedungrejo',
                kecamatan: RiwayatMonitoringIbuHamilModel.Kecamatan(
                  id: '4',
                  nama: 'Muncar',
                  kabupatenKota: RiwayatMonitoringIbuHamilModel.KabupatenKota(
                    id: '4',
                    nama: 'Banyuwangi',
                    provinsi: RiwayatMonitoringIbuHamilModel.Provinsi(
                      id: '1',
                      nama: 'Jawa Timur',
                    ),
                  ),
                ),
              ),
            ),
            ayah: RiwayatMonitoringIbuHamilModel.Ayah(
                id: '1', nama: 'Tasdik Wijaya'),
            kartuKeluarga: RiwayatMonitoringIbuHamilModel.KartuKeluarga(
                id: '1', nomorKk: '3510090217726')),
        pengukuranIbuHamil: [],
        alamat: 'Kampung Melati Indah, Jalan Ki Hajar Dewantara No 10',
      ),
    ),
    RiwayatMonitoringIbuHamilModel.RiwayatMonitoringIbuHamilModel(
      message: 'Berhasil mendapatkan data ibu hamil',
      data: RiwayatMonitoringIbuHamilModel.Data(
        posyandu: RiwayatMonitoringIbuHamilModel.Posyandu(
            id: '1',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            deletedAt: null,
            namaPosyandu: 'Posyandu Angrek 1',
            alamat: ''),
        id: '2',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: null,
        usiaKehamilan: '3 Bulan',
        beratBadan: '70',
        tinggiBadan: '160',
        hemoglobin: '11.0',
        jumlahTabletFe: 15,
        tanggalPertamaHaid:
            DateTime.now().subtract(Duration(days: 150)), // 5 bulan yang lalu
        tanggalTerakhirHaid:
            DateTime.now().subtract(Duration(days: 120)), // 4 bulan yang lalu
        lingkarLenganAtas: '13.00',
        tinggiFundusUteri: '28.00',
        terpaparAsapRokok: 'Tidak',
        catatan: 'Ibu dalam kondisi sehat',
        ibuAnak: RiwayatMonitoringIbuHamilModel.IbuAnak(
          rt: '1',
          rw: '5',
          id: '2',
          nik: '808109021412332',
          nama: "Maida Kuswandari",
          tempatLahir: 'Maluku Tengah',
          tanggalLahir: DateTime(1999, 8, 10),
          dusun: RiwayatMonitoringIbuHamilModel.Dusun(
            id: '1',
            nama: 'Dusun Hatu',
            desaKelurahan: RiwayatMonitoringIbuHamilModel.DesaKelurahan(
              id: '1',
              nama: 'Hatu',
              kecamatan: RiwayatMonitoringIbuHamilModel.Kecamatan(
                id: '1',
                nama: 'Seram Utara',
                kabupatenKota: RiwayatMonitoringIbuHamilModel.KabupatenKota(
                  id: '1',
                  nama: 'Maluku Tengah',
                  provinsi: RiwayatMonitoringIbuHamilModel.Provinsi(
                    id: '1',
                    nama: 'Maluku',
                  ),
                ),
              ),
            ),
          ),
          ayah: RiwayatMonitoringIbuHamilModel.Ayah(
            id: '2',
            nama: 'Aswani Narpati',
          ),
          kartuKeluarga: RiwayatMonitoringIbuHamilModel.KartuKeluarga(
            id: '2',
            nomorKk: '8081090217728',
          ),
        ),
        pengukuranIbuHamil: [], alamat: 'Kampung Kuno, Jalan Hatu Raya',
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listRiwayatIbuHamil.length,
      itemBuilder: (context, index) {
        RiwayatMonitoringIbuHamilModel.RiwayatMonitoringIbuHamilModel ibuHamil =
            listRiwayatIbuHamil[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: shadowSm,
          ),
          child: RiwayatIbuHamilItems(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailRiwayatIbuHamil(
                      riwayatIbuHamil: ibuHamil,
                    );
                  },
                ),
              );
              // Navigator.pushNamed(context, DETAIL_RIWAYAT_IBU_HAMIL);
            },
            name: ibuHamil.data.ibuAnak.nama,
            nik: ibuHamil.data.ibuAnak.nik,
            gestationalAge: ibuHamil.data.usiaKehamilan,
          ),
        );
      },
    );
  }
}
