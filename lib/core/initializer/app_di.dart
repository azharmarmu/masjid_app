import 'package:get_it/get_it.dart';

import '../../data/config.dart';
import '../../domain/config.dart';
import '../../presentation/config.dart';



final locator = GetIt.I;

void init() {
  apiConfig(locator);
  dsConfig(locator);
  repoConfig(locator);
  usecaseConfig(locator);
  blocConfig(locator);
}
