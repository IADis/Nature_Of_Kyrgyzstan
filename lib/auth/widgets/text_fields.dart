import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    this.errorText,
    this.obscureText,
    this.suffixIcon,
    this.labelText,
    this.prefixIcon,
    required this.controller,
    required this.onChanged,
  });
  final TextEditingController controller;
  final Function(String value) onChanged;
  final String? errorText;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? labelText;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 17,
          sigmaY: 17,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            obscureText: widget.obscureText ?? false,
            controller: widget.controller,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              focusedErrorBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 25,
              ),
              hintText: widget.labelText,
              hintStyle: GoogleFonts.getFont(
                'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.8),
              ),
              suffixIcon: widget.suffixIcon,
              suffixIconColor: Colors.blue,
              errorText: widget.errorText,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                  // borderSide: const BorderSide(color: Colors.green, width: 2),
                  ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                  // borderSide: const BorderSide(color: Colors.blue, width: 2),
                  ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                  // borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
