import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/core/di/service_locator.dart';
import 'package:todoapp/features/auth/viewmodels/register_viewmodel.dart';
import 'package:todoapp/shared/widgets/appbar_widget.dart';
import 'package:todoapp/shared/widgets/button_widget.dart';

class EmailValidationView extends StatelessWidget {
  const EmailValidationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<RegisterViewmodel>(),
      child: Scaffold(
        appBar: AppbarWidget(
          title: Text('Register', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Consumer<RegisterViewmodel>(builder: (context, viewModel, child) {
              return Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Let's do some magic together!", style: TextStyle(fontSize: 15)),
                    const SizedBox(height: 20),
                    Text('Username', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: viewModel.usernameController,
                      validator: viewModel.validateUsername,
                    ),
                    const SizedBox(height: 20),
                    Text('Email', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: viewModel.emailController,
                      validator: viewModel.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 5),
                    Text("You'll need to confirm this email later.",
                        style: TextStyle(fontSize: 12, color: Color(0xFFAAAAAA))),
                    const SizedBox(height: 20),
                    Text('Password', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: viewModel.passwordController,
                      obscureText: true,
                      validator: viewModel.validatePassword,
                    ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      height: 55,
                      fullscreen: true,
                      onPressed: () {
                        if (viewModel.formKey.currentState!.validate()) {
                          viewModel.register();
                        }
                      },
                      child: Text('Next'),
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
