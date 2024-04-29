import 'package:flutter/material.dart';

class RotatingIconButton extends StatefulWidget {
  final bool isExpanded;
  final VoidCallback onTap;

  const RotatingIconButton({super.key,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  _RotatingIconButtonState createState() => _RotatingIconButtonState();
}

class _RotatingIconButtonState extends State<RotatingIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: InkWell(
        onTap: () {
          widget.onTap(); // Execute the provided onTap callback
          _controller.forward(from: 0.0);
        },
        borderRadius: BorderRadius.circular(50),
        splashColor: Colors.green.withOpacity(0.5),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * (180 * 0.0174533),
              // Convert degrees to radians
              child: child,
            );
          },
          child: Icon(
            widget.isExpanded
                ? Icons.keyboard_arrow_down_sharp
                : Icons.keyboard_arrow_up_sharp,
            size: 30,
          ),
        ),
      ),
    );
  }
}
