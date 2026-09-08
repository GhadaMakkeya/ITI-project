import 'package:flutter/material.dart';
import 'package:iti_grad_project/core/constants/app_assets.dart';
import 'package:iti_grad_project/core/constants/app_styles.dart';
import 'package:iti_grad_project/core/widgets/custom_text_field.dart';
import 'package:iti_grad_project/core/widgets/primary_button.dart';
import 'package:iti_grad_project/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:iti_grad_project/features/auth/presentation/widgets/bottom_auth_row.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _authRemoteDataSource = AuthRemoteDataSource();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await _authRemoteDataSource.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Signed in successfully")));
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => const HomeScreen()),
        // );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In", style: AppStyles.black16roboto400)),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(AppAssets.offer),
              SizedBox(height: 62),
              CustomTextField(
                hintText: "Enter your email",
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your email";
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim())) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 25),
              CustomTextField(
                hintText: "Enter your password",
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              SizedBox(height: 70),
              _isLoading
                  ? CircularProgressIndicator()
                  : PrimaryButton(text: "Sign In", onPressed: _signIn),
              SizedBox(height: 14),
              BottomAuthRow(question: "Don't have an account", action: "Sign Up"),
            ],
          ),
        ),
      ),
    );
  }
}