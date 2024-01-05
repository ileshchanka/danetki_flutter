import 'dart:async';

import 'package:danetki_flutter/models/danetka.dart';
import 'package:danetki_flutter/repository/abstract_repository.dart';
import 'package:danetki_flutter/repository/repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'app.dart';

Future<void> main() async {
  // Hive
  await Hive.initFlutter();
  Hive.registerAdapter(DanetkaAdapter());
  final box = await Hive.openBox<Danetka>('danetkiBox');

  // Dio
  final dio = Dio();

  // Talker
  final talker = TalkerFlutter.init();
  dio.interceptors.add(TalkerDioLogger(
      talker: talker, settings: const TalkerDioLoggerSettings(printResponseData: false)));
  Bloc.observer = TalkerBlocObserver(talker: talker);

  // GetIt registers
  GetIt.I.registerSingleton(talker);
  GetIt.I.registerLazySingleton<AbstractDanetkiRepository>(
      () => DanetkiRepository(dio: dio, box: box));

  FlutterError.onError = (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  runZonedGuarded(() => runApp(const MyApp()), (error, stack) {
    GetIt.I<Talker>().handle(error, stack);
  });
}
