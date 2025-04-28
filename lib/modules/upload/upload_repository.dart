import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class UploadRepository {
  final FirebaseStorage storage = FirebaseStorage.instance;

 Future<void> pickAndUploadFile() async {
  final result = await FilePicker.platform.pickFiles();

  if (result != null && result.files.single.path != null) {
    final path = result.files.single.path!;
    final file = File(path);

    if (!file.existsSync()) {
      throw Exception('Arquivo não encontrado no caminho especificado.');
    }

    final fileName = result.files.single.name;
    final ref = storage.ref().child('uploads/$fileName');
    await ref.putFile(file);
  } else {
    throw Exception('Nenhum arquivo selecionado.');
  }
}


Future<List<String>> listFiles() async {
  try {
    final result = await storage.ref('uploads').listAll();
    return result.items.map((e) => e.name).toList();
  } on FirebaseException catch (e) {
    if (e.code == 'object-not-found') {
 
      return [];
    } else {
      rethrow; 
    }
  }
}


  Future<String> getDownloadUrl(String fileName) async {
    final ref = storage.ref('uploads/$fileName');
    return await ref.getDownloadURL();
  }
}
