import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/di/service_locator.dart';
import 'package:todoapp/features/auth/viewmodels/login_viewmodel.dart';
import 'package:todoapp/shared/widgets/appbar_widget.dart';
import 'package:todoapp/shared/widgets/button_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<LoginViewmodel>(),
      child: Scaffold(
          appBar: AppbarWidget(
            title: Text('Log in', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Consumer<LoginViewmodel>(
                builder: (context, viewModel, child) {
                  return Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Let's do some magic again!", style: TextStyle(fontSize: 15)),
                        SizedBox(height: 20),
                        Text('Email', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: viewModel.emailController,
                          validator: viewModel.validateEmail,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20),
                        Text('Password',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: viewModel.passwordController,
                          validator: viewModel.validatePassword,
                          obscureText: true,
                        ),
                        SizedBox(height: 20),
                        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                          Text('Forgot Password?',
                              style: TextStyle(fontSize: 14, color: Colors.blue))
                        ]),
                        SizedBox(height: 20),
                        PrimaryButton(
                          height: 55,
                          fullscreen: true,
                          onPressed: () {
                            if (viewModel.formKey.currentState!.validate()) {
                              viewModel.login(context);
                            }
                          },
                          child: Text('Log in'),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )),
    );
  }
}
