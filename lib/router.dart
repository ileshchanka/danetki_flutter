import 'package:auto_route/auto_route.dart';
import 'package:danetki_flutter/screens/danetka_screen.dart';
import 'package:danetki_flutter/screens/list_screen.dart';
import 'package:flutter/cupertino.dart';

import 'models/danetka.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ListRoute.page, path: '/'),
        AutoRoute(page: DanetkaRoute.page),
      ];
}
