/*import 'package:rethink_db_ns/rethink_db_ns.dart';
import 'package:social_media/Models/typing.dart';
import 'package:social_media/Models/user.dart';
import 'package:social_media/Services/typing/typing_impl.dart';
import 'helper.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late RethinkDb r = RethinkDb();
  late Connection connection;
  late TypingNotification sut;
  setUp(() async {
    connection = await r.connect();
    await createDb(r, connection);
    sut = TypingNotification(r, connection, null);
  });

  tearDown(() async {
    sut.dispose();
    await cleanDb(r, connection);
  });

  final user =
      User.fromJson({'id': '1234', 'active': true, 'lastseen': DateTime.now()});

  final user2 =
      User.fromJson({'id': '1111', 'active': true, 'lastseen': DateTime.now()});

  test('sent typing notification', () async {
    TypingEvent typingEvent = TypingEvent(
        event: Typing.start, from: user2.id, to: user.id, chatId: '');

    final res = await sut.send(event: [typingEvent]);
    expect(res, true);
  });

  test('receiving typing event', () async {
    sut.subscribe(user2, [user.id]).listen(expectAsync1((event) {
      expect(event.from, user.id);
    }, count: 2));

    TypingEvent typing = TypingEvent(
        event: Typing.start, from: user.id, to: user2.id, chatId: '');
    TypingEvent stopTyping = TypingEvent(
        event: Typing.stop, from: user.id, to: user2.id, chatId: '');

    await sut.send(event: [typing]);
    await sut.send(event: [stopTyping]);
  });
}*/
