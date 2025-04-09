part of 'update_kehadiran_anak_bloc.dart';

sealed class UpdateKehadiranAnakState extends Equatable {
  const UpdateKehadiranAnakState();
  
  @override
  List<Object> get props => [];
}

final class UpdateKehadiranAnakInitial extends UpdateKehadiranAnakState {}

final class UpdateKehadiranFormAnakLoading extends UpdateKehadiranAnakState {}

final class UpdateKehadiranFormAnakSuccess extends UpdateKehadiranAnakState {
  // anak
  final GetAllAnakByPosyandu dataAnak;

  const UpdateKehadiranFormAnakSuccess({
    required this.dataAnak,
  });
  // CopyWith method untuk update state
  UpdateKehadiranFormAnakSuccess copyWith({
    List<String>? selectedAnakIds,
  }) {
    return UpdateKehadiranFormAnakSuccess(
      dataAnak: dataAnak,
    );
  }

  @override
  List<Object> get props => [dataAnak];
}

final class UpdateKehadiranFormAnakFailed extends UpdateKehadiranAnakState {
  final String message;

  const UpdateKehadiranFormAnakFailed(this.message);

  @override
  List<Object> get props => [message];
}
final class UpdateKehadiranFormAnakEmpty extends UpdateKehadiranAnakState {}

final class TokenExpiredState extends UpdateKehadiranAnakState {}
