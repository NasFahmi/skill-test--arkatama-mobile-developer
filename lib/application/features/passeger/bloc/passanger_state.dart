part of 'passanger_bloc.dart';

sealed class PassangerState extends Equatable {
  const PassangerState();
  
  @override
  List<Object> get props => [];
}

final class PassangerInitial extends PassangerState {}
final class PassangerLoading extends PassangerState {}

final class PassangerFormLoaded extends PassangerState{
  final List<TravelEntity> travelEntity;
  const PassangerFormLoaded(this.travelEntity);

  @override
  List<Object> get props => [travelEntity];
}
final class PassangerFormLoading extends PassangerState{}

final class PassangerFormError extends PassangerState{
  final String message;
  const PassangerFormError(this.message);

  @override
  List<Object> get props => [message];
}


final class PassangerSuccess extends PassangerState{}

final class PassangerFailed extends PassangerState{
  final String message;
  const PassangerFailed(this.message);

  @override
  List<Object> get props => [message];

}