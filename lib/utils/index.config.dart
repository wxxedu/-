// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i5;

import '../logic.dart' as _i7;
import '../openai.dart' as _i6;
import 'index.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injection = _$Injection();
    gh.singleton<_i3.AppRouter>(_i3.AppRouter());
    await gh.factoryAsync<_i4.Box<dynamic>>(
      () => injection.box,
      preResolve: true,
    );
    await gh.factoryAsync<_i5.Isar>(
      () => injection.isar,
      preResolve: true,
    );
    gh.lazySingleton<_i6.OpenAiGenerator>(() => _i6.OpenAiGenerator());
    gh.lazySingleton<_i7.Logic>(() => _i7.Logic(
          gh<_i5.Isar>(),
          gh<_i6.OpenAiGenerator>(),
        ));
    return this;
  }
}

class _$Injection extends _i3.Injection {}
