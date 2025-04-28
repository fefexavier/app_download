import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginRepository {
  final _auth = FirebaseAuth.instance;

Future<void> login(String email, String password, BuildContext context) async {
  try {
    await _auth.signInWithEmailAndPassword(email: email, password: password);

    ScaffoldMessenger.of(context).showSnackBar(
      
      const SnackBar(content: Text('Login realizado com sucesso!'),
                duration: Duration(seconds: 3),),
    );

    Modular.to.navigate('/upload/');

  } on FirebaseAuthException catch (e) {
    String message = 'Erro desconhecido. Tente novamente.';

    if (e.code == 'user-not-found') {
      message = 'Usuário não encontrado.';
    } else if (e.code == 'wrong-password') {
      message = 'Senha incorreta.';
    } else if (e.code == 'invalid-email') {
      message = 'Email inválido.';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message),           duration: Duration(seconds: 3),),
    );

  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Erro inesperado.')),
    );
  }
}


  Future<void> register(String email, String password, BuildContext context) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      
      // Se deu certo, mostrar sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registro realizado com sucesso!')),
      );

      // E voltar para a tela de login
      Modular.to.pop();

    } on FirebaseAuthException catch (e) {
      String message = 'Erro desconhecido. Tente novamente.';

      if (e.code == 'email-already-in-use') {
        message = 'Este email já está em uso.';
      } else if (e.code == 'invalid-email') {
        message = 'Email inválido.';
      } else if (e.code == 'weak-password') {
        message = 'A senha é muito fraca. Escolha uma mais forte.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
      
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro inesperado.')),
      );
    }
  }
}
