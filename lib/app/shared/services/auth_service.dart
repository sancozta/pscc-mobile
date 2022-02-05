import 'package:pscc/app/shared/models/contact.dart';
import 'package:pscc/app/shared/models/user_local.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final GoogleSignIn google = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore database = FirebaseFirestore.instance;

  bool network;

  Future<User> getGoogleLogin() async {
    try {
      final GoogleSignInAccount googleUser = await google.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userResult = await auth.signInWithCredential(credential);
      final User user = userResult.user;
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<String> getToken() async {
    try {
      String token;
      await getUserFire().getIdToken().then((data) {
        token = data;
      });
      return token;
    } catch (e) {
      throw e;
    }
  }

  User getUserFire() {
    try {
      return FirebaseAuth.instance.currentUser;
    } catch (e) {
      throw e;
    }
  }

  Future getLogout() async {
    try {
      await auth.signOut();
      await google.signOut();
      return true;
    } catch (e) {
      throw e;
    }
  }

  Future<User> selectUserEmailPassword(String email, String password) async {
    try {
      final UserCredential userResult = await auth.signInWithEmailAndPassword(email: email, password: password);
      final User user = userResult.user;
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<UserCredential> insertUserEmailPassword(String email, String password) async {
    try {
      return await auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw e;
    }
  }

  recoverPassword(String email) {
    auth.sendPasswordResetEmail(email: email);
  }

  Future insertUser(UserLocal data) {
    try {
      return database.collection(UserLocal.collection()).doc(data.uid).set(data.toMap());
    } catch (e) {
      throw e;
    }
  }

  Future updateUser(UserLocal data) {
    try {
      return database.collection(UserLocal.collection()).doc(data.uid).update(data.toMap());
    } catch (e) {
      throw e;
    }
  }

  Future<UserLocal> selectUser(String uid) {
    try {
      return database.collection(UserLocal.collection()).doc(uid).get().then((d) async {
        return UserLocal.fromMap(d.id, d.data());
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<UserLocal>> selectUsers() {
    try {
      return database.collection(UserLocal.collection()).get().then((d) {
        return d.docs.map((u) => UserLocal.fromMap(u.id, u.data())).toList();
      });
    } catch (e) {
      throw e;
    }
  }

  Future<void> deleteUser(String uid) {
    try {
      return database.collection(UserLocal.collection()).doc(uid).delete();
    } catch (e) {
      throw e;
    }
  }

  Future<bool> isExistCpf(String cpf, {bool ignoreCpfUserLogged = false}) async {
    try {
      bool exist = await database
          .collection(UserLocal.collection())
          .where(
            'cpf',
            isEqualTo: cpf,
          )
          .get()
          .then((d) async {
        if (d.docs.length > 0) {
          if (ignoreCpfUserLogged) {
            User userLogged = FirebaseAuth.instance.currentUser;
            bool cpfOfUserLogged = false;
            d.docs.asMap().forEach((i, a) {
              if (a.id == userLogged.uid) {
                cpfOfUserLogged = true;
              }
            });
            return !cpfOfUserLogged;
          }
          return true;
        } else {
          return false;
        }
      });
      return exist;
    } catch (e) {
      throw e;
    }
  }

  Future<List<UserLocal>> selectUserByCpf(String cpf) {
    try {
      return database.collection(UserLocal.collection()).where('cpf', isEqualTo: cpf).get().then((d) {
        return d.docs.map((u) => UserLocal.fromMap(u.id, u.data())).toList();
      });
    } catch (e) {
      throw e;
    }
  }

  Future<Contact> getContacts() {
    try {
      return database.collection('info').doc('contacts').get().then((d) {
        return Contact.fromMap(d.data());
      });
    } catch (e) {
      throw e;
    }
  }
}
