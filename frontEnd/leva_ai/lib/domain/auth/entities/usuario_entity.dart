class UsuarioEntity {
  final String id;
  final String nome;
  final String email;
  final String? telefone;

  const UsuarioEntity({
    required this.id,
    required this.nome,
    required this.email,
    this.telefone,
  });
}