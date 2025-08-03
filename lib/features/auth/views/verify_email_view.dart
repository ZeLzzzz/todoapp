import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/shared/widgets/appbar_widget.dart';
import 'package:todoapp/shared/widgets/button_widget.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 5,
          children: [
            Image.asset(
              'assets/illustrations/logos.png',
              width: 30,
              height: 30,
            ),
            Text(
              'FlowDo',
              style: TextStyle(fontFamily: 'Comic', fontWeight: FontWeight.w200),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/illustrations/VerifyEmailScreen1.png',
              width: 280,
              height: 280,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("We've sent you a new email!",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 19),
                  Text(
                    'Check your inbox to verify and Log in.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 70),
                  PrimaryButton(
                    height: 55,
                    fullscreen: true,
                    onPressed: () {
                      context.go('/login');
                    },
                    child: Text('Go to Log in'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
