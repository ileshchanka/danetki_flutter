import 'package:danetki_flutter/repository/abstract_repository.dart';
import 'package:danetki_flutter/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractDanetkiRepository>(() => DanetkiRepository());

  runApp(const MyApp());
}
