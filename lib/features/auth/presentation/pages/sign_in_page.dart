import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_grad_project/core/constants/app_colors.dart';
import 'package:iti_grad_project/core/widgets/custom_text_field.dart';
import 'package:iti_grad_project/core/widgets/primary_button.dart';
import 'package:iti_grad_project/features/auth/data/cubit/auth_cubit.dart';
import 'package:iti_grad_project/features/auth/data/cubit/auth_state.dart';
import 'package:iti_grad_project/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:iti_grad_project/features/auth/presentation/widgets/bottom_auth_row.dart';
import 'package:iti_grad_project/features/auth/presentation/widgets/offer_card.dart';
import 'package:iti_grad_project/features/search/custom_bottom_nav_bar.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRemoteDataSource()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomBottomNavigationBar(),
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
              final cubit = context.read<AuthCubit>();

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
                      const SizedBox(height: 55),
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
                      const SizedBox(height: 25),
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
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: Checkbox(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  side: const BorderSide(
                                    color: Colors.grey,
                                    width: 1.5,
                                  ),
                                  value: false,
                                  onChanged: (bool? value) {},
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "Remember Me",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 60),
                      SizedBox(
                        height: 55,
                        child: state is AuthLoading
                            ? const Center(child: CircularProgressIndicator())
                            : PrimaryButton(
                                text: "Sign In",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<AuthCubit>(context).signIn(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text,
                                    );
                                  }
                                },
                              ),
                      ),
                      const SizedBox(height: 20),
                      const BottomAuthRow(
                        question: "Don't have an account?",
                        action: "Sign Up",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
