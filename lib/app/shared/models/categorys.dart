class Category {
  String uid;
  String title;
  String key;
  String icon;
  String order;

  Category({
    this.uid,
    this.title,
    this.key,
    this.icon,
    this.order,
  });

  Category.fromMap(String id, Map data) {
    uid = id ?? '';
    title = data['title'] ?? '';
    order = data['key'] ?? '';
    order = data['icon'] ?? '';
    order = data['order'] ?? '';
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'title': title,
      'key': key,
      'icon': icon,
      'order': order,
    };
  }

  static collection() {
    return 'categorys';
  }
}
