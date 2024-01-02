import 'package:danetki_flutter/models/danetka.dart';
import 'package:danetki_flutter/repository/abstract_repository.dart';
import 'package:danetki_flutter/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

import 'app.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DanetkaAdapter());
  final box = await Hive.openBox<Danetka>('danetkiBox');

  GetIt.I.registerLazySingleton<AbstractDanetkiRepository>(() => DanetkiRepository(box: box));

  runApp(const MyApp());
}
