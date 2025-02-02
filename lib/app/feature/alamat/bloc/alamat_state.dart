part of 'alamat_bloc.dart';

sealed class AlamatState extends Equatable {
  const AlamatState();
}

final class AlamatInitial extends AlamatState {
  @override
  List<Object> get props => [];
}
