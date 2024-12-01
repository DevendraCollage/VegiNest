import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:food_app/HomeScreen.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:sign_in_button/sign_in_button.dart";

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future<void> _googleSignUp() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        print("Sign-in aborted by user");
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        print("Signed in successfully: ${user.displayName}");
      } else {
        print("User is null after signing in");
      }
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.message}");
    } catch (e) {
      print("Unexpected error: ${e.toString()}");
    }
  }

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
                        offset: const Offset(4, 4),
                      ),
                      BoxShadow(
                        blurRadius: 45,
                        color: Colors.green.shade900,
                        offset: const Offset(6, 6),
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
                  onPressed: () {
                    _googleSignUp().then((value) => Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(
                            builder: (context) => const HomeScreen())));
                  },
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
