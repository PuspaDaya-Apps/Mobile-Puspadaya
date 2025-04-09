part of 'create_kehadiran_anak_bloc.dart';

sealed class CreateKehadiranAnakState extends Equatable {
  const CreateKehadiranAnakState();
  
  @override
  List<Object> get props => [];
}

final class CreateKehadiranAnakInitial extends CreateKehadiranAnakState {}

// load form
final class CreateKehadiranFormAnakLoading extends CreateKehadiranAnakState {}

final class CreateKeadiranFormAnakSuccess extends CreateKehadiranAnakState {
  // anak
  final GetAllAnakByPosyandu dataAnak;

  const CreateKeadiranFormAnakSuccess({
    required this.dataAnak,
  });
  // CopyWith method untuk update state
  CreateKeadiranFormAnakSuccess copyWith({
    List<String>? selectedAnakIds,
  }) {
    return CreateKeadiranFormAnakSuccess(
      dataAnak: dataAnak,
    );
  }

  @override
  List<Object> get props => [dataAnak];
}


final class CreateKehadiranFormAnakEmpty extends CreateKehadiranAnakState {}

final class CreateKehadiranFormAnakFailed extends CreateKehadiranAnakState {
  final String message;

  const CreateKehadiranFormAnakFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends CreateKehadiranAnakState {}