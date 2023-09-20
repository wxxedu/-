// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i6;
import 'package:fu/components/reflection/index.dart' as _i1;
import 'package:fu/components/reflection_model/index.dart' as _i2;
import 'package:fu/models/index.dart' as _i5;
import 'package:fu/pages/index.dart' as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ReflectionDisplayRoute.name: (routeData) {
      final args = routeData.argsAs<ReflectionDisplayRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ReflectionDisplayScreen(
          args.reflection,
          args.questions,
          key: args.key,
        ),
      );
    },
    ReflectionEditorRoute.name: (routeData) {
      final args = routeData.argsAs<ReflectionEditorRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ReflectionEditorScreen(
          args.reflection,
          args.questions,
          key: args.key,
        ),
      );
    },
    ReflectionModelDisplayRoute.name: (routeData) {
      final args = routeData.argsAs<ReflectionModelDisplayRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ReflectionModelDisplayScreen(
          args.model,
          key: args.key,
        ),
      );
    },
    ReflectionModelEditorRoute.name: (routeData) {
      final args = routeData.argsAs<ReflectionModelEditorRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ReflectionModelEditorScreen(
          args.model,
          key: args.key,
          onSave: args.onSave,
          onDelete: args.onDelete,
          allowAdd: args.allowAdd,
        ),
      );
    },
    ReflectionModelRoute.name: (routeData) {
      final args = routeData.argsAs<ReflectionModelRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ReflectionModelPage(
          args.model,
          key: args.key,
        ),
      );
    },
    ReflectionModelsListRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ReflectionModelsListPage(),
      );
    },
    ReflectionRoute.name: (routeData) {
      final args = routeData.argsAs<ReflectionRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ReflectionPage(
          args.reflection,
          args.questions,
          key: args.key,
        ),
      );
    },
    SetupRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SetupPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ReflectionDisplayScreen]
class ReflectionDisplayRoute
    extends _i4.PageRouteInfo<ReflectionDisplayRouteArgs> {
  ReflectionDisplayRoute({
    required _i5.Reflection reflection,
    required List<String> questions,
    _i6.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ReflectionDisplayRoute.name,
          args: ReflectionDisplayRouteArgs(
            reflection: reflection,
            questions: questions,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ReflectionDisplayRoute';

  static const _i4.PageInfo<ReflectionDisplayRouteArgs> page =
      _i4.PageInfo<ReflectionDisplayRouteArgs>(name);
}

class ReflectionDisplayRouteArgs {
  const ReflectionDisplayRouteArgs({
    required this.reflection,
    required this.questions,
    this.key,
  });

  final _i5.Reflection reflection;

  final List<String> questions;

  final _i6.Key? key;

  @override
  String toString() {
    return 'ReflectionDisplayRouteArgs{reflection: $reflection, questions: $questions, key: $key}';
  }
}

/// generated route for
/// [_i1.ReflectionEditorScreen]
class ReflectionEditorRoute
    extends _i4.PageRouteInfo<ReflectionEditorRouteArgs> {
  ReflectionEditorRoute({
    required _i5.Reflection reflection,
    required List<String> questions,
    _i6.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ReflectionEditorRoute.name,
          args: ReflectionEditorRouteArgs(
            reflection: reflection,
            questions: questions,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ReflectionEditorRoute';

  static const _i4.PageInfo<ReflectionEditorRouteArgs> page =
      _i4.PageInfo<ReflectionEditorRouteArgs>(name);
}

class ReflectionEditorRouteArgs {
  const ReflectionEditorRouteArgs({
    required this.reflection,
    required this.questions,
    this.key,
  });

  final _i5.Reflection reflection;

  final List<String> questions;

  final _i6.Key? key;

  @override
  String toString() {
    return 'ReflectionEditorRouteArgs{reflection: $reflection, questions: $questions, key: $key}';
  }
}

/// generated route for
/// [_i2.ReflectionModelDisplayScreen]
class ReflectionModelDisplayRoute
    extends _i4.PageRouteInfo<ReflectionModelDisplayRouteArgs> {
  ReflectionModelDisplayRoute({
    required _i5.ReflectionModel model,
    _i6.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ReflectionModelDisplayRoute.name,
          args: ReflectionModelDisplayRouteArgs(
            model: model,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ReflectionModelDisplayRoute';

  static const _i4.PageInfo<ReflectionModelDisplayRouteArgs> page =
      _i4.PageInfo<ReflectionModelDisplayRouteArgs>(name);
}

class ReflectionModelDisplayRouteArgs {
  const ReflectionModelDisplayRouteArgs({
    required this.model,
    this.key,
  });

  final _i5.ReflectionModel model;

  final _i6.Key? key;

  @override
  String toString() {
    return 'ReflectionModelDisplayRouteArgs{model: $model, key: $key}';
  }
}

/// generated route for
/// [_i2.ReflectionModelEditorScreen]
class ReflectionModelEditorRoute
    extends _i4.PageRouteInfo<ReflectionModelEditorRouteArgs> {
  ReflectionModelEditorRoute({
    required _i5.ReflectionModel model,
    _i6.Key? key,
    _i7.FutureOr<void> Function(_i5.ReflectionModel)? onSave,
    _i7.FutureOr<void> Function(_i5.ReflectionModel)? onDelete,
    bool allowAdd = false,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ReflectionModelEditorRoute.name,
          args: ReflectionModelEditorRouteArgs(
            model: model,
            key: key,
            onSave: onSave,
            onDelete: onDelete,
            allowAdd: allowAdd,
          ),
          initialChildren: children,
        );

  static const String name = 'ReflectionModelEditorRoute';

  static const _i4.PageInfo<ReflectionModelEditorRouteArgs> page =
      _i4.PageInfo<ReflectionModelEditorRouteArgs>(name);
}

class ReflectionModelEditorRouteArgs {
  const ReflectionModelEditorRouteArgs({
    required this.model,
    this.key,
    this.onSave,
    this.onDelete,
    this.allowAdd = false,
  });

  final _i5.ReflectionModel model;

  final _i6.Key? key;

  final _i7.FutureOr<void> Function(_i5.ReflectionModel)? onSave;

  final _i7.FutureOr<void> Function(_i5.ReflectionModel)? onDelete;

  final bool allowAdd;

  @override
  String toString() {
    return 'ReflectionModelEditorRouteArgs{model: $model, key: $key, onSave: $onSave, onDelete: $onDelete, allowAdd: $allowAdd}';
  }
}

/// generated route for
/// [_i3.ReflectionModelPage]
class ReflectionModelRoute extends _i4.PageRouteInfo<ReflectionModelRouteArgs> {
  ReflectionModelRoute({
    required _i5.ReflectionModel model,
    _i6.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ReflectionModelRoute.name,
          args: ReflectionModelRouteArgs(
            model: model,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ReflectionModelRoute';

  static const _i4.PageInfo<ReflectionModelRouteArgs> page =
      _i4.PageInfo<ReflectionModelRouteArgs>(name);
}

class ReflectionModelRouteArgs {
  const ReflectionModelRouteArgs({
    required this.model,
    this.key,
  });

  final _i5.ReflectionModel model;

  final _i6.Key? key;

  @override
  String toString() {
    return 'ReflectionModelRouteArgs{model: $model, key: $key}';
  }
}

/// generated route for
/// [_i3.ReflectionModelsListPage]
class ReflectionModelsListRoute extends _i4.PageRouteInfo<void> {
  const ReflectionModelsListRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ReflectionModelsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReflectionModelsListRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ReflectionPage]
class ReflectionRoute extends _i4.PageRouteInfo<ReflectionRouteArgs> {
  ReflectionRoute({
    required _i5.Reflection reflection,
    required List<String> questions,
    _i6.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ReflectionRoute.name,
          args: ReflectionRouteArgs(
            reflection: reflection,
            questions: questions,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ReflectionRoute';

  static const _i4.PageInfo<ReflectionRouteArgs> page =
      _i4.PageInfo<ReflectionRouteArgs>(name);
}

class ReflectionRouteArgs {
  const ReflectionRouteArgs({
    required this.reflection,
    required this.questions,
    this.key,
  });

  final _i5.Reflection reflection;

  final List<String> questions;

  final _i6.Key? key;

  @override
  String toString() {
    return 'ReflectionRouteArgs{reflection: $reflection, questions: $questions, key: $key}';
  }
}

/// generated route for
/// [_i3.SetupPage]
class SetupRoute extends _i4.PageRouteInfo<void> {
  const SetupRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SetupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetupRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
