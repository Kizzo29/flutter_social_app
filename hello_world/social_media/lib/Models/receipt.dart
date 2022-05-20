enum ReceiptStatus { sent, deliverred, read }

extension EnumParsing on ReceiptStatus {
  String value() {
    return this.toString().split('.').last;
  }

  static ReceiptStatus fromString(String status) {
    return ReceiptStatus.values
        .firstWhere((element) => element.value() == status);
  }
}

class Receipt {
  final String recipient;
  final String messageId;
  final String? storyId;
  final ReceiptStatus status;
  final DateTime timestamp;
  late String _id;
  String get id => _id;

  Receipt(
      {required this.storyId,
      required this.messageId,
      required this.recipient,
      required this.status,
      required this.timestamp});

  Map<String, dynamic> toJson() => {
        'recipient': recipient,
        'message_id': messageId,
        'status': status.value(),
        'timestamp': timestamp,
        'storyId' : storyId,
      };

  factory Receipt.fromJson(Map<String, dynamic> json) {
    var receipt = Receipt(
        messageId: json['messageId'],
        recipient: json['recipient'],
        status: json['status'],
        timestamp: json['timestamp'], 
        storyId: json['storyId']);
    receipt._id = json['id'];
    return receipt;
  }
}
