part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

class UpdatePageIndicatorEvent extends OnboardingEvent {
  final int index;
  UpdatePageIndicatorEvent(this.index);
}

class NavigateToPageEvent extends OnboardingEvent {
  final BuildContext context;
  final int index;
  NavigateToPageEvent({required this.index, required this.context});
}

class NavigateToNextPageEvent extends OnboardingEvent {
  final BuildContext context;
  NavigateToNextPageEvent(this.context);
}

class SkipToLastPageEvent extends OnboardingEvent {
  final BuildContext context;
  SkipToLastPageEvent(this.context);
}
