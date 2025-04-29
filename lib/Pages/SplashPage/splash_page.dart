import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapplication/Pages/AuthPage/signup_page.dart';
import 'package:newsapplication/Pages/HomePage/HomePage.dart';
import 'package:newsapplication/Pages/WelcomePage/WelcomePage.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    Future.delayed(const Duration(seconds:3),(){
      if(auth.currentUser!=null){
        Get.offAll(const HomePage());
      }else{
        Get.offAll(const WelcomePage());
      }
    });

    return Scaffold(
      body:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Container(),
          const CircleAvatar(
            radius:50,
            backgroundColor:Colors.black26,
            backgroundImage:AssetImage('assets/Images/hot-news.png'),
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text('Quick',style:Theme.of(context).textTheme.bodyLarge?.copyWith(color:Colors.pinkAccent)),
              const SizedBox(width:10),
              Text('News',style:Theme.of(context).textTheme.bodyLarge?.copyWith(color:Colors.cyan)),
            ],
          ),
        ],
      ),
    );
  }
}
