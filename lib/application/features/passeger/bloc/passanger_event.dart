part of 'passanger_bloc.dart';

sealed class PassangerEvent extends Equatable {
  const PassangerEvent();

  @override
  List<Object> get props => [];
}
final class CreatePassangerFormLoaded extends PassangerEvent {}
final class CreatePassangerEvent extends PassangerEvent {}