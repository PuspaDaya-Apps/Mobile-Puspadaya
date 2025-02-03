part of 'detail_register_anak_bloc.dart';

sealed class DetailRegisterAnakEvent extends Equatable {
  const DetailRegisterAnakEvent();

  @override
  List<Object> get props => [];
}

final class FeathingDetailRegisterAnak extends DetailRegisterAnakEvent {
  final String anakId;
  const FeathingDetailRegisterAnak({required this.anakId});
}
