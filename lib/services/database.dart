import 'package:cargo_app/helper/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {

  ///새로운 사용자 파이어베이스에 저장
  uploadUserInfo(String userId, userMap) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userMap)
        .catchError((e) {
      print("에러!: ${e.toString()}");
    });
  }

  ///중복되는 ID를 봅니다.
  ///Null 값을 받아오는지 단순히 체크하기 위함이므로,
  ///사실상 TEST 코드입니다.
  Future getDuplicateId(String userId) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .where("userId", isEqualTo: userId)
          .get();
      return null;
    } catch (e) {
      print("ERROR: ${e.toString()}");
      return e;
    }
  }

  getEmailById(String userId) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("userId", isEqualTo: userId)
        .get();
  }

  Future getUserInfoDB(String userId) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("userId", isEqualTo: userId)
        .get();
  }

  Future getUserInfoWithPhoneNum(String phoneNum) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("phonenum", isEqualTo: phoneNum)
        .get();
  }

  ///사용자 정보 업데이트
  changeNewInfo(String newInfoCategory, String newInfo) {
    FirebaseFirestore.instance.collection("users").doc(Constants.myId).update({
      newInfoCategory: newInfo
    });
  }

  ///사용자 정보 업데이트(부울)
  changeNewInfoBool(String newInfoCategory, bool newInfo) {
    FirebaseFirestore.instance.collection("users").doc(Constants.myId).update({
      newInfoCategory: newInfo
    });
  }

}
