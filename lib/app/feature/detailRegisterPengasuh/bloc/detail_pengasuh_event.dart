part of 'detail_pengasuh_bloc.dart';

sealed class DetailPengasuhEvent extends Equatable {
  const DetailPengasuhEvent();

  @override
  List<Object> get props => [];
}

final class GetDetailPengasuh extends DetailPengasuhEvent {
  final String pengasuhId;

  const GetDetailPengasuh(this.pengasuhId);
}
