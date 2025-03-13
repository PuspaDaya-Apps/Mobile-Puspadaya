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
  final SelectAnswerModel data;

  const SelectAnswer({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}
class SelectMultipleAnswer extends IndexParameterFaktorResikoEvent {
  final List<SelectAnswerModel> data;

  const SelectMultipleAnswer({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}

class SendAnswerQuestion extends IndexParameterFaktorResikoEvent {
  final String anakId;
  final List<PostPertanyaanModel.FaktorResiko> data;
  SendAnswerQuestion({required this.anakId, required this.data});
  @override
  List<Object> get props => [anakId, data];
}
