import 'package:get_it/get_it.dart';
import 'package:infrastructure/infrastructure.module.dart';
import 'package:injectable/injectable.dart';
import 'package:todo/di/dependencies_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(externalPackageModulesAfter: [ExternalModule(InfrastructurePackageModule)])
void configureInjection() => getIt.init();
