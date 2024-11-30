import "package:flutter/material.dart";
import "package:sign_in_button/sign_in_button.dart";

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Title Section
            const Spacer(),
            Column(
              children: [
                const Text(
                  "Sign in to continue",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 45),
                Text(
                  "VegiNest",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      BoxShadow(
                        blurRadius: 30,
                        color: Colors.black.withOpacity(0.8),
                        offset: Offset(4, 4),
                      ),
                      BoxShadow(
                        blurRadius: 45,
                        color: Colors.green.shade900,
                        offset: Offset(6, 6),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

            // Sign-In Buttons Section
            Column(
              children: [
                SignInButton(
                  Buttons.google,
                  text: "Sign in with Google",
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                SignInButton(
                  Buttons.apple,
                  text: "Sign in with Apple",
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
              ],
            ),
            const SizedBox(height: 50),

            // Terms and Privacy Policy Section
            Column(
              children: [
                Text(
                  "By signing in you are agreeing to our",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Terms and Privacy Policy",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
