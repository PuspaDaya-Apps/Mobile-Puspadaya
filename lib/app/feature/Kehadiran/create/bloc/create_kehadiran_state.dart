part of 'create_kehadiran_bloc.dart';

sealed class CreateKehadiranState extends Equatable {
  const CreateKehadiranState();

  @override
  List<Object> get props => [];
}

final class CreateKehadiranInitial extends CreateKehadiranState {}

// load form
final class CreateKehadiranFormLoading extends CreateKehadiranState {}

final class CreateKeadiranFormSuccess extends CreateKehadiranState {
  // anak
  final GetAllAnakByPosyandu dataAnak;
  // ibu
  final GetAllIbuHamilByPosyandu dataIbuHamil;

  const CreateKeadiranFormSuccess({
    required this.dataAnak,
    required this.dataIbuHamil,
  });
  // CopyWith method untuk update state
  CreateKeadiranFormSuccess copyWith({
    List<String>? selectedAnakIds,
    List<String>? selectedIbuHamilIds,
  }) {
    return CreateKeadiranFormSuccess(
      dataAnak: dataAnak,
      dataIbuHamil: dataIbuHamil,
    );
  }

  @override
  List<Object> get props => [dataAnak, dataIbuHamil];
}

final class CreateKehadiranFormFailed extends CreateKehadiranState {
  final String message;

  const CreateKehadiranFormFailed(this.message);

  @override
  List<Object> get props => [message];
}
// submit form

final class CreateKehadiranSubmitLoading extends CreateKehadiranState {}

final class CreateKehadiranSubmitSuccess extends CreateKehadiranState {}

final class CreateKehadiranSubmitFailed extends CreateKehadiranState {
  final String message;

  const CreateKehadiranSubmitFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends CreateKehadiranState {}
