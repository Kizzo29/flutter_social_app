import 'package:social_media/Models/receipt.dart';
import 'package:social_media/Models/user.dart';

abstract class IReceiptService {
  Future<bool> send(Receipt receipt);
  Stream<Receipt> receipts(User user, {User activeUser});
  void dispose();
}
