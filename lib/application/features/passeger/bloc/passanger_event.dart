part of 'passanger_bloc.dart';

sealed class PassangerEvent extends Equatable {
  const PassangerEvent();

  @override
  List<Object> get props => [];
}
final class CreatePassangerFormLoaded extends PassangerEvent {}
final class CreatePassangerEvent extends PassangerEvent {
  final String inputText; // "Arkatama 25 Malang"
  final int travelId;
  final String pickupLocation;
  final String phoneNumber;

  const CreatePassangerEvent({
    required this.inputText,
    required this.travelId,
    required this.pickupLocation,
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [inputText, travelId, pickupLocation, phoneNumber];
}
