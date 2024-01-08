import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/danetka.dart';

part 'danetka_details_event.dart';

part 'danetka_details_state.dart';

class DanetkaDetailsBloc extends Bloc<DanetkaDetailsEvent, DanetkaDetailsState> {
  DanetkaDetailsBloc() : super(DanetkaDetailsInitial()) {
    on<DanetkaDetailsLoadedEvent>((event, emit) {
      emit(DanetkaDetailsLoaded(danetka: event.danetka));
    });
  }
}
