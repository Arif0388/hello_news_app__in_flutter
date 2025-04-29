import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsapplication/Pages/HomePage/HomePage.dart';

import '../AuthPage/login_page.dart';
import '../WelcomePage/WelcomePage.dart';

class AuthController extends GetxController{
  final auth  = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  RxBool isLoading = false.obs;
  RxBool isVisible = false.obs;
  RxBool isEmailCorrect = false.obs;

  Future<void> signup(String email,String password,String name)async{
  try{
    isLoading.value = true;
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    if(userCredential.user !=null){
      await userCredential.user!.updateDisplayName(name);
      await userCredential.user!.reload();
      print('UserName :${userCredential.user!.displayName}');
      isLoading.value = false;
        Get.to(const LoginPage());

    }else{
      print('Please fill all details');
    }
  }catch(e){
    isLoading.value = false;
    Fluttertoast.showToast(
      msg: "$e",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    }

  }

  Future<void> login(String email,String password)async{
   try{
     isLoading.value = true;
     UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
     if(userCredential.user !=null){
       isLoading.value = false;
       Get.offAll(const HomePage());
     }else{
       print('Please fill all details');
     }
   }catch(e){
     isLoading.value = false;
     Fluttertoast.showToast(
       msg: "$e",
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.CENTER,
       backgroundColor: Colors.black87,
       textColor: Colors.white,
       fontSize: 16.0,
     );
    }
  }

  Future<void> signOut()async{
      // Google account se sign out
      await googleSignIn.signOut();
      // Firebase se sign out
      await auth.signOut();
  Fluttertoast.showToast(
    msg: "SIgn out successful",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    backgroundColor: Colors.black87,
    textColor: Colors.white,
    fontSize: 16.0,
  );
  Get.offAll(const WelcomePage());
  }

  Future<void> forgetPassword(String email)async{
  try{
    isLoading.value = true;
    await auth.sendPasswordResetEmail(email: email);
    Fluttertoast.showToast(
      msg: "Password reset link sent!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    isLoading.value = false;
    Get.to(const LoginPage());
  }catch(e){
    print('Error :$e');
    }
  }

  Future<void> signInWithGoogle()async{
  try{
    EasyLoading.show(status: 'Signing in...');
    final GoogleSignInAccount? googleSignInAccount  = await GoogleSignIn().signIn();

    if (googleSignInAccount == null) {
      EasyLoading.dismiss();
      return;
    }
   final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

   final credential = GoogleAuthProvider.credential(
     idToken: googleSignInAuthentication.idToken,
     accessToken: googleSignInAuthentication.accessToken,
   );

   await auth.signInWithCredential(credential);
   EasyLoading.dismiss();
   Get.offAll(const HomePage());
  }catch(e){
    EasyLoading.dismiss();
    Fluttertoast.showToast(
      msg: "$e",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    }
  }

}