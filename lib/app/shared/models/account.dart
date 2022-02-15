class LabelValue {
  String label;
  double value;
}

class LabelTypeValue {
  String label;
  String type;
  double value;
}

class Account {
  String uid;
  List<LabelTypeValue> costs;
  List<LabelValue> wishes;
  List<LabelValue> receivable;

  Account({
    this.uid,
    this.costs,
    this.wishes,
    this.receivable,
  });

  Account.fromMap(String id, Map data) {
    uid = id ?? '';
    costs = data['costs'] ?? [];
    wishes = data['wishes'] ?? [];
    receivable = data['receivable'] ?? [];
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'costs': costs,
      'wishes': wishes,
      'receivable': receivable,
    };
  }

  static collection() {
    return 'accounts';
  }
}
