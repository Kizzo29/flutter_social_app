/*import 'package:rethink_db_ns/rethink_db_ns.dart';

Future<void> createDb(RethinkDb r, Connection connection ) async {
  await r.dbCreate('test').run(connection).catchError((err) => {});
  await r.tableCreate('users').run(connection).catchError((err) => {});
  await r.tableCreate('messages').run(connection).catchError((err) => {});
  await r.tableCreate('receipts').run(connection).catchError((err) => {});
  await r.tableCreate('typing_events').run(connection).catchError((err) => {});
  await r.tableCreate('comments').run(connection).catchError((err) => {});
  await r.tableCreate('chat_rooms').run(connection).catchError((err) => {});
  await r.tableCreate('statuses').run(connection).catchError((err) => {});
}

Future<void> cleanDb(RethinkDb r, Connection connection) async {
  await r.table('users').delete().run(connection);
  await r.table('messages').delete().run(connection);
  await r.table('receipts').delete().run(connection);
  await r.table('typing_events').delete().run(connection);
  await r.table('comments').delete().run(connection);
  await r.table('chat_rooms').delete().run(connection);
  await r.table('statuses').delete().run(connection);
}*/
