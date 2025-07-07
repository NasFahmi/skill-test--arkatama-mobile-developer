part of 'travel_bloc.dart';

sealed class TravelEvent extends Equatable {
  const TravelEvent();

  @override
  List<Object> get props => [];
}
class CreateTravel extends TravelEvent {
  final String serviceName;
  final int quota;
  final String carFleet;
  final DateTime departureDate;

  const CreateTravel({
    required this.serviceName,
    required this.quota,
    required this.carFleet,
    required this.departureDate,
  });

  @override
  List<Object> get props => [serviceName, quota, carFleet, departureDate];
}