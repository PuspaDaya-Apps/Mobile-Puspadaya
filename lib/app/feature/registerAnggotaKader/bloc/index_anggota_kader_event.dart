part of 'index_anggota_kader_bloc.dart';

sealed class IndexAnggotaKaderEvent extends Equatable {
  const IndexAnggotaKaderEvent();

  @override
  List<Object> get props => [];
}

final class GetListAnggotaKaderEvent extends IndexAnggotaKaderEvent{}