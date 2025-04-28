import 'package:flutter/material.dart';
import 'upload_repository.dart';

class UploadController {
  final UploadRepository repository;

  ValueNotifier<List<String>> files = ValueNotifier([]);

  UploadController(this.repository) {
    loadFiles();
  }

  Future<void> pickAndUploadFile() async {
    await repository.pickAndUploadFile();
    loadFiles();
  }

  Future<void> loadFiles() async {
    files.value = await repository.listFiles();
  }

  Future<String> getDownloadUrl(String fileName) async {
    return await repository.getDownloadUrl(fileName);
  }
}
