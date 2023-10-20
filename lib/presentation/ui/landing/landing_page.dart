import 'package:flutter/material.dart';
import 'package:masjid_app/core/initializer/app_di.dart';
import 'package:masjid_app/presentation/blocs/login/login_cubit.dart';
import 'package:masjid_app/presentation/ui/__shared/extensions/widget_extensions.dart';

import '../../../core/shared/app_strings.dart';
import '../home/home_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: [
          InkWell(
            onTap: () => locator.get<LoginCubit>().reset(),
            child: const Center(child: Text(AppStrings.logout)).paddingH(),
          ),
        ],
      ),
      body: HomeWidget(),
    );
  }
}
