import 'package:flutter/material.dart';

enum PosicaoBadge { inferiorDireito, superiorDireito, inferiorEsquerdo }

class ItemOnboardingModel {
  final String titulo;
  final String descricao;
  final IconData iconePrincipal;
  final Color corIconePrincipal;
  final Color corFundoCirculo;
  final IconData iconeBadge;
  final Color corBadgeFundo;
  final Color corIconeBadge;
  final PosicaoBadge posicaoBadge;

  const ItemOnboardingModel({
    required this.titulo,
    required this.descricao,
    required this.iconePrincipal,
    required this.corIconePrincipal,
    required this.corFundoCirculo,
    required this.iconeBadge,
    required this.corBadgeFundo,
    required this.corIconeBadge,
    required this.posicaoBadge,
  });
}