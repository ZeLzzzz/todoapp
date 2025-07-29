import 'package:flutter/material.dart';
import 'package:todoapp/shared/widgets/appbar_widget.dart';
import 'package:todoapp/shared/widgets/button_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(
          title: Text('Log in', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Let's do some magic again!", style: TextStyle(fontSize: 15)),
              SizedBox(height: 20),
              Text('Email', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              SizedBox(height: 10),
              TextField(),
              SizedBox(height: 20),
              Text('Password', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              SizedBox(height: 10),
              TextField(),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text('Forgot Password?', style: TextStyle(fontSize: 14, color: Colors.blue))
              ]),
              SizedBox(height: 20),
              PrimaryButton(
                height: 55,
                fullscreen: true,
                onPressed: () {
                  // Handle login logic here
                },
                child: Text('Log in'),
              )
            ],
          ),
        ));
  }
}
