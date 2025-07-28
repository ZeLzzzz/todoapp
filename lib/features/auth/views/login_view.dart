import 'package:flutter/material.dart';
import 'package:todoapp/shared/widgets/appbar_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Text('Log in'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('test'),
      ),
    );
  }
}
