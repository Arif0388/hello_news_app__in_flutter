import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newsapplication/controller/all_service_controller.dart';
class TrendingNewsWidget extends StatelessWidget {
  const TrendingNewsWidget({super.key, required this.newsTitle, required this.newsDescription, required this.newsImage, required this.onTap,});
  final String newsTitle;
  final String newsDescription;
  final String newsImage;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    AllServiceController allServiceController = Get.put(AllServiceController());
    return InkWell(
      onTap:onTap,
      child: Container(
        margin:const EdgeInsets.only(top:10,right:5,left:1),
        child: Material(
          borderRadius:BorderRadius.circular(10),
          color:Theme.of(context).colorScheme.primaryContainer,
          elevation:10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:5,vertical:8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ClipRRect(
                      borderRadius:BorderRadius.circular(10),
                      child:CachedNetworkImage(width:150,height:120,fit:BoxFit.cover, imageUrl:newsImage,)
                  ),
                ),
                const SizedBox(width:10,),
                Column(
                  children: [
                    Container(
                        width:MediaQuery.of(context).size.width/1.9,
                        child: Text(newsTitle,style: Theme.of(context).textTheme.headlineSmall,maxLines:2,)
                    ),
                    const SizedBox(height:5,),
                    Container(
                        width:MediaQuery.of(context).size.width/1.9,
                        child: Text(newsDescription,style: Theme.of(context).textTheme.labelMedium,maxLines:4,)
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}