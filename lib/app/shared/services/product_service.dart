import 'package:pscc/app/shared/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final FirebaseFirestore database = FirebaseFirestore.instance;

  Future<List<Product>> selectAll() {
    try {
      return database.collection(Product.collection()).get().then((d) {
        return d.docs.map((u) => Product.fromMap(u.id, u.data())).toList();
      });
    } catch (e) {
      throw e;
    }
  }

  Future<Product> selectById(String uid) {
    try {
      return database.collection(Product.collection()).doc(uid).get().then((d) async {
        return Product.fromMap(d.id, d.data());
      });
    } catch (e) {
      throw e;
    }
  }

  Future insert(Product data) {
    try {
      return database.collection(Product.collection()).doc(data.uid).set(data.toMap());
    } catch (e) {
      throw e;
    }
  }

  Future update(Product data) {
    try {
      return database.collection(Product.collection()).doc(data.uid).update(data.toMap());
    } catch (e) {
      throw e;
    }
  }

  Future<void> delete(String uid) {
    try {
      return database.collection(Product.collection()).doc(uid).delete();
    } catch (e) {
      throw e;
    }
  }
}
