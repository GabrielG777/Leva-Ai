import 'package:flutter/material.dart';

import 'core/di/injecao_dependencias.dart';
import 'core/routes/rotas_app.dart';
import 'core/theme/tema_app.dart';

void main() => runApp(const AplicacaoLevaAi());

class AplicacaoLevaAi extends StatelessWidget {
  const AplicacaoLevaAi({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'LevaAí',
    debugShowCheckedModeBanner: false,
    theme: TemaApp.claro,
    darkTheme: TemaApp.escuro,
    themeMode: ThemeMode.system,
    initialRoute: RotasApp.inicio,
    onGenerateRoute: InjecaoDependencias.gerarRota,
  );
}
