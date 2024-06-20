import 'package:flutter/material.dart';

/// A reusable widget that displays an icon with a count.
///
/// This widget shows an icon followed by a count number, arranged horizontally.
class CustomIconButton extends StatelessWidget {
  /// The count number to be displayed next to the icon.
  final int count;

  /// The icon to be displayed.
  final IconData icon;

  /// Creates a CustomIconButton widget.
  ///
  /// The [count] and [icon] parameters are required and must not be null.
  const CustomIconButton({
    required this.count,
    required this.icon,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 5,
          ),
          Text(count.toString())
        ],
      ),
    );
  }
}
