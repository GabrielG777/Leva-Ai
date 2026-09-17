import 'package:flutter/material.dart';
import '../../../core/theme/cores_app.dart';

class CampoTextoApp extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController controller;
  final IconData? icone;
  final bool obscureText;
  final TextInputType keyboardType;

  const CampoTextoApp({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.icone,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: CoresApp.claroTextoPrincipal,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: icone != null
                ? Icon(icone, size: 20, color: CoresApp.claroTextoDesabilitado)
                : null,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: CoresApp.claroBorda),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: CoresApp.azulPrimario, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}