import 'package:flutter/material.dart';

abstract class CoresApp {
  // Identidade Principal (LevaAí)
  static const Color azulPrimario = Color(0xFF2563EB);
  static const Color azulEscuro = Color(0xFF1D4ED8);
  static const Color azulClaro = Color(0xFF60A5FA);
  static const Color azulSuave = Color(0xFFEFF6FF);

  // Cores de Ação / Destaque
  static const Color ambarDestaque = Color(0xFFF59E0B);
  static const Color laranjaAcento = Color(0xFFEA580C);

  // Estados
  static const Color sucesso = Color(0xFF10B981);
  static const Color aviso = Color(0xFFF59E0B);
  static const Color erro = Color(0xFFEF4444);
  static const Color info = Color(0xFF0EA5E9);

  // Neutros - Tema Claro
  static const Color claroFundo = Color(0xFFF8FAFC);
  static const Color claroSuperficie = Color(0xFFFFFFFF);
  static const Color claroBorda = Color(0xFFE2E8F0);
  static const Color claroTextoPrincipal = Color(0xFF0F172A);
  static const Color claroTextoSecundario = Color(0xFF64748B);
  static const Color claroTextoDesabilitado = Color(0xFF94A3B8);

  // Neutros - Tema Escuro
  static const Color escuroFundo = Color(0xFF0B1120);
  static const Color escuroSuperficie = Color(0xFF1E293B);
  static const Color escuroSuperficieElevada = Color(0xFF334155);
  static const Color escuroBorda = Color(0xFF334155);
  static const Color escuroTextoPrincipal = Color(0xFFF8FAFC);
  static const Color escuroTextoSecundario = Color(0xFF94A3B8);
  static const Color escuroTextoDesabilitado = Color(0xFF64748B);
}