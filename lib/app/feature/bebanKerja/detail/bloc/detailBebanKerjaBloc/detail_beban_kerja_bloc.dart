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
          //tempt data
          List<Jobitem> administrasi = [];
          List<Jobitem> keterampilanBayidanBalitaTugasLainnya = [];
          List<Jobitem> keterampilanIbuHamilDanMenyusui = [];
          List<Jobitem> tambahan = [];
          List<Jobitem> tugasLainnya = [];

          List<PenugasanKader> temp = detailBebanKerjaResponseModel.data!.penugasanKader!;

          for (var value in temp) {
            if(value.tugasKader.tipeTugas == "Administrasi") {
              administrasi.add(
                Jobitem(
                  label: value.tugasKader.namaTugas
                )
              );
            }
            if(value.tugasKader.tipeTugas == "Keterampilan Bayi dan Balita Tugas Lainnya") {
              keterampilanBayidanBalitaTugasLainnya.add(
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
            if(value.tugasKader.tipeTugas == "Tambahan") {
              tambahan.add(
                Jobitem(
                  label: value.tugasKader.namaTugas
                )
              );
            }
            if(value.tugasKader.tipeTugas == "Tugas Lainnya") {
              tugasLainnya.add(
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
                label: "Keterampilan Bayi dan Balita Tugas Lainnya",
                subItems: keterampilanBayidanBalitaTugasLainnya
              ),
              Jobitem(
                label: "Keterampilan Ibu Hamil dan Menyusui",
                subItems: keterampilanIbuHamilDanMenyusui
              ),
              Jobitem(
                label: "Tambahan",
                subItems: tambahan
              ),
              Jobitem(
                label: "Tugas Lainnya",
                subItems: tugasLainnya
              )
            ]  
          ));

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
