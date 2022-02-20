class LabelValue {
  String label;
  double value;

  LabelValue({
    this.label,
    this.value,
  });
}

class LabelTypeValue {
  String label;
  String type;
  double value;

  LabelTypeValue({
    this.label,
    this.type,
    this.value,
  });
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
    if (data != null) {
      uid = id ?? '';
      costs = data.containsKey('costs') ? Account.getLabelTypeValue(data['costs']) : [];
      wishes = data.containsKey('wishes') ? Account.getLabelValue(data['wishes']) : [];
      receivable = data.containsKey('receivable') ? Account.getLabelValue(data['receivable']) : [];
    }
  }

  static List<LabelValue> getLabelValue(List<dynamic> list) {
    return list
        .map((e) => new LabelValue(
              label: e['label'] ?? '',
              value: 0.0 + (e['value'] ?? 0),
            ))
        .toList();
  }

  static List<LabelTypeValue> getLabelTypeValue(List<dynamic> list) {
    return list
        .map((e) => new LabelTypeValue(
              label: e['label'] ?? '',
              type: e['type'] ?? '',
              value: 0.0 + (e['value'] ?? 0),
            ))
        .toList();
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
