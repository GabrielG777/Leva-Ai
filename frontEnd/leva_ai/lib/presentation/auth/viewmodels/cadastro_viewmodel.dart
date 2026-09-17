import 'package:flutter/foundation.dart';
import '../../../domain/auth/usecases/cadastrar_usuario_usecase.dart';

class CadastroViewModel extends ChangeNotifier {
  final CadastrarUsuarioUseCase _cadastrarUseCase;

  CadastroViewModel(this._cadastrarUseCase);

  bool _carregando = false;
  String? _erro;
  bool _cadastrado = false;
  bool _aceitouTermos = false;

  bool get carregando => _carregando;
  String? get erro => _erro;
  bool get cadastrado => _cadastrado;
  bool get aceitouTermos => _aceitouTermos;

  void alternarTermos(bool? valor) {
    _aceitouTermos = valor ?? false;
    notifyListeners();
  }

  Future<void> cadastrar({
    required String nome,
    required String email,
    required String telefone,
    required String senha,
    required String confirmarSenha,
  }) async {
    _carregando = true;
    _erro = null;
    notifyListeners();

    try {
      await _cadastrarUseCase.executar(
        nome: nome,
        email: email,
        telefone: telefone,
        senha: senha,
        confirmarSenha: confirmarSenha,
        aceitouTermos: _aceitouTermos,
      );
      _cadastrado = true;
    } catch (e) {
      _erro = e.toString().replaceAll('Exception: ', '');
    } finally {
      _carregando = false;
      notifyListeners();
    }
  }
}