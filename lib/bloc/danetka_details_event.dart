part of 'danetka_details_bloc.dart';

abstract class DanetkaDetailsEvent {}

class DanetkaDetailsLoadedEvent extends DanetkaDetailsEvent {
  DanetkaDetailsLoadedEvent({required this.danetka});

  final Danetka danetka;
}
