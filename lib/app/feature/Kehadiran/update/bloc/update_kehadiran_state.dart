part of 'update_kehadiran_bloc.dart';

sealed class UpdateKehadiranState extends Equatable {
  const UpdateKehadiranState();
  
  @override
  List<Object> get props => [];
}

final class UpdateKehadiranInitial extends UpdateKehadiranState {}

// load form
final class UpdateKehadiranFormLoading extends UpdateKehadiranState {}

final class UpdateKehadiranFormSuccess extends UpdateKehadiranState {
  // anak
  final GetAllAnakByPosyandu dataAnak;
  // ibu
  final GetAllIbuHamilByPosyandu dataIbuHamil;

  const UpdateKehadiranFormSuccess({
    required this.dataAnak,
    required this.dataIbuHamil,
  });
  // CopyWith method untuk update state
  UpdateKehadiranFormSuccess copyWith({
    List<String>? selectedAnakIds,
    List<String>? selectedIbuHamilIds,
  }) {
    return UpdateKehadiranFormSuccess(
      dataAnak: dataAnak,
      dataIbuHamil: dataIbuHamil,
    );
  }

  @override
  List<Object> get props => [dataAnak, dataIbuHamil];
}

final class UpdateKehadiranFormFailed extends UpdateKehadiranState {
  final String message;

  const UpdateKehadiranFormFailed(this.message);

  @override
  List<Object> get props => [message];
}
// submit form

final class UpdateKehadiranSubmitLoading extends UpdateKehadiranState {}

final class UpdateKehadiranSubmitSuccess extends UpdateKehadiranState {}

final class UpdateKehadiranSubmitFailed extends UpdateKehadiranState {
  final String message;

  const UpdateKehadiranSubmitFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends UpdateKehadiranState {}
