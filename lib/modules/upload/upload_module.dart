import 'package:flutter_modular/flutter_modular.dart';
import 'upload_controller.dart';
import 'upload_page.dart';
import 'upload_repository.dart';

class UploadModule extends Module {
  @override

        void binds(Injector i) {
    i
    ..add(UploadRepository.new)
    ..add(UploadController.new);
     }

  @override
        void routes(RouteManager r) {
    r
      .child(
        '/',
        child: (_) => const UploadPage(),
      );
   
  }
}
