import 'package:e_book/core/utils/constants/sizes.dart';
import 'package:e_book/core/utils/device/device_utils.dart';
import 'package:e_book/features/auth/presentation/onboarding/bloc/onboarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Positioned(
          right: ESizes.defaultSpace,
          bottom: EDeviceUtils.getBottomNavigationBarHeight(),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              BlocProvider.of<OnboardingBloc>(context)
                  .add(NavigateToNextPageEvent(context));
            },
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
