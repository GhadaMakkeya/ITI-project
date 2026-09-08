import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_grad_project/core/widgets/custom_text_field.dart';
import 'package:iti_grad_project/core/widgets/primary_button.dart';
import 'package:iti_grad_project/features/auth/data/cubit/auth_cubit.dart';
import 'package:iti_grad_project/features/auth/data/cubit/auth_state.dart';
import 'package:iti_grad_project/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:iti_grad_project/features/auth/presentation/pages/sign_in_page.dart';
import 'package:iti_grad_project/features/auth/presentation/widgets/bottom_auth_row.dart';
import 'package:iti_grad_project/features/auth/presentation/widgets/offer_card.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRemoteDataSource()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Builder(
            builder: (blocContext) {
              return BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Account created successfully"),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInPage(),
                      ),
                    );
                  } else if (state is AuthFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 30),
                          const OfferCard(),
                          const SizedBox(height: 40),
                          CustomTextField(
                            hintText: "Enter your email",
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Please enter your email";
                              }
                              if (!RegExp(
                                r'^[^@]+@[^@]+\.[^@]+',
                              ).hasMatch(value.trim())) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
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
                          const SizedBox(height: 20),
                          CustomTextField(
                            hintText: "Confirm your password",
                            controller: _confirmPasswordController,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please confirm your password";
                              }
                              if (value != _passwordController.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 40),
                          SizedBox(
                            height: 55,
                            child: state is AuthLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : PrimaryButton(
                                    text: "Sign Up",
                                    onPressed: () {
                                      print("Sign Up button pressed");
                                      if (_formKey.currentState!.validate()) {
                                        print("Validation passed");
                                        BlocProvider.of<AuthCubit>(
                                          blocContext,
                                        ).signUp(
                                          email: _emailController.text.trim(),
                                          password: _passwordController.text
                                              .trim(),
                                        );
                                      } else {
                                        print("Validation failed");
                                      }
                                    },
                                  ),
                          ),
                          const SizedBox(height: 20),
                          const BottomAuthRow(
                            question: "Already have an account?",
                            action: "Sign In",
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
