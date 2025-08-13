import 'package:flutter/material.dart';

import '../widgets/CustomButton.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/player-img.png',
                width: 150,
                height: 150,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.sports_cricket, size: 80, color: Colors.white);
                },
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 230,
                height: 50,
                child: CustomButton(
                  label: "Continue with Google",
                  color: Colors.white,
                  textColor: Colors.white,
                  onPressed: () =>  Navigator.pushNamed(context, '/home'),
                  type: ButtonType.outlined,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 230,
                height: 50,
                  child: CustomButton(
                    label: "Continue as Guest",
                    textColor: Colors.white,
                    color: Colors.white,
                    onPressed: () =>  Navigator.pushNamed(context, '/home'),
                    type: ButtonType.outlined,
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}