
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_project/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  UserKnowy _userFromFirebaseUser(User user) {
    return user != null ? UserKnowy(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<UserKnowy> get user {
    return _auth.authStateChanges()
      //.map((FirebaseUser user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
  }
  //en son yaptığımız signInWithEmailAndPassword fonksiyonunu  yorum olarak ekledim
  
  /*
  Future signInWithEmilAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .catchError((e) => print("bikem"));
      final FirebaseUser user = result.user;
      print(user.uid);
      if (user.providerData == null) {
        print("sdlfsdfsdf");
      }
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
  */

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}
