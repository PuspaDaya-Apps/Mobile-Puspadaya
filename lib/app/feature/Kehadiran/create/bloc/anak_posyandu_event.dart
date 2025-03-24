part of 'anak_posyandu_bloc.dart';

sealed class AnakPosyanduEvent extends Equatable {
  const AnakPosyanduEvent();

  @override
  List<Object> get props => [];
}

final class GetAnakPosyanduEvent extends AnakPosyanduEvent {
  final String id;

  const GetAnakPosyanduEvent({required this.id});
  
}