part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

class OnboardingPageIndicatorState extends OnboardingState {
  final int index;
  OnboardingPageIndicatorState(this.index);
}
