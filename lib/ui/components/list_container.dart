import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ListContainer extends StatelessWidget {
  final Widget child;
  const ListContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(screenWidth * 0.08),
            ),
          ),
          child: child,
        )
        .animate()
        .slideY(begin: 0.4, end: 0)
        .fadeIn(duration: Duration(milliseconds: 600));
  }
}
