import 'dart:async';

import 'package:social_media/Models/receipt.dart';
import 'package:social_media/Models/user.dart';
import 'package:social_media/Services/receipt/receipt_contract.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';

class ReceiptService implements IReceiptService {
  Connection _connection;
  RethinkDb r;

  final _controller = StreamController<Receipt>.broadcast();
  StreamSubscription? _changestream;

  ReceiptService(this._connection, this.r);

  @override
  void dispose() {
    _controller.close();
    _changestream?.cancel();
  }

  @override
  Future<bool> send(Receipt receipt) async {
    var data = receipt.toJson();
    Map record = await r.table('receipts').insert(data).run(_connection);
    return record['inserted' == 1];
  }

  @override
  Stream<Receipt> receipts(User user, {User? activeUser}) {
    _startReceivingReceipts(user);
    return _controller.stream;
  }

  _startReceivingReceipts(User user) {
    _changestream = r
        .table('receipts')
        .filter({'receipient': user.id})
        .changes({'include_inititial': true})
        .run(_connection)
        .asStream()
        .cast<Feed>()
        .listen((event) {
          event
              .forEach((feedData) {
                if (feedData['new_val'] == null) return;
                final receipt = _receiptFromFeed(feedData);
                _removeDeliverredReceipt(receipt);
                _controller.sink.add(receipt);
              })
              .catchError((err) => print(err))
              .onError((error, stackTrace) => print(error));
        });
  }

  Receipt _receiptFromFeed(feedData) {
    var data = feedData['new_val'];
    return Receipt.fromJson(data);
  }

  _removeDeliverredReceipt(receipt) {
    r
        .table('receipts')
        .get(receipt.id)
        .delete({'return_changes': false}).run(_connection);
  }
}
