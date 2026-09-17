import 'package:flutter/material.dart';

import '../models/item_onboarding_model.dart';

class OnboardingViewModel extends ChangeNotifier {
  int _indiceAtual = 0;
  bool _concluido = false;

  int get indiceAtual => _indiceAtual;
  bool get ehUltimaPagina => _indiceAtual == itens.length - 1;
  bool get concluido => _concluido;

  final List<ItemOnboardingModel> itens = const [
    // Slide 1: Frete Ideal
    ItemOnboardingModel(
      titulo: 'Encontre o frete ideal',
      descricao: 'Encontre prestadores qualificados próximos de você para realizar seu transporte com segurança.',
      iconePrincipal: Icons.map_rounded,
      corIconePrincipal: Color(0xFF2563EB), // Azul Royal
      corFundoCirculo: Color(0xFFEFF6FF),
      iconeBadge: Icons.inventory_2_rounded,
      corBadgeFundo: Color(0xFF38BDF8), // Ciano
      corIconeBadge: Color(0xFF0F172A), // Ícone escuro como no Figma
      posicaoBadge: PosicaoBadge.inferiorDireito,
    ),

    // Slide 2: Preços e Avaliações
    ItemOnboardingModel(
      titulo: 'Compare preços e avaliações',
      descricao: 'Transparência total. Veja opiniões de outros clientes e escolha a melhor opção para seu bolso.',
      iconePrincipal: Icons.scale_rounded,
      corIconePrincipal: Color(0xFF0891B2), // Ciano petróleo
      corFundoCirculo: Color(0xFFE0F2FE),
      iconeBadge: Icons.star_rounded,
      corBadgeFundo: Color(0xFF1E40AF), // Azul escuro
      corIconeBadge: Color(0xFFFACC15), // Estrela amarela
      posicaoBadge: PosicaoBadge.superiorDireito,
    ),

    // Slide 3: Rastreio
    ItemOnboardingModel(
      titulo: 'Acompanhe seu serviço',
      descricao: 'Siga o trajeto do motorista em tempo real do ponto de partida até a entrega final.',
      iconePrincipal: Icons.route_rounded,
      corIconePrincipal: Color(0xFF059669), // Verde esmeralda escuro
      corFundoCirculo: Color(0xFFDCFCE7), // Verde menta suave
      iconeBadge: Icons.local_shipping_rounded,
      corBadgeFundo: Color(0xFF10B981), // Verde vivo
      corIconeBadge: Colors.white,
      posicaoBadge: PosicaoBadge.inferiorEsquerdo,
    ),
  ];
  void atualizarIndice(int novoIndice) {
    _indiceAtual = novoIndice;
    notifyListeners();
  }

  void avancar(void Function(int proximaPagina) animarParaPagina) {
    if (ehUltimaPagina) {
      concluir();
    } else {
      animarParaPagina(_indiceAtual + 1);
    }
  }

  void pular() => concluir();

  void concluir() {
    _concluido = true;
    notifyListeners();
  }
}
