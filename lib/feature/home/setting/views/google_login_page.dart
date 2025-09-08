import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:testtree/cubit/user_cubit.dart';
import 'package:testtree/model/user.dart';
import 'package:testtree/router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testtree/widget/social_button.dart';
import 'package:testtree/widget/textfield_login.dart';

class GoogleLoginPage extends StatefulWidget {
  const GoogleLoginPage({super.key});

  @override
  State<GoogleLoginPage> createState() => _GoogleLoginPageState();
}

class _GoogleLoginPageState extends State<GoogleLoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Logger logger = Logger();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              /// Logo
              Center(
                child: Image.asset(
                  'assets/background.png', // thay bằng đường dẫn logo trong assets của bạn
                  height: 200,
                ),
              ),

              const SizedBox(height: 30),

              /// Title
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login to your Account",
                  style: GoogleFonts.cairo(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Email field
              CustomTextField(
                hint: "Email",
                controller: _emailController,
                obscure: false,
              ),

              const SizedBox(height: 16),

              /// Password field
              CustomTextField(
                hint: "Password",
                obscure: true,
                controller: _passwordController,
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    final email = _emailController.text.trim();
                    final password = _passwordController.text.trim();
                    logger.i("Email: $email, Password: $password");
                  },
                  child: Text(
                    "Sign in",
                    style: GoogleFonts.cairo(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// Divider
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Or sign in with",
                      style: GoogleFonts.cairo(
                        color: const Color.fromARGB(255, 58, 143, 61),
                      ),
                    ),
                  ),
                  const Expanded(child: Divider(thickness: 1)),
                ],
              ),

              const SizedBox(height: 24),

              /// Social login buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final GoogleSignIn googleSignIn = GoogleSignIn();
                      try {
                        final GoogleSignInAccount? user = await googleSignIn
                            .signIn();
                        if (user != null) {
                          final userusing = User(userName: user.displayName ?? " ", imageUrl: user.photoUrl ?? " ");
                          context.read<UserCubit>().addUser(userusing);
                          if (mounted) {
                            context.push(AppRouteConstant.myHomePage);
                          }
                        }
                      } catch (e) {
                        logger.e(e);
                      }
                    },
                    child: SocialButton(
                      icon: FontAwesomeIcons.google,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 20),
                  SocialButton(
                    icon: FontAwesomeIcons.facebook,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 20),
                  SocialButton(
                    icon: FontAwesomeIcons.twitter,
                    color: Colors.lightBlue,
                  ),
                ],
              ),

              const Spacer(),

              /// Sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account? ",
                    style: GoogleFonts.cairo(
                      color: const Color.fromARGB(255, 59, 141, 62),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Sign up",
                      style: GoogleFonts.cairo(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  /// Custom text field with controller
}
