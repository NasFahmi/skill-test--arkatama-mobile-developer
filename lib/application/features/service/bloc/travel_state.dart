part of 'travel_bloc.dart';

sealed class TravelState extends Equatable {
  const TravelState();
  
  @override
  List<Object> get props => [];
}

class TravelInitial extends TravelState {}
class TravelLoading extends TravelState {}

class TravelSuccess extends TravelState {}

class TravelError extends TravelState {
  final String message;

  const TravelError(this.message);

  @override
  List<Object> get props => [message];
}