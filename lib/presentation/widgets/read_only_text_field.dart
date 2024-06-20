import 'package:flutter/material.dart';

/// A reusable read-only text field widget.
///
/// This widget provides a text field that displays a given initial value
/// and label text, styled with a custom input decoration. The text field
/// is read-only, meaning the user cannot edit its content.
class ReadOnlyTextField extends StatelessWidget {
  /// The initial value to display inside the text field.
  final String initialValue;

  /// The label text to display above the text field.
  final String labelText;

  /// Creates a ReadOnlyTextField widget.
  ///
  /// The [initialValue] and [labelText] parameters are required and must not be null.
  const ReadOnlyTextField({
    required this.initialValue,
    required this.labelText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        initialValue: initialValue,
        readOnly: true,
        decoration: InputDecoration(
          labelText: labelText,
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
        ),
      ),
    );
  }
}
