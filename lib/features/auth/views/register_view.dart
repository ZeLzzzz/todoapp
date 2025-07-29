import 'package:flutter/material.dart';
import 'package:todoapp/shared/widgets/appbar_widget.dart';
import 'package:todoapp/shared/widgets/button_widget.dart';

class EmailValidationView extends StatefulWidget {
  const EmailValidationView({super.key});

  @override
  State<EmailValidationView> createState() => _EmailValidationViewState();
}

class _EmailValidationViewState extends State<EmailValidationView> {
  bool isDisabled = true;
  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(
          title: Text('Register', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Let's do some magic together!", style: TextStyle(fontSize: 15)),
                SizedBox(height: 20),
                Text('Email', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                TextFormField(
                  onChanged: (value) {
                    _formKey.currentState?.validate();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!isValidEmail(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 5),
                Text("You'll need to confirm this email later.",
                    style: TextStyle(fontSize: 12, color: Color(0xFFAAAAAA))),
                SizedBox(height: 20),
                Text('Password', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                TextFormField(
                  onChanged: (value) {
                    _formKey.currentState?.validate();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters and contain numbers';
                    } else if (!value.contains(RegExp(r'[0-9]'))) {
                      return 'Password must contain at least one number';
                    } else if (!value.contains(RegExp(r'[a-zA-Z]'))) {
                      return 'Password must contain at least one letter';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                PrimaryButton(
                  height: 55,
                  fullscreen: true,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: Text('Next'),
                )
              ],
            ),
          ),
        ));
  }
}
