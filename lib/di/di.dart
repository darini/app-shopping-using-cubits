import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping2/di/di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => init(getIt);
