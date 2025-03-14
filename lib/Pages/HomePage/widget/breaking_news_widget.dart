
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget breakingNewsWidget(String image,String name,int index,BuildContext context,VoidCallback onTap){
  return InkWell(
    onTap:onTap,
    child: Container(
      margin:const EdgeInsets.symmetric(horizontal:5.0),
      child:Stack(
        children: [
          ClipRRect(
              borderRadius:BorderRadius.circular(10),
              child:CachedNetworkImage(fit:BoxFit.cover,width:MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height, imageUrl:image,)
          ),
          Container(
            height:100,
            padding:const EdgeInsets.only(left:10),
            margin:const EdgeInsets.only(top:120),
            width:MediaQuery.of(context).size.width,
            decoration:const BoxDecoration(
              borderRadius:BorderRadius.only(bottomLeft:Radius.circular(10),bottomRight:Radius.circular(10)),
              color:Colors.black26,
            ),
            child:Text(name,style:Theme.of(context).textTheme.bodyLarge,maxLines:2,),
          ),
        ],
      ),
    ),
  );
}