import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../Config/assets_path.dart';

class CategoryNewsWidget extends StatelessWidget {
  const CategoryNewsWidget({super.key, required this.newsImage, required this.newsTitle, required this.newsDesc, required this.onTap});
  final String newsImage;
  final String newsTitle;
  final String newsDesc;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onTap,
      child: Container(
        padding:const EdgeInsets.all(5),
        margin:const EdgeInsets.all(5),
        decoration:BoxDecoration(
            borderRadius:BorderRadius.circular(10),
            color:Theme.of(context).colorScheme.primaryContainer
        ),
        child:Column(
          children: [
            SizedBox(
                child: ClipRRect(
                    borderRadius:BorderRadius.circular(10),
                    child:CachedNetworkImage(fit:BoxFit.cover,width:370,height:160, imageUrl:newsImage,)
                )
            ),
            Text(style:Theme.of(context).textTheme.headlineSmall,maxLines:2,newsTitle),
            const SizedBox(height:6),
            Text(maxLines:5,style:Theme.of(context).textTheme.labelMedium,newsDesc)
          ],
        ),
      ),
    );
  }
}
