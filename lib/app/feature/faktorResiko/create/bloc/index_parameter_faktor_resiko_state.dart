part of 'index_parameter_faktor_resiko_bloc.dart';

sealed class IndexParameterFaktorResikoState extends Equatable {
  const IndexParameterFaktorResikoState();

  @override
  List<Object> get props => [];
}

final class IndexParameterFaktorResikoInitial
    extends IndexParameterFaktorResikoState {}

final class IndexParamterFaktorResikoLoading
    extends IndexParameterFaktorResikoState {}

final class IndexParamterFaktorResikoSuccess
    extends IndexParameterFaktorResikoState {
  final GetIndexPertanyaanModel data;
  const IndexParamterFaktorResikoSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class IndexParamterFaktorResikoFailed
    extends IndexParameterFaktorResikoState {
  final String message;
  IndexParamterFaktorResikoFailed(this.message);
}

final class TokenExpiredState extends IndexParameterFaktorResikoState {}

final class IndexParamterFaktorResikoSendSuccess
    extends IndexParameterFaktorResikoState {}

//! select state
final class IndexParamterFaktorResikoUpdated
    extends IndexParameterFaktorResikoState {
  List<PostPertanyaanModel.FaktorResiko>
      answers; // Menyimpan jawaban dengan format {questionId: answerId}

  IndexParamterFaktorResikoUpdated(this.answers);

  @override
  List<Object> get props => [answers];
}

//! send state to servear\
final class IndexParameterFaktorResikoSendLoading
    extends IndexParameterFaktorResikoState {}

final class IndexParameterFaktorResikoSendSucces
    extends IndexParameterFaktorResikoState {}

final class IndexParamterFaktorResikoSendFailed
    extends IndexParameterFaktorResikoState {
  final String message;
  IndexParamterFaktorResikoSendFailed(this.message);
}
