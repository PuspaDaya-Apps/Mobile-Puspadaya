part of 'get_anak_tamu_bloc.dart';

sealed class GetAnakTamuEvent extends Equatable {
  const GetAnakTamuEvent();

  @override
  List<Object> get props => [];
}

final class GetAnakTamu extends GetAnakTamuEvent {
  final String idPosyandu;

  const GetAnakTamu(this.idPosyandu);
}