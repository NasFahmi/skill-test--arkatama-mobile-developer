import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skill_test_mobile_developer/config/dependency_injector/dependency_injector.dart';
import 'package:skill_test_mobile_developer/domain/entity/travel_entity.dart';
import 'package:skill_test_mobile_developer/domain/use-case/passanger_use_case.dart';
import 'package:skill_test_mobile_developer/domain/use-case/travel_use_case.dart';

part 'passanger_event.dart';
part 'passanger_state.dart';

class PassangerBloc extends Bloc<PassangerEvent, PassangerState> {
  final TravelUseCase travelUseCase = di<TravelUseCase>();
  final PassengerUseCase passangerUseCase = di<PassengerUseCase>();
  PassangerBloc() : super(PassangerInitial()) {
    on<PassangerEvent>((event, emit) {});
    on<CreatePassangerFormLoaded>(_formLoaded);
    on<CreatePassangerEvent>(_createPassanger);
  }

  Future<void> _formLoaded(
    CreatePassangerFormLoaded event,
    Emitter<PassangerState> emit,
  ) async {
    emit(PassangerFormLoading());

    try {
      List<TravelEntity> travels = await travelUseCase.getAvailableTravels();
      emit(PassangerFormLoaded(travels));
    } catch (e) {
      emit(PassangerFormError("Failed to load travel data: $e"));
    }
  }

  Future<void> _createPassanger(
    CreatePassangerEvent event,
    Emitter<PassangerState> emit,
  ) async {
    emit(PassangerLoading());
    try {
      await passangerUseCase.addPassenger(
        inputText: event.inputText,
        travelId: event.travelId,
        pickupLocation: event.pickupLocation,
        phoneNumber: event.phoneNumber,
      );
      emit(PassangerSuccess());
    } catch (e) {
      emit(PassangerFailed("Failed to create passenger: ${e.toString()}"));
    }
  }
}
