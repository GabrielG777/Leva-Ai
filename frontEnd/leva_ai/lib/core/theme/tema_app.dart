import 'package:flutter/material.dart';
import 'cores_app.dart';
import 'tipografia_app.dart';

class TemaApp {
  static ThemeData get claro {
    final textTheme = TipografiaApp.obterTextTheme(
      CoresApp.claroTextoPrincipal,
      CoresApp.claroTextoSecundario,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: CoresApp.azulPrimario,
      scaffoldBackgroundColor: CoresApp.claroFundo,
      textTheme: textTheme,
      colorScheme: const ColorScheme.light(
        primary: CoresApp.azulPrimario,
        onPrimary: Colors.white,
        secondary: CoresApp.ambarDestaque,
        onSecondary: Colors.white,
        error: CoresApp.erro,
        onError: Colors.white,
        surface: CoresApp.claroSuperficie,
        onSurface: CoresApp.claroTextoPrincipal,
        outline: CoresApp.claroBorda,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: CoresApp.claroSuperficie,
        elevation: 0,
        scrolledUnderElevation: 1,
        centerTitle: true,
        iconTheme: IconThemeData(color: CoresApp.claroTextoPrincipal),
        titleTextStyle: TextStyle(
          color: CoresApp.claroTextoPrincipal,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: CoresApp.azulPrimario,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 52),
          elevation: 0,
          textStyle: textTheme.labelLarge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: CoresApp.azulPrimario,
          minimumSize: const Size(double.infinity, 52),
          side: const BorderSide(color: CoresApp.claroBorda, width: 1.5),
          textStyle: textTheme.labelLarge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: CoresApp.claroTextoSecundario,
          textStyle: textTheme.titleMedium,
        ),
      ),
      cardTheme: CardThemeData(
        color: CoresApp.claroSuperficie,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: CoresApp.claroBorda, width: 1),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: CoresApp.claroSuperficie,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: TextStyle(color: CoresApp.claroTextoDesabilitado, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: CoresApp.claroBorda),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: CoresApp.claroBorda),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: CoresApp.azulPrimario, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: CoresApp.erro),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: CoresApp.claroBorda,
        thickness: 1,
        space: 1,
      ),
    );
  }

  static ThemeData get escuro {
    final textTheme = TipografiaApp.obterTextTheme(
      CoresApp.escuroTextoPrincipal,
      CoresApp.escuroTextoSecundario,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: CoresApp.azulPrimario,
      scaffoldBackgroundColor: CoresApp.escuroFundo,
      textTheme: textTheme,
      colorScheme: const ColorScheme.dark(
        primary: CoresApp.azulClaro,
        onPrimary: CoresApp.escuroFundo,
        secondary: CoresApp.ambarDestaque,
        onSecondary: Colors.white,
        error: CoresApp.erro,
        onError: Colors.white,
        surface: CoresApp.escuroSuperficie,
        onSurface: CoresApp.escuroTextoPrincipal,
        outline: CoresApp.escuroBorda,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: CoresApp.escuroFundo,
        elevation: 0,
        scrolledUnderElevation: 1,
        centerTitle: true,
        iconTheme: IconThemeData(color: CoresApp.escuroTextoPrincipal),
        titleTextStyle: TextStyle(
          color: CoresApp.escuroTextoPrincipal,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: CoresApp.azulPrimario,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 52),
          elevation: 0,
          textStyle: textTheme.labelLarge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: CoresApp.escuroTextoPrincipal,
          minimumSize: const Size(double.infinity, 52),
          side: const BorderSide(color: CoresApp.escuroBorda, width: 1.5),
          textStyle: textTheme.labelLarge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: CoresApp.escuroTextoSecundario,
          textStyle: textTheme.titleMedium,
        ),
      ),
      cardTheme: CardThemeData(
        color: CoresApp.escuroSuperficie,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: CoresApp.escuroBorda, width: 1),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: CoresApp.escuroSuperficie,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintStyle: TextStyle(color: CoresApp.escuroTextoDesabilitado, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: CoresApp.escuroBorda),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: CoresApp.escuroBorda),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: CoresApp.azulClaro, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: CoresApp.erro),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: CoresApp.escuroBorda,
        thickness: 1,
        space: 1,
      ),
    );
  }
}

// Extensão prática para acesso rápido às cores e tipografia no código
extension ContextoTema on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get text => Theme.of(this).textTheme;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}