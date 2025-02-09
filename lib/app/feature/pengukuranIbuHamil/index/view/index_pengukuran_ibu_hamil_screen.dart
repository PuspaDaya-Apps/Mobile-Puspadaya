import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/feature/pengukuranIbuHamil/detail/view/detail_pengukuran_ibu_hamil.dart';

import '../../../../../config/theme/shadow.dart';
import '../../../../../route/route_name.dart';
import '../../../../view/widget/pengukuran_ibu_hamil_items_widget.dart';
import 'package:puspadaya/app/feature/monitoring/model/riwayat_monitoring_ibu_hamil_model.dart'
    as RiwayatMonitoringIbuHamilModel;

class IndexPengukuranIbuHamilScreen extends StatelessWidget {
  const IndexPengukuranIbuHamilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const IndexPengukuranIbuHamilScreenView();
  }
}

class IndexPengukuranIbuHamilScreenView extends StatefulWidget {
  const IndexPengukuranIbuHamilScreenView({super.key});

  @override
  State<IndexPengukuranIbuHamilScreenView> createState() =>
      _IndexPengukuranIbuHamilScreenViewState();
}

class _IndexPengukuranIbuHamilScreenViewState
    extends State<IndexPengukuranIbuHamilScreenView> {
  List<RiwayatMonitoringIbuHamilModel.RiwayatMonitoringIbuHamilModel>
      listPengukuranIbuHamil = [
    // Data 1 - Banyuwangi
    RiwayatMonitoringIbuHamilModel.RiwayatMonitoringIbuHamilModel(
      message: 'Berhasil mendapatkan data ibu hamil',
      data: RiwayatMonitoringIbuHamilModel.Data(
        id: '1',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        posyandu: RiwayatMonitoringIbuHamilModel.Posyandu(
          id: '1',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: DateTime.now(),
          namaPosyandu: 'Posyandu Indah 10',
          alamat: 'Gang Istana Indonesia 2',
        ),
        deletedAt: null,
        usiaKehamilan: '1 Bulan',
        beratBadan: '58',
        tinggiBadan: '160',
        hemoglobin: '12.0',
        jumlahTabletFe: 20,
        tanggalPertamaHaid: DateTime.now().subtract(Duration(days: 15)),
        tanggalTerakhirHaid: DateTime.now().subtract(Duration(days: 25)),
        lingkarLenganAtas: '23.5',
        tinggiFundusUteri: '10.2',
        terpaparAsapRokok: 'Tidak',
        catatan: 'Ibu dalam kondisi sehat',
        ibuAnak: RiwayatMonitoringIbuHamilModel.IbuAnak(
          rt: '3',
          rw: '1',
          id: '1',
          nik: '350109021412331',
          nama: "Hesti Winarsih",
          tempatLahir: 'Banyuwangi',
          tanggalLahir: DateTime(2000, 4, 15),
          dusun: RiwayatMonitoringIbuHamilModel.Dusun(
            id: '2',
            nama: 'Dusun Sumber Agung',
            desaKelurahan: RiwayatMonitoringIbuHamilModel.DesaKelurahan(
              id: '2',
              nama: 'Sumberagung',
              kecamatan: RiwayatMonitoringIbuHamilModel.Kecamatan(
                id: '2',
                nama: 'Pesanggaran',
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
            id: '1',
            nama: 'Budi Santoso',
          ),
          kartuKeluarga: RiwayatMonitoringIbuHamilModel.KartuKeluarga(
            id: '1',
            nomorKk: '3501090217726',
          ),
        ),
        pengukuranIbuHamil: [],
        alamat: 'Jalan Raya Sumberagung No. 15',
      ),
    ),

    // Data 2 - Banyuwangi
    RiwayatMonitoringIbuHamilModel.RiwayatMonitoringIbuHamilModel(
      message: 'Berhasil mendapatkan data ibu hamil',
      data: RiwayatMonitoringIbuHamilModel.Data(
        id: '2',
        createdAt: DateTime.now(),
        posyandu: RiwayatMonitoringIbuHamilModel.Posyandu(
          id: '1',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: DateTime.now(),
          namaPosyandu: 'Posyandu Mawar 10',
          alamat: 'Gang Kecambah No. 10',
        ),
        updatedAt: DateTime.now(),
        deletedAt: null,
        usiaKehamilan: '1 Bulan',
        beratBadan: '62',
        tinggiBadan: '158',
        hemoglobin: '11.8',
        jumlahTabletFe: 18,
        tanggalPertamaHaid: DateTime.now().subtract(Duration(days: 40)),
        tanggalTerakhirHaid: DateTime.now().subtract(Duration(days: 35)),
        lingkarLenganAtas: '24.0',
        tinggiFundusUteri: '9.8',
        terpaparAsapRokok: 'Ya',
        catatan: 'Dianjurkan menghindari asap rokok',
        ibuAnak: RiwayatMonitoringIbuHamilModel.IbuAnak(
          rt: '5',
          rw: '2',
          id: '2',
          nik: '350109021412332',
          nama: "Dewi Puspita",
          tempatLahir: 'Banyuwangi',
          tanggalLahir: DateTime(1998, 9, 12),
          dusun: RiwayatMonitoringIbuHamilModel.Dusun(
            id: '3',
            nama: 'Dusun Jajag',
            desaKelurahan: RiwayatMonitoringIbuHamilModel.DesaKelurahan(
              id: '3',
              nama: 'Jajag',
              kecamatan: RiwayatMonitoringIbuHamilModel.Kecamatan(
                id: '3',
                nama: 'Gambiran',
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
            id: '2',
            nama: 'Rahmat Hidayat',
          ),
          kartuKeluarga: RiwayatMonitoringIbuHamilModel.KartuKeluarga(
            id: '2',
            nomorKk: '3501090217727',
          ),
        ),
        pengukuranIbuHamil: [],
        alamat: 'Jalan Ahmad Yani No. 23',
      ),
    ),

    RiwayatMonitoringIbuHamilModel.RiwayatMonitoringIbuHamilModel(
      message: 'Berhasil mendapatkan data ibu hamil',
      data: RiwayatMonitoringIbuHamilModel.Data(
        posyandu: RiwayatMonitoringIbuHamilModel.Posyandu(
          id: '1',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: DateTime.now(),
          namaPosyandu: 'Posyandu Anggrek 2',
          alamat: 'Jalan Sultan Hasanuddin 2',
        ),
        id: '3',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: null,
        usiaKehamilan: '1 Bulan',
        beratBadan: '59',
        tinggiBadan: '162',
        hemoglobin: '12.2',
        jumlahTabletFe: 22,
        tanggalPertamaHaid: DateTime.now().subtract(Duration(days: 20)),
        tanggalTerakhirHaid: DateTime.now().subtract(Duration(days: 15)),
        lingkarLenganAtas: '23.8',
        tinggiFundusUteri: '10.1',
        terpaparAsapRokok: 'Tidak',
        catatan: 'Ibu dalam kondisi sehat',
        ibuAnak: RiwayatMonitoringIbuHamilModel.IbuAnak(
          rt: '4',
          rw: '3',
          id: '3',
          nik: '808109021412333',
          nama: "Kania Wijayanti",
          tempatLahir: 'Ambon',
          tanggalLahir: DateTime(1997, 7, 19),
          dusun: RiwayatMonitoringIbuHamilModel.Dusun(
            id: '5',
            nama: 'Dusun Batu Merah',
            desaKelurahan: RiwayatMonitoringIbuHamilModel.DesaKelurahan(
              id: '5',
              nama: 'Batu Merah',
              kecamatan: RiwayatMonitoringIbuHamilModel.Kecamatan(
                id: '5',
                nama: 'Sirimau',
                kabupatenKota: RiwayatMonitoringIbuHamilModel.KabupatenKota(
                  id: '5',
                  nama: 'Ambon',
                  provinsi: RiwayatMonitoringIbuHamilModel.Provinsi(
                    id: '2',
                    nama: 'Maluku',
                  ),
                ),
              ),
            ),
          ),
          ayah: RiwayatMonitoringIbuHamilModel.Ayah(
            id: '3',
            nama: 'Hendra Wijaya',
          ),
          kartuKeluarga: RiwayatMonitoringIbuHamilModel.KartuKeluarga(
            id: '3',
            nomorKk: '8081090217729',
          ),
        ),
        pengukuranIbuHamil: [],
        alamat: 'Jalan Sultan Hasanuddin No. 45',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listPengukuranIbuHamil.length,
      itemBuilder: (context, index) {
        RiwayatMonitoringIbuHamilModel.RiwayatMonitoringIbuHamilModel ibuHamil =
            listPengukuranIbuHamil[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: shadowSm,
          ),
          child: PengukuranIbuHamilItems(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DetailPengukuranIbuHamil(
                    detailPengukuranIbuHamil: ibuHamil,
                  );
                },
              ));
            },
            name: ibuHamil.data.ibuAnak.nama,
            nik: ibuHamil.data.ibuAnak.nik,
            date: DateFormat('dd/MM/yyyy').format(
              ibuHamil.data.tanggalTerakhirHaid,
            ),
          ),
        );
      },
    );
  }
}
