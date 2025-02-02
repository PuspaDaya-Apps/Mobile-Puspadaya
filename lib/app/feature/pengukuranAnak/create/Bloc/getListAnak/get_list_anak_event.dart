part of 'get_list_anak_bloc.dart';

sealed class GetListAnakEvent extends Equatable {
  const GetListAnakEvent();

  @override
  List<Object> get props => [];
}

final class GetListAnak extends GetListAnakEvent {}