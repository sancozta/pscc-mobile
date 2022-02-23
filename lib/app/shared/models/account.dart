class LabelValue {
  String label;
  double value;
  bool? checked = false;

  LabelValue({
    required this.label,
    required this.value,
    this.checked,
  });

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'value': value,
      'checked': checked,
    };
  }
}

class Account {
  String? uid = '';
  // LISTA DE DESPESAS
  List<LabelValue>? costs = [];
  // LISTA DE DESEJOS
  List<LabelValue>? wishes = [];
  // LISTA DE DINHEIRO A RECEBER
  List<LabelValue>? receivable = [];

  Account({
    this.uid,
    this.costs,
    this.wishes,
    this.receivable,
  });

  Account.fromMap(String id, Map data) {
    uid = id;
    costs = data.containsKey('costs') ? Account.getLabelValue(data['costs']) : [];
    wishes = data.containsKey('wishes') ? Account.getLabelValue(data['wishes']) : [];
    receivable = data.containsKey('receivable') ? Account.getLabelValue(data['receivable']) : [];
  }

  static List<LabelValue> getLabelValue(List<dynamic> list) {
    return list
        .map((e) => LabelValue(
              label: e['label'] ?? '',
              value: 0.0 + (e['value'] ?? 0),
              checked: e['checked'] ?? false,
            ))
        .toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'costs': costs?.map((e) => e.toMap()).toList(),
      'wishes': wishes?.map((e) => e.toMap()).toList(),
      'receivable': receivable?.map((e) => e.toMap()).toList(),
    };
  }

  static collection() {
    return 'accounts';
  }
}
