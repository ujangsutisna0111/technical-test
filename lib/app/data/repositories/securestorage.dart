import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = FlutterSecureStorage();

  Future<void> set(SecurestorageKey key, value) async {
    await storage.write(key: key.value, value: value);
  }
}

class SecurestorageKey {
  String value;
  SecurestorageKey(this.value);
  
  static final token = SecurestorageKey('TOKEN');
  static final id = SecurestorageKey('ID');
  static final name = SecurestorageKey('NAME');
  static final jabatanName = SecurestorageKey('JABATAN_NAME');
  static final branchName = SecurestorageKey('BRANCH_NAME');
}
