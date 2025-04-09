part of 'update_kehadiran_ibu_hamil_bloc.dart';

sealed class UpdateKehadiranIbuHamilState extends Equatable {
  const UpdateKehadiranIbuHamilState();
  
  @override
  List<Object> get props => [];
}

final class UpdateKehadiranIbuHamilInitial extends UpdateKehadiranIbuHamilState {}

final class UpdateKehadiranFormIbuHamilLoading extends UpdateKehadiranIbuHamilState {}

final class UpdateKehadiranFormIbuHamilSuccess extends UpdateKehadiranIbuHamilState {
  // IbuHamil
  final GetAllIbuHamilByPosyandu dataIbuHamil;

  const UpdateKehadiranFormIbuHamilSuccess({
    required this.dataIbuHamil,
  });
  // CopyWith method untuk update state
  UpdateKehadiranFormIbuHamilSuccess copyWith({
    List<String>? selectedIbuHamilIds,
  }) {
    return UpdateKehadiranFormIbuHamilSuccess(
      dataIbuHamil: dataIbuHamil,
    );
  }

  @override
  List<Object> get props => [dataIbuHamil];
}

final class UpdateKehadiranFormIbuHamilFailed extends UpdateKehadiranIbuHamilState {
  final String message;

  const UpdateKehadiranFormIbuHamilFailed(this.message);

  @override
  List<Object> get props => [message];
}
final class UpdateKehadiranFormIbuHamilEmpty extends UpdateKehadiranIbuHamilState {}

final class TokenExpiredState extends UpdateKehadiranIbuHamilState {}
