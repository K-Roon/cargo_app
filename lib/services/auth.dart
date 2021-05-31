import 'dart:html';

import 'package:cargo_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

///사용자의 인증 기능을 담당합니다.
///로그인/아웃 등 기본기능부터 구글 연동 로그인(예정)까지 다뤄 보안상으로 매우 중요합니다.
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ///사용자의 정보가 파이어베이스로부터 존재하는지 묻습니다. 없는 경우 null 값을 반환합니다.
  // ignore: deprecated_member_use
  ModelsUser _userFromFirebaseUser(User user) {
    return user != null ? ModelsUser(uid: user.uid) : null;
  }

  ///가장 일반적인 방식인 이메일 및 비밀번호로 로그인 하는 방식 입니다.
  ///email 및 password를 String 값으로 받아옵니다.
  ///옳지 않은 값이 있는 경우 null 값을 반환합니다.
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      //return _userFromFirebaseUser(user);
      return null;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  Future signInWithCredential(Credential credential) async {
    //_auth.signInWithPhoneNumber(phoneNumber);
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
      //return _userFromFirebaseUser(user);
      return null;
    } catch (e) {
      print("에러: ${e.toString()}");
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
      print(e.toString());
      return null;
    }
  }
}
