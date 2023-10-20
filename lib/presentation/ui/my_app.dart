import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masjid_app/presentation/app_router.dart';
import 'package:masjid_app/presentation/blocs/auth/auth_cubit.dart';
import 'package:masjid_app/presentation/blocs/login/login_cubit.dart';
import 'package:masjid_app/presentation/blocs/theme/theme_cubit.dart';

import '../../core/initializer/app_di.dart';

class MasjidAPP extends StatelessWidget {
  const MasjidAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (_) => locator.get<ThemeCubit>(),
          ),
          BlocProvider<AuthCubit>(
            create: (_) =>
                locator.get<AuthCubit>()..checkAuthenticationStatus(),
          ),
          BlocProvider<LoginCubit>(
            create: (_) => locator.get<LoginCubit>(),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeData>(
          builder: (_, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Your App',
              theme: state,
              routerDelegate: appRouter.routerDelegate,
              routeInformationParser: appRouter.routeInformationParser,
            );
          },
        ),
      ),
    );
  }
}
