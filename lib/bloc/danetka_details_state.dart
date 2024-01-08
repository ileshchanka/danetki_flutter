part of 'danetka_details_bloc.dart';

abstract class DanetkaDetailsState {}

class DanetkaDetailsInitial extends DanetkaDetailsState {}

class DanetkaDetailsLoaded extends DanetkaDetailsState {
  DanetkaDetailsLoaded({required this.danetka});

  final Danetka danetka;
}
