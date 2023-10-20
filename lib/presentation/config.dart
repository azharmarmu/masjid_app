import 'package:get_it/get_it.dart';
import 'package:masjid_app/presentation/blocs/login/login_cubit.dart';
import 'package:masjid_app/presentation/blocs/prayer_time/prayer_time_cubit.dart';

import 'blocs/auth/auth_cubit.dart';
import 'blocs/theme/theme_cubit.dart';

blocConfig(GetIt locator) {
  locator.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(),
  );
  locator.registerLazySingleton<AuthCubit>(
    () => AuthCubit(locator()),
  );
  locator.registerLazySingleton<LoginCubit>(
    () => LoginCubit(locator()),
  );
  locator.registerLazySingleton<PrayerTimeCubit>(
    () => PrayerTimeCubit(locator()),
  );
}
