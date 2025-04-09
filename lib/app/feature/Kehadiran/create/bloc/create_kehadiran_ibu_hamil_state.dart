part of 'create_kehadiran_ibu_hamil_bloc.dart';

sealed class CreateKehadiranIbuHamilState extends Equatable {
  const CreateKehadiranIbuHamilState();
  
  @override
  List<Object> get props => [];
}

final class CreateKehadiranIbuHamilInitial extends CreateKehadiranIbuHamilState {}

// load form
final class CreateKehadiranFormIbuHamilLoading extends CreateKehadiranIbuHamilState {}

final class CreateKehadiranFormIbuHamilEmpty extends CreateKehadiranIbuHamilState {}

final class CreateKeadiranFormIbuHamilSuccess extends CreateKehadiranIbuHamilState {
  // ibu
  final GetAllIbuHamilByPosyandu dataIbuHamil;

  const CreateKeadiranFormIbuHamilSuccess({
    required this.dataIbuHamil,
  });
  // CopyWith method untuk update state
  CreateKeadiranFormIbuHamilSuccess copyWith({
    List<String>? selectedIbuHamilIds,
  }) {
    return CreateKeadiranFormIbuHamilSuccess(
      dataIbuHamil: dataIbuHamil,
    );
  }

  @override
  List<Object> get props => [ dataIbuHamil];
}


final class CreateKehadiranFormIbuHamilFailed extends CreateKehadiranIbuHamilState {
  final String message;

  const CreateKehadiranFormIbuHamilFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class TokenExpiredState extends CreateKehadiranIbuHamilState {}