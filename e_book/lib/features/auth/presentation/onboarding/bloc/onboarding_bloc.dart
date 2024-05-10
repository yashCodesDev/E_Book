import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final PageController pageController;
  OnboardingBloc(this.pageController) : super(OnboardingPageIndicatorState(0)) {
    on<UpdatePageIndicatorEvent>(_updatePageIndicator);
    on<NavigateToNextPageEvent>(_navigateToNextPage);
    on<SkipToLastPageEvent>(_skipToLastPage);
  }

  void _updatePageIndicator(
      UpdatePageIndicatorEvent event, Emitter<OnboardingState> emit) {
    emit(OnboardingPageIndicatorState(event.index));
  }

  void _navigateToNextPage(
      NavigateToNextPageEvent event, Emitter<OnboardingState> emit) {
    final currentPage = (state as OnboardingPageIndicatorState).index;
    final nextPage = currentPage + 1;
    if (nextPage < 3) {
      pageController.animateToPage(
        nextPage,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
      );
    } else {
      emit(OnboardingPageIndicatorState(nextPage));
    }
  }

  void _skipToLastPage(
      SkipToLastPageEvent event, Emitter<OnboardingState> emit) {
    emit(OnboardingPageIndicatorState(2));
    pageController.animateToPage(2,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);

    // Navigator.of(event.context).pushReplacement(
    //   MaterialPageRoute(builder: (_) => const LoginScreen()),
    // );
  }
}
