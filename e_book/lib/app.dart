import 'package:e_book/features/auth/presentation/onboarding/bloc/onboarding_bloc.dart';
// import 'package:e_book/features/auth/presentation/onboarding/pages/onboarding.dart';
import 'package:e_book/features/auth/presentation/splash/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OnboardingBloc(PageController()),
      child: const MaterialApp(
        home: Splash(), // Entry point of your application
      ),
    );
  }
}
