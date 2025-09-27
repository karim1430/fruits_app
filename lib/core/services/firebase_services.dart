abstract class FirebaseServices {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? uId,
  });

  Future<dynamic> getData({
    required String path,
    String? uId,
    Map<String, dynamic>? quary,
  });
  Future<bool> checkIfUserExist({required String path, required String uId});
}
