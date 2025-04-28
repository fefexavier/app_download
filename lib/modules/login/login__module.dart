import 'package:file_upload_app/modules/login/registrar_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';
import 'login_page.dart';
import 'login_repository.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    i
    ..add(LoginRepository.new)
    ..add(LoginController.new);
     }

  @override


        void routes(RouteManager r) {
    r
      ..child(
        '/',
        child: (_) => const LoginPage(),
      )
         ..child(
        '/register',
        child: (_) => const RegisterPage(),
      );
   
  }
}
