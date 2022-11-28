import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:push_notification_practice/models/user_model.dart';
import 'package:push_notification_practice/services/firebase_auth_service.dart';

class FireStoreService {
  //* SINGELTON
  //?====================================
  static final FireStoreService _singleton = FireStoreService._internal();
  factory FireStoreService() {
    return _singleton;
  }
  FireStoreService._internal();

  //* INITILIZING FIREBASE FIELDS
  //?====================================
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

//?=====================================================================
//*=================== User Side Queries //////////////////////////////
//?=====================================================================

  //! ADD USER DETAILS
  Future<bool> addUserDetial(UserModel model, String uid) async {
    try {
      model.user_id = uid;

      await _users.doc(uid).set(model.toMap());
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  //! GET USER
  Future getUser() async {
    try {
      String uid = await AuthServices().getCurrentUserID();
      var documentReference = await _users.doc(uid).get();

      if (documentReference.data() == null) {
        print("is null");
      }

      return UserModel.fromMap(
          documentReference.data() as Map<String, dynamic>);
    } on Exception catch (e) {
      return e.toString();
    }
  }
}
