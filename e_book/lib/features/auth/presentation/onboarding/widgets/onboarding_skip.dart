import 'package:e_book/core/utils/constants/sizes.dart';
import 'package:e_book/core/utils/device/device_utils.dart';
import 'package:e_book/features/auth/presentation/onboarding/bloc/onboarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: EDeviceUtils.getAppBarHeight(),
      right: ESizes.defaultSpace,
      child: TextButton(
        onPressed: () {
          BlocProvider.of<OnboardingBloc>(context)
              .add(SkipToLastPageEvent(context));
        },
        child: const Text('Skip'),
      ),
    );
  }
}
