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
  GetIndexPertanyaanModel data;
  IndexParamterFaktorResikoSuccess(this.data);

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
