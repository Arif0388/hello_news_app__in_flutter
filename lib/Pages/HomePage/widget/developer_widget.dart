
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapplication/Config/assets_path.dart';

class DeveloperInfoDialog extends StatelessWidget {
  const DeveloperInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('About the Developer'),
      content:Row(
        children: [
          ClipRRect(
              borderRadius:BorderRadius.circular(40),
              child: Image.asset(AssetsPath.developerImage,width:80,height:50,)),
          const SizedBox(width:12),
          Container(
            width:Get.width/2.3,
            child:Text(
              'This app was created by Arif Ansari, a passionate Flutter developer',
              style:Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Close'),
          onPressed: () {
           Get.back();
          },
        ),
      ],
    );
  }
}

