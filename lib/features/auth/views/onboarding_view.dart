import 'package:flutter/material.dart';
import 'package:todoapp/shared/widgets/appbar_widget.dart';
import 'package:todoapp/shared/widgets/button_widget.dart';

class OnboardingOneView extends StatelessWidget {
  const OnboardingOneView({super.key});

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
              'assets/illustrations/Onboarding1.png',
              width: 328,
              height: 328,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                spacing: 19,
                children: [
                  Text('Organize Your Tasks Visually',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    'A smart to-do list app with Kanban boards to track your daily, weekly, and project progress.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 70),
            ButtonWidget(
              onPressed: () {
                //
              },
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
