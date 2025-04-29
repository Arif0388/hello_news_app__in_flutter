import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapplication/Config/assets_path.dart';
import 'package:newsapplication/Pages/AuthPage/signup_page.dart';
import 'package:newsapplication/Pages/HomePage/HomePage.dart';
import 'package:newsapplication/controller/all_service_controller.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    AllServiceController allServiceController = Get.put(AllServiceController());
    return Scaffold(
        body:Container(
          margin:const EdgeInsets.all(5),
          child:Column(
            children: [
              ClipRRect(
                  borderRadius:BorderRadius.circular(20),
                  child: Image.asset(AssetsPath.welcomeImage,width:MediaQuery.of(context).size.width,height:450,fit:BoxFit.cover,)),
              const SizedBox(height:30),
              Text('News from around the\n            world for you',style:Theme.of(context).textTheme.headlineLarge,),
              const SizedBox(height:30),
              Text('Best time to read, take your time to read\n                 a little more of this world ',style:Theme.of(context).textTheme.labelLarge,),
              const SizedBox(height:100),
              PrettyFuzzyButton(
                label:'Get Started', onPressed:(){
                  allServiceController.trendingNews();
                  allServiceController.breakingNews();
                  allServiceController.trendingHindiNews();;
                Get.offAll(const SignupPage());
              },
              ),
            ],
          ),
        ),
    );
  }
}
