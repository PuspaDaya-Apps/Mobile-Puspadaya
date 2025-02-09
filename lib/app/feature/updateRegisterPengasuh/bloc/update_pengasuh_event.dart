part of 'update_pengasuh_bloc.dart';

sealed class UpdatePengasuhEvent extends Equatable {
  const UpdatePengasuhEvent();

  @override
  List<Object> get props => [];
}

final class UpdatePengasuh extends UpdatePengasuhEvent {
  final UpdatePengasuhModel updatePengasuhModel;
  final String id;

  const UpdatePengasuh({
    required this.updatePengasuhModel,
    required this.id
  });
}

final class NullErrorEvent extends UpdatePengasuhEvent {}