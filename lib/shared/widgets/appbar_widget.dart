import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final bool centerTitle;

  const AppbarWidget({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final canGoBack = Navigator.canPop(context);
    return AppBar(
      title: title,
      centerTitle: centerTitle,
      actions: actions,
      leading: canGoBack
          ? IconButton(
              icon: ImageIcon(
                AssetImage('arrow-right.svg'),
              ),
              onPressed: () => context.pop(),
            )
          : null,
    );
  }
}
