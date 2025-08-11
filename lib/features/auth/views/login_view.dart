import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/di/service_locator.dart';
import 'package:todoapp/features/auth/viewmodels/auth_viewmodel.dart';
import 'package:todoapp/shared/widgets/appbar_widget.dart';
import 'package:todoapp/shared/widgets/button_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = sl<AuthViewModel>();

    return ChangeNotifierProvider.value(
      value: authViewModel,
      child: Scaffold(
        appBar: AppbarWidget(
          title: const Text('Log in', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Consumer<AuthViewModel>(
              builder: (context, viewModel, child) {
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Let's do some magic again!", style: TextStyle(fontSize: 15)),
                      const SizedBox(height: 20),
                      const Text('Email',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _emailController,
                        validator: _validateEmail,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      const Text('Password',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _passwordController,
                        validator: _validatePassword,
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text('Forgot Password?',
                              style: TextStyle(fontSize: 14, color: Colors.blue)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                          height: 55,
                          fullscreen: true,
                          onPressed: viewModel.isLoading
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    authViewModel.login(
                                        context, _emailController.text, _passwordController.text);
                                  }
                                },
                          child: viewModel.isLoading
                              ? const SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeCap: StrokeCap.round,
                                  ),
                                )
                              : const Text('Log in')),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
