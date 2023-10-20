import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masjid_app/core/initializer/app_di.dart';
import 'package:masjid_app/core/shared/app_strings.dart';
import 'package:masjid_app/presentation/blocs/login/login_cubit.dart';
import 'package:masjid_app/presentation/ui/__shared/extensions/widget_extensions.dart';
import 'package:masjid_app/presentation/ui/__shared/widgets/app_button.dart';

import '../__shared/widgets/app_textfield.dart';
import '../__shared/widgets/utils.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextField(
            controller: _emailController,
            label: AppStrings.email,
          ).gapBottom(8.h),
          AppTextField(
            controller: _passwordController,
            label: AppStrings.password,
            obscureText: true,
            suffixIcon: IconButton(
              onPressed: () {
                
              },
              icon: const Icon(Icons.private_connectivity),
            ),
          ).gapBottom(16.h),
          BlocConsumer<LoginCubit, LoginStatus>(
            listener: (_, state) {
              if (state == LoginStatus.initial) {
                _emailController.text = '';
                _passwordController.text = '';
              }
              if (state == LoginStatus.failure) {
                snackBar(context, 'Login Error');
              }
            },
            builder: (_, state) {
              bool isLoading = false;
              if (state == LoginStatus.loading) {
                isLoading = true;
              }

              return AppButton(
                isLoading: isLoading,
                label: AppStrings.login,
                onTap: () =>
                    locator.get<LoginCubit>().loginWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
              );
            },
          )
        ],
      ).paddingS(),
    );
  }
}