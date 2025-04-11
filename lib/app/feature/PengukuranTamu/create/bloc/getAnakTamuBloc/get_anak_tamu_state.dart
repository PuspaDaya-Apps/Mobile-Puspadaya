part of 'get_anak_tamu_bloc.dart';

sealed class GetAnakTamuState extends Equatable {
  const GetAnakTamuState();
  
  @override
  List<Object> get props => [];
}

final class GetAnakTamuInitial extends GetAnakTamuState {}

final class GetAnakTamuProccessState extends GetAnakTamuState {}

final class GetAnakTamuSuccessState extends GetAnakTamuState {
  final GetListTamuResponseModel getListTamuResponseModel;

  const GetAnakTamuSuccessState(this.getListTamuResponseModel);
}

final class GetAnakTamuFailedState extends GetAnakTamuState {
  final String error;

  const GetAnakTamuFailedState(this.error);
}

final class GetAnakTamuTokenExpiredState extends GetAnakTamuState {}
