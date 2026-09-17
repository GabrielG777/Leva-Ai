import 'package:flutter/material.dart';
import '../../../core/theme/tema_app.dart';
import '../models/item_onboarding_model.dart';

class SlideOnboardingWidget extends StatelessWidget {
  final ItemOnboardingModel item;

  const SlideOnboardingWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Ilustração com círculo e badge flutuante posicionado dinamicamente
        SizedBox(
          width: 220,
          height: 220,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Círculo central grande
              Center(
                child: Container(
                  width: 190,
                  height: 190,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.isDark
                        ? item.corFundoCirculo.withValues(alpha: 0.15)
                        : item.corFundoCirculo,
                  ),
                  child: Center(
                    child: Icon(
                      item.iconePrincipal,
                      size: 80,
                      color: item.corIconePrincipal,
                    ),
                  ),
                ),
              ),

              // Badge Flutuante posicionado conforme o Figma
              _construirBadgeFlutuante(),
            ],
          ),
        ),
        const SizedBox(height: 48),

        // Título
        Text(
          item.titulo,
          textAlign: TextAlign.center,
          style: context.text.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 16),

        // Subtítulo
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 310),
          child: Text(
            item.descricao,
            textAlign: TextAlign.center,
            style: context.text.bodyMedium?.copyWith(
              height: 1.5,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _construirBadgeFlutuante() {
    double? top;
    double? bottom;
    double? left;
    double? right;

    switch (item.posicaoBadge) {
      case PosicaoBadge.superiorDireito:
        top = 18;
        right = 18;
        break;
      case PosicaoBadge.inferiorDireito:
        bottom = 22;
        right = 16;
        break;
      case PosicaoBadge.inferiorEsquerdo:
        bottom = 22;
        left = 16;
        break;
    }

    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: item.corBadgeFundo,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: item.corBadgeFundo.withValues(alpha: 0.35),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          item.iconeBadge,
          size: 24,
          color: item.corIconeBadge,
        ),
      ),
    );
  }
}