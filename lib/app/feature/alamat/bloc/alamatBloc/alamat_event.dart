part of 'alamat_bloc.dart';

sealed class AlamatEvent extends Equatable {
  const AlamatEvent();

  @override
  List<Object> get props => [];
}

final class CheckAlamatEvent extends AlamatEvent {}

final class GetAlamatEvent extends AlamatEvent {}