import 'package:file_upload_app/modules/login/login__module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/upload/upload_module.dart';

class AppModule extends Module {
  @override

        void routes(RouteManager r) {
    r
    
      ..module('/', module: LoginModule())
       ..module('/upload', module: UploadModule());
 
  }
}
