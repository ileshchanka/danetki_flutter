part of 'danetki_bloc.dart';

abstract class DanetkiState {}

class DanetkiInitial extends DanetkiState {}

class DanetkiLoading extends DanetkiState {}

class DanetkiLoaded extends DanetkiState {
  DanetkiLoaded({required this.list});

  final List<Danetka> list;
}

class DanetkiLoadingFailed extends DanetkiState {
  DanetkiLoadingFailed({required this.message});

  final String message;
}
