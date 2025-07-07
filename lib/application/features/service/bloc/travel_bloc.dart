import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skill_test_mobile_developer/config/dependency_injector/dependency_injector.dart';
import 'package:skill_test_mobile_developer/domain/entity/travel_entity.dart';
import 'package:skill_test_mobile_developer/domain/repository/travel_repository.dart';
import 'package:skill_test_mobile_developer/domain/use-case/travel_use_case.dart';

part 'travel_event.dart';
part 'travel_state.dart';

class TravelBloc extends Bloc<TravelEvent, TravelState> {
  final TravelUseCase travelUseCase = di<TravelUseCase>();

  TravelBloc() : super(TravelInitial()) {
    on<CreateTravel>(_onCreateTravel);
  }

  Future<void> _onCreateTravel(
    CreateTravel event,
    Emitter<TravelState> emit,
  ) async {
    emit(TravelLoading());

    try {
      final travel = TravelEntity(
        name: event.serviceName,
        tanggalKeberangkatan: event.departureDate.toIso8601String(),
        kuota: event.quota,
      );

      await travelUseCase.addTravel(travel);
      emit(TravelSuccess());
    } catch (e) {
      emit(TravelError('Failed to create travel: ${e.toString()}'));
    }
  }
}

