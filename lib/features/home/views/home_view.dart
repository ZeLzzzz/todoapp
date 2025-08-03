import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    Image.asset(
                      'assets/illustrations/logos.png',
                      width: 40,
                      height: 40,
                    ),
                    Text(
                      'FlowDo',
                      style:
                          TextStyle(fontSize: 20, fontFamily: 'Comic', fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(FeatherIcons.search, size: 25)),
              ],
            ),
            SizedBox(height: 32),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello,', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
                    Text('Hazel Avriel',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
                  ],
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/illustrations/profile1.png'),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                BoardCard(
                  icon: FeatherIcons.user,
                  count: 19,
                  label: 'Personal board',
                  backgroundColor: const Color(0xFF0075DC),
                  onTap: () {
                    //
                  },
                ),
                const SizedBox(width: 12),
                BoardCard(
                  icon: FeatherIcons.users,
                  count: 3,
                  label: 'Team board',
                  backgroundColor: const Color(0xFF00C896),
                  onTap: () {
                    //
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pinned Boards',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to all boards
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0xFF0075DC),
                  ),
                  child: Text(
                    'See all',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            TaskCard(
              boardType: 'Personal',
              boardIcon: FeatherIcons.user,
              title: 'My Personal Tasks',
              subtitle: '5 tasks pending',
              circleColor: Color(0xFF0075DC),
              onTap: () {
                // Navigate to personal tasks
              },
            )
          ],
        ),
      )),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String boardType;
  final IconData boardIcon;
  final String title;
  final String subtitle;
  final Color circleColor;
  final VoidCallback onTap;

  const TaskCard({
    super.key,
    required this.boardType,
    required this.boardIcon,
    required this.title,
    required this.subtitle,
    required this.circleColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDarkMode ? Color(0xFF252525) : Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  boardIcon,
                  size: 15,
                  color: Color(0xFFAAAAAA),
                ),
                const SizedBox(width: 4),
                Text(
                  boardType,
                  style: const TextStyle(
                      color: Color(0xFFAAAAAA), fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                // Circle outline
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: circleColor,
                      width: 4,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Texts
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title & subtitle
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BoardCard extends StatelessWidget {
  final IconData icon;
  final int count;
  final String label;
  final Color backgroundColor;
  final VoidCallback onTap;

  const BoardCard({
    super.key,
    required this.icon,
    required this.count,
    required this.label,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(height: 5),
              Text(
                '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
