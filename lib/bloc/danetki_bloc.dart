import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/danetka.dart';
import '../repository/abstract_repository.dart';

part 'danetki_event.dart';

part 'danetki_state.dart';

class DanetkiBloc extends Bloc<DanetkiEvent, DanetkiState> {
  final AbstractDanetkiRepository _repository;

  DanetkiBloc(this._repository) : super(DanetkiInitial()) {
    on<LoadDanetkiEvent>((event, emit) async {
      emit(DanetkiLoading());
      final danetkiList = await _repository.getList();
      if (danetkiList.isNotEmpty) {
        emit(DanetkiLoaded(list: danetkiList));
      } else {
        emit(DanetkiLoadingFailed(message: "Something went wrong"));
      }
    });
  }
}
