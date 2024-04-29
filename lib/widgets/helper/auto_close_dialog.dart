import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AutoCloseDialog extends StatefulWidget {
  final Duration duration;
  final bool barrierDismissible = true;
  final Widget? content;
  final Widget? title;
  final List<Widget>? action;

  const AutoCloseDialog(
      {super.key,
      this.duration = const Duration(seconds: 2),
      this.content,
      this.title,
      this.action});

  @override
  _AutoCloseDialogState createState() => _AutoCloseDialogState();
}

class _AutoCloseDialogState extends State<AutoCloseDialog> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.duration, () {
      Navigator.of(context).pop(); // Close the dialog
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.white.withOpacity(0.9),
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0.r),
      ),
      title: widget.title,
      actions: widget.action,
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: SingleChildScrollView(child: widget.content)),
          ],
        ),
      ),
    );
  }
}
