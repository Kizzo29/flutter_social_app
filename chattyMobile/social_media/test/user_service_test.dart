/*import 'package:social_media/Models/user.dart';
import 'package:social_media/Services/user/user_impl.dart';

import 'helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';

main() {
  RethinkDb r = RethinkDb();
  late Connection connection;
  late UserService sut;

  setUp(() async {
   
    connection = await r.connect(
      db: 'test',
      host: 'localhost',
      port: 28015,
      user: 'admin',
      password: '',
    );
    await createDb(
      r,
      connection,
    );
    sut = UserService(connection, r);
  });

  tearDown(() async {
    await cleanDb(r, connection);
  });

  test('registers new user in db', () async {
    final user = User(
      active: true,
      lastseen: DateTime.now(),
      photourl: 'url',
      username: 'kk',
      friends: [],
    );
    final userWithId = await sut.connect(user);
    expect(userWithId.id, isNotEmpty);
  });

  test('get online users', () async {
    final user = User(
        active: true,
        lastseen: DateTime.now(),
        photourl: 'url',
        username: 'kk',
        friends: []);
    await sut.connect(user);
    final users = await sut.online();
    expect(users.length, 1);
  });
}*/
