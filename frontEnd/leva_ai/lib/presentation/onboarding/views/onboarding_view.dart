import 'package:flutter/material.dart';

import '../../../core/routes/rotas_app.dart';
import '../../../core/theme/cores_app.dart';
import '../viewmodels/onboarding_viewmodel.dart';
import '../widgets/slide_onboarding_widget.dart';

class OnboardingView extends StatefulWidget {
  final OnboardingViewModel viewModel;

  const OnboardingView({super.key, required this.viewModel});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    widget.viewModel.dispose();
    super.dispose();
  }

  void _animarPara(int pagina) {
    _pageController.animateToPage(
      pagina,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        if (widget.viewModel.concluido) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, RotasApp.login);
          });
        }

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 48,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: !widget.viewModel.ehUltimaPagina
                          ? TextButton(
                              onPressed: widget.viewModel.pular,
                              child: const Text('Pular'),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: widget.viewModel.itens.length,
                      onPageChanged: widget.viewModel.atualizarIndice,
                      itemBuilder: (context, index) {
                        return SlideOnboardingWidget(
                          item: widget.viewModel.itens[index],
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.viewModel.itens.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: widget.viewModel.indiceAtual == index ? 24 : 8,
                        decoration: BoxDecoration(
                          color: widget.viewModel.indiceAtual == index
                              ? CoresApp.azulPrimario
                              : CoresApp.claroBorda,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => widget.viewModel.avancar(_animarPara),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.viewModel.ehUltimaPagina
                              ? 'Começar Agora'
                              : 'Próximo',
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward_rounded, size: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
