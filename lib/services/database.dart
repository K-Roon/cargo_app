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

  ///사용자의 이름으로 검색
  getUserByUsername(String username) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("name", isGreaterThanOrEqualTo: username)
        .get();
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


  ///사용자의 친구 목록을 얻어옴.
  getFriends(String userId) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .collection("friends")
        .orderBy("friendName", descending: false)
        .snapshots();
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

  ///사용자가 초대되어있는 대화방 모두 불러오기
  getChatRooms(String userId) async {
    return await FirebaseFirestore.instance
        .collection("ChatRoom")
        .where("users", arrayContains: userId)
        .snapshots();
  }

  ///친구추가
  addFriends(String userId, friendMap, bool hasConvRoom, String oneChatRoomId) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(Constants.myId)
        .collection("friends")
        .doc(userId)
        .set(friendMap);
  }

}
