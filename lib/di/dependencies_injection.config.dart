// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:infrastructure/infrastructure.dart' as _i4;
import 'package:infrastructure/infrastructure.module.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;
import 'package:todo/todo/bloc/todo_form/todo_form_cubit.dart' as _i3;
import 'package:todo/todo/bloc/todo_item/todo_item_cubit.dart' as _i5;
import 'package:todo/todo/bloc/todo_list/todo_list_cubit.dart' as _i6;

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
    gh.factory<_i3.TodoFormCubit>(() => _i3.TodoFormCubit(
        todoRepository: gh<_i4.FirebaseFirestoreTodoRepository>()));
    gh.factory<_i5.TodoItemCubit>(() => _i5.TodoItemCubit(
        translatedTodoRepository: gh<_i4.FirebaseTranslatedTodoRepository>()));
    gh.factory<_i6.TodoListCubit>(() => _i6.TodoListCubit(
        todoRepository: gh<_i4.FirebaseFirestoreTodoRepository>()));
    await _i7.InfrastructurePackageModule().init(gh);
    return this;
  }
}
