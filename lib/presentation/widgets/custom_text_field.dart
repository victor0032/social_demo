import 'package:flutter/material.dart';

/// A reusable text field widget for adding comments.
///
/// This widget provides a text field with a custom styled input decoration
/// including an optional hint text and an optional prefix icon.
class CustomTextField extends StatelessWidget {
  /// The hint text to display inside the text field when it is empty.
  final String hintText;

  /// An optional widget to display before the text field.
  final Widget? prefixIcon;

  /// Creates a CustomTextField widget.
  ///
  /// The [hintText] parameter is required and must not be null.
  /// The [prefixIcon] parameter is optional.
  const CustomTextField({
    required this.hintText,
    this.prefixIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey.shade200,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300, width: 0),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300, width: 0),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
      )),
    );
  }
}
