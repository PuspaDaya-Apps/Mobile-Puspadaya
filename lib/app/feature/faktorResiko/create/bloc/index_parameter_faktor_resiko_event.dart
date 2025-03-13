part of 'index_parameter_faktor_resiko_bloc.dart';

sealed class IndexParameterFaktorResikoEvent extends Equatable {
  const IndexParameterFaktorResikoEvent();

  @override
  List<Object> get props => [];
}

final class FetchFaktorResikoById extends IndexParameterFaktorResikoEvent {
  final String id;
  FetchFaktorResikoById(this.id);
  @override
  List<Object> get props => [];
}

class SelectAnswer extends IndexParameterFaktorResikoEvent {
  final String questionId;
  final List<String> answerId;
  final bool
      isMultipleChoice; // Tambahkan informasi apakah ini multiple atau single selection
  final String? otherAnswer;

  const SelectAnswer(
    this.otherAnswer, {
    required this.questionId,
    required this.answerId,
    required this.isMultipleChoice,
  });

  @override
  List<Object> get props => [questionId, answerId, isMultipleChoice];
}

class SendAnswerQuestion extends IndexParameterFaktorResikoEvent {
  final String anakId;
  final List<PostPertanyaanModel.FaktorResiko> data;
  SendAnswerQuestion({required this.anakId, required this.data});
  @override
  List<Object> get props => [anakId, data];
}
