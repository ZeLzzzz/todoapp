import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool showBackButton; // Tambahan properti baru

  const AppbarWidget({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle = true,
    this.showBackButton = true,
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
      leading: (showBackButton && canGoBack)
          ? IconButton(
              icon: const Icon(FeatherIcons.arrowLeft),
              onPressed: () => context.pop(),
            )
          : null,
    );
  }
}
