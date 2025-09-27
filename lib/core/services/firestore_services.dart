import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/services/firebase_services.dart';

class FirestoreServices extends FirebaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? uId,
  }) {
    if (uId != null) {
      return firestore.collection(path).doc(uId).set(data);
    } else {
      return firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? uId,
    Map<String, dynamic>? quary,
  }) async {
    if (uId != null) {
      var data = await firestore.collection(path).doc(uId).get();
      return data.data() ?? {};
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (quary != null) {
        if (quary['orderBy'] != null) {
          var orderBy = quary['orderBy'];
          var des = quary['descending'];
          data.orderBy(orderBy, descending: des);
        }
        if (quary['limit'] != null) {
          var limit = quary['limit'];
          data.limit(limit);
        }
      }
      var result = await data.get();
      List<Map<String, dynamic>> products = result.docs
          .map((e) => e.data())
          .toList();
      return products;
    }
  }

  @override
  Future<bool> checkIfUserExist({
    required String path,
    required String uId,
  }) async {
    var user = await firestore.collection(path).doc(uId).get();
    return user.exists;
  }
}
