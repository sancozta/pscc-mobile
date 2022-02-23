import 'package:pscc/app/shared/models/account.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountService {
  final FirebaseFirestore database = FirebaseFirestore.instance;

  Future<Account> selectById(String? uid) {
    try {
      return database.collection(Account.collection()).doc(uid).get().then((d) async {
        return Account.fromMap(d.id, d.data() ?? {});
      });
    } catch (e) {
      rethrow;
    }
  }

  Future insert(Account data) {
    try {
      return database.collection(Account.collection()).doc(data.uid).set(data.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future update(Account data) {
    try {
      return database.collection(Account.collection()).doc(data.uid).update(data.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(String uid) {
    try {
      return database.collection(Account.collection()).doc(uid).delete();
    } catch (e) {
      rethrow;
    }
  }
}
