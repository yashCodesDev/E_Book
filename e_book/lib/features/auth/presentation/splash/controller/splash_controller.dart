import 'package:e_book/features/auth/presentation/onboarding/pages/onboarding.dart';
import 'package:flutter/material.dart';

class SplashController {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> navigateToNextPage(BuildContext context) async {
    // bool isLoggedIn = _auth.currentUser != null;
    await Future.delayed(
        const Duration(seconds: 5)); // Simulating splash screen delay
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const OnBoardingScreen(),
      ),
    );
  }
}

// isLoggedIn ? HomePage() : WelcomePage()