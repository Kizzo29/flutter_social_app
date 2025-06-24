
/*import 'package:flutter_test/flutter_test.dart';
import 'package:encrypt/encrypt.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';
import 'package:social_media/Models/message.dart';
import 'package:social_media/Models/user.dart';
import 'package:social_media/Services/encryption/encrypt_impl.dart';
import 'package:social_media/Services/message/message_impl.dart';
import 'helper.dart';

void main() {
  late RethinkDb r = RethinkDb();
  late Connection connection;
 late MessageService sut;

  setUp(() async {
    connection = await r.connect(host: '127.0.0.1', port: 28015);
    final encryption = EncryptionService(Encrypter(AES(Key.fromLength(32))));
    await createDb(r, connection);
    sut = MessageService(r, connection, encryption: encryption);
  });

  tearDown(() async {
    sut.dispose();
    await cleanDb(r, connection);
  });

  final user =
      User.fromJson({'id': '1234', 'active': true, 'lastseen': DateTime.now()});

  final user2 =
      User.fromJson({'id': '1111', 'active': true, 'latseen': DateTime.now()});

  test('sent message successfully', () async {
    Message message = Message(
        contents: 'this is a message',
        from: user.id,
        to: '3456',
        time_record: DateTime.now(),
        roomId: '');
    final res = await sut.send([message]);
    expect(res, true);
  });

  test('successfully receive messages', () async {
    final contents = 'this is a message';
    sut.messages(activeUser: user2).listen(expectAsync1((message) {
          expect(message.to, user2.id);
          expect(message.id, isNotEmpty);
          expect(message.contents, contents);
        }, count: 2));

    Message message = Message(
        contents: contents,
        from: user.id,
        to: user2.id,
        time_record: DateTime.now(),
        roomId: '');
    Message secondMessage = Message(
        contents: contents,
        from: user.id,
        to: user2.id,
        time_record: DateTime.now(),
        roomId: '');

    await sut.send([message]);
    await sut.send([secondMessage]);
  });

  test('successfully receive new messages', () async {
    Message message = Message(
        contents: 'this is a message',
        from: user.id,
        to: user2.id,
        time_record: DateTime.now(),
        roomId: '');
    Message secondMessage = Message(
        contents: 'this is another message',
        from: user.id,
        to: user2.id,
        time_record: DateTime.now(),
        roomId: '');

    await sut.send([message]);
    await sut.send([secondMessage]).whenComplete(
          () => sut.messages(activeUser: user2).listen(
                expectAsync1((message) {
                  expect(message.to, user2.id);
                }, count: 2),
              ),
        );
  });
}*/
