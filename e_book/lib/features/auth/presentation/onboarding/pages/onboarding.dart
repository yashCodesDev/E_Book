import 'package:e_book/core/utils/constants/image_string.dart';
import 'package:e_book/core/utils/constants/text_string.dart';
import 'package:e_book/features/auth/presentation/onboarding/bloc/onboarding_bloc.dart';
import 'package:e_book/features/auth/presentation/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:e_book/features/auth/presentation/onboarding/widgets/onboarding_next_button.dart';
import 'package:e_book/features/auth/presentation/onboarding/widgets/onboarding_page.dart';
import 'package:e_book/features/auth/presentation/onboarding/widgets/onboarding_skip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);
    return BlocProvider(
      create: (context) => OnboardingBloc(pageController),
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          final isLastPage =
              state is OnboardingPageIndicatorState && state.index == 2;
          final buttonText = isLastPage ? 'Login' : 'Next';

          return Scaffold(
            body: Stack(
              children: [
                // Horizontal Scrollable Pages
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    context
                        .read<OnboardingBloc>()
                        .add(UpdatePageIndicatorEvent(index));
                  },
                  children: const [
                    OnboardingPage(
                      image: EImage.screen1,
                      title: ETexts.onBoardingTitle1,
                      subTitle: ETexts.onBoardingSubTitle1,
                    ),
                    OnboardingPage(
                      image: EImage.screen2,
                      title: ETexts.onBoardingTitle2,
                      subTitle: ETexts.onBoardingSubTitle2,
                    ),
                    OnboardingPage(
                      image: EImage.screen3,
                      title: ETexts.onBoardingTitle3,
                      subTitle: ETexts.onBoardingSubTitle3,
                    ),
                  ],
                ),
                const OnboardingSkip(),
                const Align(
                    alignment: Alignment.bottomLeft,
                    child: OnboardingDotNavigation()),
                Align(
                    alignment: Alignment.bottomRight,
                    child: OnBoardingNextButton(text: buttonText))
              ],
            ),
          );
        },
      ),
    );
  }
}
