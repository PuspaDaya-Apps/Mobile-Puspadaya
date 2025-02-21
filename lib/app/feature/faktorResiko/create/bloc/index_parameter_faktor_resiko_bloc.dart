import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/logger/logger.dart';
import '../../../../../utils/shared_preferences_utils/shared_preferences_utils.dart';
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

    int existingIndex =
        dataQuisioner.indexWhere((e) => e.pertanyaanId == event.questionId);

    if (event.isMultipleChoice) {
      // ✅ Multiple Choice (Checklist)
      if (existingIndex != -1) {
        // Ambil jawaban yang sudah ada
        List<String> updatedAnswers =
            List.from(dataQuisioner[existingIndex].jawabanId);

        // Tambah jawaban baru yang belum ada, hapus jika sudah ada
        for (var answer in event.answerId) {
          if (updatedAnswers.contains(answer)) {
            updatedAnswers.remove(answer);
          } else {
            updatedAnswers.add(answer);
          }
        }

        // Update jawaban di list
        dataQuisioner[existingIndex] = PostPertanyaanModel.FaktorResiko(
            pertanyaanId: event.questionId, jawabanId: updatedAnswers);
      } else {
        // Tambahkan sebagai jawaban baru
        dataQuisioner.add(PostPertanyaanModel.FaktorResiko(
            pertanyaanId: event.questionId, jawabanId: event.answerId));
      }
    } else {
      // ✅ Single Choice (Radio Button)
      if (existingIndex != -1) {
        dataQuisioner[existingIndex] = PostPertanyaanModel.FaktorResiko(
            pertanyaanId: event.questionId, jawabanId: [event.answerId[0]]);
      } else {
        dataQuisioner.add(PostPertanyaanModel.FaktorResiko(
            pertanyaanId: event.questionId, jawabanId: [event.answerId[0]]));
      }
    }

    logger.d('Jumlah jawaban tersimpan: ${dataQuisioner.length}');

    emit(IndexParamterFaktorResikoUpdated(dataQuisioner));
  }

  Future<void> saveAnswersToStorage(
      List<PostPertanyaanModel.FaktorResiko> answers) async {
    String jsonString = jsonEncode(answers.map((e) => e.toJson()).toList());
    await SharedPrefUtils().storedFaktorResiko(jsonString);
  }

  Future<List<PostPertanyaanModel.FaktorResiko>>
      loadAnswersFromStorage() async {
    String? jsonString = await SharedPrefUtils().getFaktorResiko();

    if (jsonString == null) {
      return []; // Jika tidak ada data, kembalikan list kosong
    }

    List<dynamic> decodedList = jsonDecode(jsonString);
    return decodedList
        .map((item) => PostPertanyaanModel.FaktorResiko.fromJson(item))
        .toList();
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
        ;
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
