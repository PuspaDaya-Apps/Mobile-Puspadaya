import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:puspadaya/app/feature/faktorResiko/create/model/select_answer_model.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
import '../../../../../utils/storage/storage_utils.dart';
import '../model/get_index_pertanyaan_model.dart';
import '../model/post_pertanyaan_model.dart' as PostPertanyaanModel;
import '../service/create_faktor_resiko.dart';

part 'index_parameter_faktor_resiko_event.dart';
part 'index_parameter_faktor_resiko_state.dart';

class IndexParameterFaktorResikoBloc extends Bloc<
    IndexParameterFaktorResikoEvent, IndexParameterFaktorResikoState> {
  // ✅ Data jawaban disimpan sebagai variabel global di dalam Bloc
  List<PostPertanyaanModel.FaktorResiko> dataQuisioner = [];

  bool get isAnswerQuisioner =>
      dataQuisioner.isNotEmpty; // ✅ Cek jika ada jawaban

  IndexParameterFaktorResikoBloc()
      : super(IndexParameterFaktorResikoInitial()) {
    on<FetchFaktorResikoById>(getParameterFaktorResiko);
    on<SelectAnswer>(selectAnswerQuisioner);
    on<SelectMultipleAnswer>(selectMultipleAnswerQuisioner);
    on<SendAnswerQuestion>(sendAnswerQuestion);
  }

  Future<void> getParameterFaktorResiko(FetchFaktorResikoById event,
      Emitter<IndexParameterFaktorResikoState> emit) async {
    emit(IndexParamterFaktorResikoLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        dynamic response = await CreateFaktorResiko()
            .getFaktorResikoByBalita(accessToken, event.id);
        int statusCode = response[0] as int;
        GetIndexPertanyaanModel faktorResikoData =
            GetIndexPertanyaanModel.fromJson(response[1]);
        // logger.d("Fakto Resiko data image ${faktorResikoData.data[0].gambar}");
        // String image = await StorageUtils().getImageFromStorage(accessToken, faktorResikoData.data[0].gambar);

        if (statusCode == 200) {
          logger.d('Sukses mendapatkan data faktor risiko');
          emit(IndexParamterFaktorResikoSuccess(faktorResikoData));
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(IndexParamterFaktorResikoFailed(faktorResikoData.message));
        }
      } catch (error) {
        emit(IndexParamterFaktorResikoFailed(error.toString()));
      }
    }
  }

  Future<void> selectAnswerQuisioner(
      SelectAnswer event, Emitter<IndexParameterFaktorResikoState> emit) async {
    if (state is IndexParamterFaktorResikoUpdated) {
      dataQuisioner =
          List.from((state as IndexParamterFaktorResikoUpdated).answers);
    }

    String? jawabanLainya = event.data.otherAnswer?.isNotEmpty == true
        ? event.data.otherAnswer
        : null;

    int existingIndex = dataQuisioner
        .indexWhere((e) => e.pertanyaanId == event.data.questionId);

    if (event.data.isMultipleChoice) {
      // ✅ Multiple Choice (Checklist)
      if (existingIndex != -1) {
        // Ambil jawaban yang sudah ada
        List<String> updatedAnswers =
            List.from(dataQuisioner[existingIndex].jawabanId);

        // Tambah jawaban baru yang belum ada, hapus jika sudah ada
        for (var answer in event.data.answerId) {
          if (updatedAnswers.contains(answer)) {
            updatedAnswers.remove(answer);
          } else {
            updatedAnswers.add(answer);
          }
        }

        // Jika semua jawaban dihapus, hapus juga objek dari list
        if (updatedAnswers.isEmpty) {
          dataQuisioner.removeAt(existingIndex);
        } else {
          // Update jawaban di list dengan atau tanpa jawaban lainnya
          dataQuisioner[existingIndex] = PostPertanyaanModel.FaktorResiko(
            pertanyaanId: event.data.questionId,
            jawabanId: updatedAnswers,
            jawabanText: updatedAnswers.contains(event.data.answerId[0])
                ? jawabanLainya
                : null, // Hapus jawaban lainnya jika opsi dihapus
          );
        }
      } else {
        // Tambahkan sebagai jawaban baru
        if (event.data.answerId.isNotEmpty) {
          dataQuisioner.add(PostPertanyaanModel.FaktorResiko(
            pertanyaanId: event.data.questionId,
            jawabanId: event.data.answerId,
            jawabanText: jawabanLainya,
          ));
        }
      }
    } else {
      // ✅ Single Choice (Radio Button)
      if (event.data.answerId.isNotEmpty) {
        String selectedAnswer = event.data.answerId[0];

        if (existingIndex != -1) {
          dataQuisioner[existingIndex] = PostPertanyaanModel.FaktorResiko(
            pertanyaanId: event.data.questionId,
            jawabanId: [selectedAnswer],
            jawabanText: jawabanLainya,
          );
        } else {
          // Tambahkan sebagai jawaban baru
          dataQuisioner.add(PostPertanyaanModel.FaktorResiko(
            pertanyaanId: event.data.questionId,
            jawabanId: [selectedAnswer],
            jawabanText: jawabanLainya,
          ));
        }
      }
    }

    logger.d('Jumlah jawaban tersimpan: ${dataQuisioner.length}');

    emit(IndexParamterFaktorResikoUpdated(dataQuisioner));
  }

  Future<void> selectMultipleAnswerQuisioner(SelectMultipleAnswer event,
      Emitter<IndexParameterFaktorResikoState> emit) async {
    // Jika ada state sebelumnya, gunakan data yang sudah ada
    if (state is IndexParamterFaktorResikoUpdated) {
      dataQuisioner =
          List.from((state as IndexParamterFaktorResikoUpdated).answers);
    }

    // Loop setiap jawaban dari event dan update `dataQuisioner`
    for (var answer in event.data) {
      int existingIndex =
          dataQuisioner.indexWhere((e) => e.pertanyaanId == answer.questionId);

      String? jawabanLainya =
          answer.otherAnswer?.isNotEmpty == true ? answer.otherAnswer : null;

      if (existingIndex != -1) {
        // ✅ Jika pertanyaan sudah ada, update jawabannya
        dataQuisioner[existingIndex] = PostPertanyaanModel.FaktorResiko(
          pertanyaanId: answer.questionId,
          jawabanId: answer.answerId,
          jawabanText: jawabanLainya,
        );
      } else {
        // ✅ Jika pertanyaan belum ada, tambahkan jawaban baru
        dataQuisioner.add(PostPertanyaanModel.FaktorResiko(
          pertanyaanId: answer.questionId,
          jawabanId: answer.answerId,
          jawabanText: jawabanLainya,
        ));
      }
    }

    logger.d('Jumlah jawaban tersimpan: ${dataQuisioner.length}');
    logger.d("Jumlah jawaban yang dikirim ${event.data.length}");

    // Emit state baru dengan jawaban yang diperbarui
    emit(IndexParamterFaktorResikoUpdated(dataQuisioner));
  }

  Future<void> sendAnswerQuestion(SendAnswerQuestion event,
      Emitter<IndexParameterFaktorResikoState> emit) async {
    emit(IndexParameterFaktorResikoSendLoading());
    String? accessToken = await SharedPrefUtils().getAccessToken();

    if (accessToken == null) {
      emit(TokenExpiredState());
    } else {
      try {
        String dateTimeFormatted =
            DateFormat('yyyy-MM-dd').format(DateTime.now());

        PostPertanyaanModel.PostPertanyaanModel postData =
            PostPertanyaanModel.PostPertanyaanModel(
                anakId: event.anakId,
                tanggalPeriode: dateTimeFormatted,
                faktorResiko: event.data);

        dynamic response =
            await CreateFaktorResiko().postFaktorResiko(postData, accessToken);
        int statusCode = response[0] as int;

        if (statusCode == 201) {
          logger.d('Sukses send data faktor risiko');
          emit(IndexParameterFaktorResikoSendSucces());
        } else if (statusCode == 401) {
          emit(TokenExpiredState());
        } else {
          emit(
              IndexParamterFaktorResikoSendFailed('Gagal Send Data To Server'));
        }
      } catch (error) {
        emit(IndexParamterFaktorResikoSendFailed(error.toString()));
      }
    }
  }
}
