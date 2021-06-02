

import 'package:cargo_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

///사용자의 인증 기능을 담당합니다.
///로그인/아웃 등을 다뤄 보안상으로 매우 중요합니다.
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ///사용자의 정보가 파이어베이스로부터 존재하는지 묻습니다. 없는 경우 null 값을 반환합니다.
  // ignore: deprecated_member_use
  ModelsUser _userFromFirebaseUser(User user) {
    return user != null ? ModelsUser(uid: user.uid) : null;
  }

  ///가장 일반적인 방식인 이메일 및 비밀번호로 가입 하는 방식 입니다.
  ///email 및 password를 String 값으로 받아옵니다.
  ///이미 가입되어있는 이메일로 가입을 한 경우 null 값을 반환합니다.
  Future signUpWithEmailAndPassword(String email, String password) async {
    //print("UPLOADING.. : 사용자 정보: $email, $password");
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print("에러: ${e.toString()}");
      return null;
    }
  }

  /// 가장 일반적인 방식인 이메일 및 비밀번호로 로그인 하는 방식입니다.
  ///
  ///그러나!!
  /// Auth 정보에는 이메일과 비밀번호를 등록하지만
  /// 로그인 할 때는 아이디와 비밀번호를 가져오므로,
  ///email 정보는 클라우드-파이어스토어를 통해 가져와야 합니다.
  ///비밀번호가 옳지 않은경우 null 값을 반환합니다.
  Future signInWithAccount(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return null;
    } catch (e) {
      print("ERROR!!:: ${e.toString()}");
      return e.toString();
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("ERROR!!: ${e.toString()}");
      return null;
    }
  }

  Future changeEmail(String email, String newEmail) async {
    try {
      FirebaseAuth.instance.currentUser.updateEmail(newEmail).then((value) {
        print("OK");
      });
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
