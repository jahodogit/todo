//@GeneratedMicroModule;InfrastructurePackageModule;package:infrastructure/infrastructure.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:cloud_firestore/cloud_firestore.dart' as _i3;
import 'package:domain/domain.dart' as _i5;
import 'package:infrastructure/infrastructure.dart' as _i4;
import 'package:infrastructure/module.dart' as _i8;
import 'package:infrastructure/src/todo/repositories/firebase_todo_repository.dart'
    as _i6;
import 'package:infrastructure/src/todo/repositories/firebase_translated_todo.dart'
    as _i7;
import 'package:injectable/injectable.dart' as _i1;

class InfrastructurePackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    final infrastructureModule = _$InfrastructureModule();
    gh.lazySingleton<_i3.FirebaseFirestore>(() => infrastructureModule.db);
    gh.factory<_i4.FirebaseFirestoreTodoRepository>(() => infrastructureModule
        .firebaseTodoRepository(gh<_i3.FirebaseFirestore>()));
    gh.factory<_i4.FirebaseTranslatedTodoRepository>(() => infrastructureModule
        .firebaseTranslatedTodoRepository(gh<_i3.FirebaseFirestore>()));
    gh.factory<_i5.TodoRepository>(() =>
        _i6.FirebaseFirestoreTodoRepository(db: gh<_i3.FirebaseFirestore>()));
    gh.factory<_i5.TranslatedTodoRepository>(() =>
        _i7.FirebaseTranslatedTodoRepository(db: gh<_i3.FirebaseFirestore>()));
  }
}

class _$InfrastructureModule extends _i8.InfrastructureModule {}
