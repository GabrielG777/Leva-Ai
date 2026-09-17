import '../../../domain/auth/entities/usuario_entity.dart';

class UsuarioModel extends UsuarioEntity {
  const UsuarioModel({
    required super.id,
    required super.nome,
    required super.email,
    super.telefone,
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      id: json['id'] as String,
      nome: json['nome'] as String,
      email: json['email'] as String,
      telefone: json['telefone'] as String?,
    );
  }
}