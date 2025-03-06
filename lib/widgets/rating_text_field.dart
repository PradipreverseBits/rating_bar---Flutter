import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/rating_utils.dart';

class RatingTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final Function(String) onChanged;

  const RatingTextField({
    super.key,
    required this.controller,
    required this.errorText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,1}$')),
            TextInputFormatter.withFunction((oldValue, newValue) {
              try {
                final text = newValue.text;
                if (text.isEmpty) {
                  return newValue;
                }
                double value = double.parse(text);
                if (value > 5) {
                  return oldValue;
                }
                return newValue;
              } catch (e) {
                return oldValue;
              }
            }),
          ],
          decoration: InputDecoration(
            labelText: 'Enter Rating (0-5)',
            border: const OutlineInputBorder(),
            hintText: 'Example: 3.3',
            errorText: errorText,
            errorStyle: const TextStyle(color: Colors.red),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
} 