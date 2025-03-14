
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, required this.categoryImage, required this.categoryName, required this.onTap});
final String categoryImage;
final String categoryName;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        margin:const EdgeInsets.only(right:7),
        child:Stack(
          children: [
            ClipRRect(
                borderRadius:BorderRadius.circular(12),
                child:Image.asset(width:150,fit:BoxFit.cover,categoryImage,)),
            Container(
                width:150,
                height:90,
              decoration:const BoxDecoration(
                color:Colors.black38
              ),
                child: Center(child: Text(categoryName,style:Theme.of(context).textTheme.bodyLarge,))),
          ],
        ),
      ),
    );
  }
}
