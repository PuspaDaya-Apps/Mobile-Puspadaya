import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puspadaya/config/theme/pallet_color.dart';
import 'package:puspadaya/route/route_name.dart';

import '../../../../../config/theme/shadow.dart';
import '../../../../view/screen/data_not_found_screen.dart';
import '../../../../view/widget/riwayat_ibu_hamil_items_widget.dart';
import '../../model/get_all_monitoring_ibu_hamil_model.dart'
    as GetAllMonitoringIbuHamil;
import '../bloc/index_data_ibu_hamil_bloc.dart';

class DataIbuHamil extends StatelessWidget {
  const DataIbuHamil({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IndexDataIbuHamilBloc(),
      child: DataIbuHamilView(),
    );
  }
}

class DataIbuHamilView extends StatefulWidget {
  const DataIbuHamilView({super.key});

  @override
  State<DataIbuHamilView> createState() => _DataIbuHamilViewState();
}

class _DataIbuHamilViewState extends State<DataIbuHamilView> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<IndexDataIbuHamilBloc>().add(FetchIndexDataIbuHamil());
    super.initState();
  }

  // List<RiwayatMonitoringIbuHamilModel.RiwayatMonitoringIbuHamilModel>
  //     listMonitoringIbuHamil = [
  //   RiwayatMonitoringIbuHamilModel.RiwayatMonitoringIbuHamilModel(
  //     message: 'Berhasil mendapatkan data ibu hamil',
  //     data: RiwayatMonitoringIbuHamilModel.Data(
  //       id: '1',
  //       createdAt: DateTime.now(),
  //       updatedAt: DateTime.now(),
  //       deletedAt: null,
  //       usiaKehamilan: '6 Bulan',
  //       beratBadan: '65',
  //       tinggiBadan: '165',
  //       hemoglobin: '12.5',
  //       jumlahTabletFe: 20,
  //       tanggalPertamaHaid: DateTime.now()..subtract(Duration(days: 6 * 30)),
  //       tanggalTerakhirHaid: DateTime.now()..subtract(Duration(days: 5 * 30)),
  //       lingkarLenganAtas: '12.40',
  //       tinggiFundusUteri: '30.20',
  //       terpaparAsapRokok: 'Ya',
  //       catatan: 'catatan',
  //       ibuAnak: RiwayatMonitoringIbuHamilModel.IbuAnak(
  //           rt: '2',
  //           rw: '4',
  //           id: '1',
  //           nik: '351009021412331',
  //           nama: "Safinatus Sa'adah",
  //           tempatLahir: 'Banyuwangi',
  //           tanggalLahir: DateTime(2001, 5, 21),
  //           dusun: RiwayatMonitoringIbuHamilModel.Dusun(
  //             id: '4',
  //             nama: 'Dusun Krajan',
  //             desaKelurahan: RiwayatMonitoringIbuHamilModel.DesaKelurahan(
  //               id: '4',
  //               nama: 'Kedungrejo',
  //               kecamatan: RiwayatMonitoringIbuHamilModel.Kecamatan(
  //                 id: '4',
  //                 nama: 'Muncar',
  //                 kabupatenKota: RiwayatMonitoringIbuHamilModel.KabupatenKota(
  //                   id: '4',
  //                   nama: 'Banyuwangi',
  //                   provinsi: RiwayatMonitoringIbuHamilModel.Provinsi(
  //                     id: '1',
  //                     nama: 'Jawa Timur',
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //           ayah: RiwayatMonitoringIbuHamilModel.Ayah(
  //               id: '1', nama: 'Satrio Wicaksono'),
  //           kartuKeluarga: RiwayatMonitoringIbuHamilModel.KartuKeluarga(
  //               id: '1', nomorKk: '3510090217726')),
  //       pengukuranIbuHamil: [],
  //       alamat: 'Kampung Melati Indah, Jalan Ki Hajar Dewantara No 10',
  //     ),
  //   ),
  //   RiwayatMonitoringIbuHamilModel.RiwayatMonitoringIbuHamilModel(
  //     message: 'Berhasil mendapatkan data ibu hamil',
  //     data: RiwayatMonitoringIbuHamilModel.Data(
  //       id: '2',
  //       createdAt: DateTime.now(),
  //       updatedAt: DateTime.now(),
  //       deletedAt: null,
  //       usiaKehamilan: '5 Bulan',
  //       beratBadan: '70',
  //       tinggiBadan: '160',
  //       hemoglobin: '11.0',
  //       jumlahTabletFe: 15,
  //       tanggalPertamaHaid:
  //           DateTime.now().subtract(Duration(days: 150)), // 5 bulan yang lalu
  //       tanggalTerakhirHaid:
  //           DateTime.now().subtract(Duration(days: 120)), // 4 bulan yang lalu
  //       lingkarLenganAtas: '13.00',
  //       tinggiFundusUteri: '28.00',
  //       terpaparAsapRokok: 'Tidak',
  //       catatan: 'Ibu dalam kondisi sehat',
  //       ibuAnak: RiwayatMonitoringIbuHamilModel.IbuAnak(
  //         rt: '1',
  //         rw: '5',
  //         id: '2',
  //         nik: '808109021412332',
  //         nama: "Rina Melati",
  //         tempatLahir: 'Maluku Tengah',
  //         tanggalLahir: DateTime(1999, 8, 10),
  //         dusun: RiwayatMonitoringIbuHamilModel.Dusun(
  //           id: '1',
  //           nama: 'Dusun Hatu',
  //           desaKelurahan: RiwayatMonitoringIbuHamilModel.DesaKelurahan(
  //             id: '1',
  //             nama: 'Hatu',
  //             kecamatan: RiwayatMonitoringIbuHamilModel.Kecamatan(
  //               id: '1',
  //               nama: 'Seram Utara',
  //               kabupatenKota: RiwayatMonitoringIbuHamilModel.KabupatenKota(
  //                 id: '1',
  //                 nama: 'Maluku Tengah',
  //                 provinsi: RiwayatMonitoringIbuHamilModel.Provinsi(
  //                   id: '1',
  //                   nama: 'Maluku',
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         ayah: RiwayatMonitoringIbuHamilModel.Ayah(
  //           id: '2',
  //           nama: 'Andi Prasetyo',
  //         ),
  //         kartuKeluarga: RiwayatMonitoringIbuHamilModel.KartuKeluarga(
  //           id: '2',
  //           nomorKk: '8081090217728',
  //         ),
  //       ),
  //       pengukuranIbuHamil: [], alamat: 'Kampung Kuno, Jalan Hatu Raya',
  //     ),
  //   )
  // ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexDataIbuHamilBloc, IndexDataIbuHamilState>(
      builder: (context, state) {
        if (state is IndexDataIbuHamilLoading) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Center(
              child: SpinKitThreeBounce(
                color: bluePrimaryMain,
                size: 50.0,
              ),
            ),
          );
        } else if (state is IndexDataIbuHamilFailed) {
          return Center(
            child: Text('Gagal memuat data ${state.message}'),
          );
        } else if (state is IndexDataIbuHamilSuccess) {
          if (state.data.data.isEmpty) {
            return DataNotFoundScreen();
          }
          return ListView.builder(
            itemCount: state.data.data.length,
            itemBuilder: (context, index) {
              GetAllMonitoringIbuHamil.Datum dataIbuHamil =
                  state.data.data[index];
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
                child: RiwayatIbuHamilItems(
                  onTap: () {
                    Navigator.pushNamed(context, DETAIL_MONITORING_IBU_HAMIL,
                        arguments: dataIbuHamil.id);
                  },
                  name: dataIbuHamil.namaIbu,
                  nik: dataIbuHamil.nik,
                  gestationalAge: dataIbuHamil.usiaKehamilan,
                ),
              );
            },
          );
        }

        return Container();
      },
    );
  }
}
