import 'package:get_it/get_it.dart';

import 'datasource_di.dart';
import 'external_di.dart';
import 'provider_di.dart';
import 'repo_di.dart';
import 'usecase_di.dart';

final di = GetIt.instance;

Future<void> initDi() async {
  await providerDi();
  await useCaseDi();
  await repoDi();
  await dataSourceDi();
  await externalDi();
}
