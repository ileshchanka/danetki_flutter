import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../bloc/danetka_details_bloc.dart';
import '../models/danetka.dart';
import '../repository/abstract_repository.dart';
import '../repository/repository.dart';

final getIt = GetIt.instance;

void configureDependencies({required Talker talker, required Dio dio, required Box<Danetka> box}) {
  GetIt.I.registerSingleton(talker);
  GetIt.I.registerLazySingleton<AbstractDanetkiRepository>(
      () => DanetkiRepository(dio: dio, box: box));

  GetIt.I.registerSingleton(DanetkaDetailsBloc());
}
