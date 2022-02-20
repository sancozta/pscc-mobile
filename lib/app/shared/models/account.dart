class LabelValue {
  String label;
  double value;

  LabelValue({
    this.label,
    this.value,
  });
}

class Account {
  String uid;
  // LISTA DE DESPESAS
  List<LabelValue> costs = [];
  // LISTA DE DESEJOS
  List<LabelValue> wishes = [];
  // LISTA DE DINHEIRO A RECEBER
  List<LabelValue> receivable = [];

  Account({
    this.uid,
    this.costs,
    this.wishes,
    this.receivable,
  });

  Account.fromMap(String id, Map data) {
    if (data != null) {
      uid = id ?? '';
      costs = data.containsKey('costs') ? Account.getLabelValue(data['costs']) : [];
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
