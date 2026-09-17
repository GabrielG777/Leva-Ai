import 'package:flutter/foundation.dart';
import '../../../domain/auth/usecases/autenticar_usuario_usecase.dart';

class LoginViewModel extends ChangeNotifier {
  final AutenticarUsuarioUseCase _autenticarUseCase;

  LoginViewModel(this._autenticarUseCase);

  bool _carregando = false;
  String? _erro;
  bool _autenticado = false;

  bool get carregando => _carregando;
  String? get erro => _erro;
  bool get autenticado => _autenticado;

  Future<void> login(String email, String senha) async {
    _carregando = true;
    _erro = null;
    notifyListeners();

    try {
      await _autenticarUseCase.executar(email: email, senha: senha);
      _autenticado = true;
    } catch (e) {
      _erro = e.toString().replaceAll('Exception: ', '');
    } finally {
      _carregando = false;
      notifyListeners();
    }
  }
}