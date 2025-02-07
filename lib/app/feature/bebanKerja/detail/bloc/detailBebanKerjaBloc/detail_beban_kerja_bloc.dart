import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:puspadaya/app/feature/bebanKerja/detail/view/model/JobItem.dart';

import '../../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../model/detail_beban_kerja_item_model.dart';
import '../../model/detail_beban_kerja_response_model.dart';
import '../../service/detail_beban_kerja_api.dart';

part 'detail_beban_kerja_event.dart';
part 'detail_beban_kerja_state.dart';

class DetailBebanKerjaBloc extends Bloc<DetailBebanKerjaEvent, DetailBebanKerjaState> {
  DetailBebanKerjaBloc() : super(DetailBebanKerjaInitial()) {
    on<DetailBebanKerjaEvent>((event, emit) {});

    on<GetDetailBebanKerja>(detailBebanKerja);
  }

  Future<void> detailBebanKerja (GetDetailBebanKerja event, Emitter<DetailBebanKerjaState> emit) async {
     emit(DetailBebanKerjaProcessState());

    String? accessToken = await SharedPrefUtils().getAccessToken();

    if(accessToken == null) {
      emit(DetailPengukuanAnakTokenExpiredState());

    } else {
      try {
        List<dynamic> response = await DetailBebanKerjaApi().detailBebanKerjaService(accessToken, event.bebanKerjaId);

        int statusCode = response[0] as int;
        final DetailBebanKerjaResponseModel detailBebanKerjaResponseModel = DetailBebanKerjaResponseModel.fromJson(response[1]);

        if(statusCode == 200) {
          
          //! tempt data
          List<Jobitem> administrasi = [];
          List<Jobitem> keterampilanBayidanBalita = [];
          List<Jobitem> keterampilanIbuHamilDanMenyusui = [];
          List<Jobitem> keterampilan = [];
          List<Jobitem> tambahan = [];
          List<Jobitem> tugasTambahan = [];

          List<PenugasanKader> temp = detailBebanKerjaResponseModel.data!.penugasanKader!;

          for (var value in temp) {
            if(value.tugasKader.tipeTugas == "Administrasi") {
              administrasi.add(
                Jobitem(
                  label: value.tugasKader.namaTugas
                )
              );
            }
            if(value.tugasKader.tipeTugas == "Keterampilan Bayi dan Balita") {
              keterampilanBayidanBalita.add(
                Jobitem(
                  label: value.tugasKader.namaTugas
                )
              );
            }
            if(value.tugasKader.tipeTugas == "Keterampilan Ibu Hamil dan Menyusui") {
              keterampilanIbuHamilDanMenyusui.add(
                Jobitem(
                  label: value.tugasKader.namaTugas
                )
              );
            }
            if(value.tugasKader.tipeTugas == "Keterampilan") {
              keterampilan.add(
                Jobitem(
                  label: value.tugasKader.namaTugas
                )
              );
            }
            if(value.tugasKader.tipeTugas == "Tambahan") {
              tambahan.add(
                Jobitem(
                  label: value.tugasKader.namaTugas
                )
              );
            }
            if(value.tugasKader.tipeTugas == "Tugas Tambahan") {
              tugasTambahan.add(
                Jobitem(
                  label: value.tugasKader.namaTugas
                )
              );
            }
          }

          emit(DetailBebanKerjaSuccesState(
            bulan: detailBebanKerjaResponseModel.data!.bulan,
            item: [
              Jobitem(
                label: "Administrasi",
                subItems: administrasi
              ),
              Jobitem(
                label: "Keterampilan Bayi dan Balita",
                subItems: keterampilanBayidanBalita
              ),
              Jobitem(
                label: "Keterampilan Ibu Hamil dan Menyusui",
                subItems: keterampilanIbuHamilDanMenyusui
              ),
              Jobitem(
                label: "Keterampilan",
                subItems: keterampilan
              ),
              Jobitem(
                label: "Tambahan",
                subItems: tambahan
              ),
              Jobitem(
                label: "Tugas Lainnya",
                subItems: tugasTambahan
              )
            ]  
          ));

          //! ||||||||||||||||||||||||||
          // List<Jobitem> balita = [];
          // List<Jobitem> ibuHamilDanMenyususui = [];
          // List<Jobitem> kunjunganRumah = [];
          // List<Jobitem> tugasTambahan = [];

          // List<PenugasanKader> temp = detailBebanKerjaResponseModel.data!.penugasanKader!;

          // for (var value in temp) {
          //   if(value.jenisKompetensi == "Balita") {
          //     balita.add(
          //       Jobitem(
          //         label: value.namakompetensi,
          //       )
          //     );
          //   }
          //   if(value.jenisKompetensi == "Ibu Hamil dan Menyusui") {
          //     ibuHamilDanMenyususui.add(
          //       Jobitem(
          //         label: value.namakompetensi,
          //       )
          //     );
          //   }
          //   if(value.jenisKompetensi == "Kunjungan Rumah") {
          //     kunjunganRumah.add(
          //       Jobitem(
          //         label: value.namakompetensi,
          //       )
          //     );
          //   }
          //   if(value.jenisKompetensi == "Tugas Tambahan") {
          //     tugasTambahan.add(
          //       Jobitem(
          //         label: value.namakompetensi,
          //       )
          //     );
          //   }
          // } 

          // emit(DetailBebanKerjaSuccesState(
          //   bulan: detailBebanKerjaResponseModel.data!.bulan,
          //   item: [
          //     Jobitem(
          //       label: "Balita", 
          //       subItems: balita,
          //     ),
          //     Jobitem(
          //       label: "Ibu Hamil dan Menyusui", 
          //       subItems: ibuHamilDanMenyususui,
          //     ),
          //     Jobitem(
          //       label: "Kunjungan Rumah ", 
          //       subItems: kunjunganRumah,
          //     ),
          //     Jobitem(
          //       label: "Tugas Tambahan", 
          //       subItems: tugasTambahan,
          //     ),
          //   ]
          // ));

        } else if (statusCode == 401) {
          emit(DetailPengukuanAnakTokenExpiredState());
        } else {
          emit(DetailBebanKerjaFailedState(detailBebanKerjaResponseModel.message));
        }
      } catch (error) {
        emit(DetailBebanKerjaFailedState(error.toString()));
      }
    }
  }
}
