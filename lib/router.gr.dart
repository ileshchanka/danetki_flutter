// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DanetkaRoute.name: (routeData) {
      final args = routeData.argsAs<DanetkaRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DanetkaScreen(
          key: args.key,
          danetka: args.danetka,
        ),
      );
    },
    ListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ListScreen(),
      );
    },
  };
}

/// generated route for
/// [DanetkaScreen]
class DanetkaRoute extends PageRouteInfo<DanetkaRouteArgs> {
  DanetkaRoute({
    Key? key,
    required Danetka danetka,
    List<PageRouteInfo>? children,
  }) : super(
          DanetkaRoute.name,
          args: DanetkaRouteArgs(
            key: key,
            danetka: danetka,
          ),
          initialChildren: children,
        );

  static const String name = 'DanetkaRoute';

  static const PageInfo<DanetkaRouteArgs> page =
      PageInfo<DanetkaRouteArgs>(name);
}

class DanetkaRouteArgs {
  const DanetkaRouteArgs({
    this.key,
    required this.danetka,
  });

  final Key? key;

  final Danetka danetka;

  @override
  String toString() {
    return 'DanetkaRouteArgs{key: $key, danetka: $danetka}';
  }
}

/// generated route for
/// [ListScreen]
class ListRoute extends PageRouteInfo<void> {
  const ListRoute({List<PageRouteInfo>? children})
      : super(
          ListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
