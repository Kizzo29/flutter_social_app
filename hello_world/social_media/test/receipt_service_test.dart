/*import 'package:social_media/Models/receipt.dart';
import 'package:social_media/Models/user.dart';
import 'package:social_media/Services/receipt/receipt_impl.dart';

import 'helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';

main() {
 late RethinkDb r = RethinkDb();
 late Connection connection;
 late ReceiptService sut;

  setUp(() async {
    connection = await r.connect();
    await createDb(r, connection);
    sut = ReceiptService(connection, r);
  });

  tearDown(() async {
    sut.dispose();
    await cleanDb(r, connection);
  });

  final user =
      User.fromJson({'id': '1234', 'active': true, 'lastseen': DateTime.now()});

  test('sent receipt successfully', () async {
Receipt receipt = Receipt(
  recipient: '444',
  messageId: '1234',
  status: ReceiptStatus.deliverred,
  timestamp: DateTime.now(), storyId: ''
  );
   final res = await sut.send(receipt);
   expect(res, true);  
});

test('receive receipts', () async {
  sut.receipts(user).listen(expectAsync1((receipt) {
    expect(receipt.recipient, user.id);
   },count: 2));

   Receipt receipt = Receipt(messageId: '1234', recipient: user.id, status: ReceiptStatus.deliverred, timestamp: DateTime.now(), storyId: '');
   Receipt anotherReceipt = Receipt(messageId: '1234', recipient: user.id, status: ReceiptStatus.read, timestamp: DateTime.now(), storyId: '');

   await sut.send(receipt);
   await sut.send(anotherReceipt);

});
}
*/

