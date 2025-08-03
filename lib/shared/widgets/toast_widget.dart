import 'package:flutter/material.dart';

class ToastWidget {
  static void showToast(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.black87,
    Duration duration = const Duration(seconds: 2),
    DismissDirection dismissDirection = DismissDirection.horizontal,
    double topOffset = 50,
    double horizontalMargin = 10,
  }) {
    final overlay = Overlay.of(context);

    late OverlayEntry entry;
    entry = OverlayEntry(builder: (_) {
      return _ToastWidget(
        entry: entry,
        message: message,
        backgroundColor: backgroundColor,
        duration: duration,
        dismissDirection: dismissDirection,
        topOffset: topOffset,
        horizontalMargin: horizontalMargin,
      );
    });

    overlay.insert(entry);
  }
}

class _ToastWidget extends StatefulWidget {
  final OverlayEntry entry;
  final String message;
  final Color backgroundColor;
  final Duration duration;
  final DismissDirection dismissDirection;
  final double topOffset;
  final double horizontalMargin;

  const _ToastWidget({
    required this.entry,
    required this.message,
    required this.backgroundColor,
    required this.duration,
    required this.dismissDirection,
    required this.topOffset,
    required this.horizontalMargin,
  });

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<Offset> _slide;
  late final Animation<double> _fade;
  bool _isHiding = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));

    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);

    _ctrl.addStatusListener((status) {
      if (status == AnimationStatus.dismissed && _isHiding) {
        widget.entry.remove();
      }
    });

    _ctrl.forward();

    Future.delayed(widget.duration, _hide);
  }

  void _hide() {
    if (!_isHiding) {
      _isHiding = true;
      _ctrl.reverse();
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget toast = SlideTransition(
      position: _slide,
      child: FadeTransition(
        opacity: _fade,
        child: _buildContainer(),
      ),
    );

    switch (widget.dismissDirection) {
      case DismissDirection.horizontal:
        toast = GestureDetector(
          onHorizontalDragEnd: (_) => _hide(),
          child: toast,
        );
        break;
      case DismissDirection.vertical:
        toast = GestureDetector(
          onVerticalDragEnd: (_) => _hide(),
          child: toast,
        );
        break;
      case DismissDirection.up:
        toast = GestureDetector(
          onVerticalDragEnd: (_) => _hide(),
          child: toast,
        );
        break;
      case DismissDirection.down:
        toast = GestureDetector(
          onVerticalDragEnd: (_) => _hide(),
          child: toast,
        );
        break;
      case DismissDirection.startToEnd:
      case DismissDirection.endToStart:
        toast = GestureDetector(
          onHorizontalDragEnd: (_) => _hide(),
          child: toast,
        );
        break;
      case DismissDirection.none:
        throw UnimplementedError();
    }

    return Positioned(
      top: widget.topOffset,
      left: widget.horizontalMargin,
      right: widget.horizontalMargin,
      child: Material(color: Colors.transparent, child: toast),
    );
  }

  Widget _buildContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Text(
        widget.message,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
