import 'package:encrypt/encrypt.dart';
/*import 'package:flutter_test/flutter_test.dart';
import 'package:social_media/Services/encryption/encrypt_impl.dart';

main() {
  late EncryptionService sut;

  setUp(() {
    final encrypter = Encrypter(AES(Key.fromLength(32)));
    sut = EncryptionService(encrypter);
  });

  test('it encrypts plain text', () {
    final text = 'this is a message';
    final base64 = RegExp(
        r'^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{4})$');

    final encrypted = sut.encrypt(text);

    expect(base64.hasMatch(encrypted), true);
  });

  test('it decrypts data', () {
    final text = 'this is a message';
    final encrypted = sut.encrypt(text);
    final decrypted = sut.decrypt(encrypted);
    expect(decrypted, text);
  });
}*/
