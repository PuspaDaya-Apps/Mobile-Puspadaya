part of 'internet_bloc.dart';

sealed class InternetEvent extends Equatable {
  const InternetEvent();

  @override
  List<Object> get props => [];
}
class InternetObserve extends InternetEvent {}

class InternetNotify extends InternetEvent {
  final bool isConnected;
  const InternetNotify({required this.isConnected});
}

class CheckInternet extends InternetEvent {}