import 'package:flutter/material.dart';
import 'package:leva_ai/data/auth/datasources/auth_repository_mock.dart';
import 'package:leva_ai/domain/auth/usecases/autenticar_usuario_usecase.dart';
import 'package:leva_ai/domain/auth/usecases/cadastrar_usuario_usecase.dart';
import 'package:leva_ai/presentation/auth/viewmodels/cadastro_viewmodel.dart';
import 'package:leva_ai/presentation/auth/viewmodels/login_viewmodel.dart';
import 'package:leva_ai/presentation/auth/views/cadastro_view.dart';
import 'package:leva_ai/presentation/auth/views/login_view.dart';
import 'package:leva_ai/presentation/onboarding/viewmodels/onboarding_viewmodel.dart';
import 'package:leva_ai/presentation/splash/views/splash_view.dart';

import '../routes/rotas_app.dart';
import '../../presentation/onboarding/views/onboarding_view.dart';

// Importe aqui a sua CatalogoFretesPagina ou LoginPagina existente

class InjecaoDependencias {
  static Route<dynamic> gerarRota(RouteSettings settings) {
    switch (settings.name) {
      case RotasApp.inicio:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case RotasApp.onboarding:
        return MaterialPageRoute(
          builder: (_) => OnboardingView(viewModel: OnboardingViewModel()),
        );

      case RotasApp.login:
        final authRepo = AuthRepositoryMock();
        return MaterialPageRoute(
          builder: (_) => LoginView(
            viewModel: LoginViewModel(AutenticarUsuarioUseCase(authRepo)),
          ),
        );

      case RotasApp.entrar:
        final authRepo = AuthRepositoryMock();
        return MaterialPageRoute(
          builder: (_) => CadastroView(
            viewModel: CadastroViewModel(CadastrarUsuarioUseCase(authRepo)),
          ),
        );

      case RotasApp.catalogo:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('CatalogoFretesPagina'),
            ), // Troque pela sua classe real
          ),
        );

      case RotasApp.detalhes:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Tela de Detalhes'))),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Rota não encontrada'))),
        );
    }
  }
}
