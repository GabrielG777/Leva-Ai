// lib/presentation/splash/viewmodels/splash_viewmodel.dart

import 'package:flutter/foundation.dart';

enum EstadoSplash { carregando, concluido }

class SplashViewModel extends ChangeNotifier {
  EstadoSplash _estado = EstadoSplash.carregando;

  EstadoSplash get estado => _estado;
  bool get estaPronto => _estado == EstadoSplash.concluido;

  Future<void> inicializarApp() async {
    // Simula a inicialização do app / futuras checagens de token e usecases
    await Future.delayed(const Duration(seconds: 5));

    _estado = EstadoSplash.concluido;
    notifyListeners();
  }
}
