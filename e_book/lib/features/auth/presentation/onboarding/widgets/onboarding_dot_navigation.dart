import 'package:e_book/features/auth/presentation/onboarding/bloc/onboarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_book/core/utils/constants/sizes.dart';
import 'package:e_book/core/utils/device/device_utils.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<OnboardingBloc>(context);

    return Positioned(
      bottom: EDeviceUtils.getBottomNavigationBarHeight(),
      left: ESizes.defaultSpace,
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          int currentPageIndex = 0;
          if (state is OnboardingPageIndicatorState) {
            currentPageIndex = state.index;
          }
          return SmoothPageIndicator(
            controller: PageController(initialPage: currentPageIndex),
            count: 3,
            effect: const ExpandingDotsEffect(
              activeDotColor: Colors.black,
              dotHeight: 6,
            ),
            onDotClicked: (index) {
              bloc.add(UpdatePageIndicatorEvent(index));
            },
          );
        },
      ),
    );
  }
}
