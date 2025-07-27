import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';
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
              width: 280,
              height: 280,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
            PrimaryButton(
              height: 60,
              width: 110,
              onPressed: () {
                context.push('/onboarding-two');
              },
              borderRadius: 20,
              icon: Icon(
                FeatherIcons.arrowRight,
                size: 20,
                color: Colors.white,
              ),
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingTwoView extends StatelessWidget {
  const OnboardingTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        showBackButton: false,
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
              'assets/illustrations/Onboarding2.png',
              width: 280,
              height: 280,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                spacing: 19,
                children: [
                  Text('Collaborate and Meet Your Deadlines',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                    'Share boards with your team, set due dates, and get timely reminders.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 70),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeutralButton(
                  height: 60,
                  onPressed: () {
                    context.pop('/');
                  },
                  icon: Icon(
                    FeatherIcons.arrowLeft,
                    size: 20,
                    color: Colors.white,
                  ),
                  iconAlignment: IconAlignment.start,
                  borderRadius: 20,
                  child: Text('Back'),
                ),
                PrimaryButton(
                  height: 60,
                  onPressed: () {
                    //
                  },
                  borderRadius: 20,
                  icon: Icon(
                    FeatherIcons.arrowRight,
                    size: 20,
                    color: Colors.white,
                  ),
                  child: Text('Get Started'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
