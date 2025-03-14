
import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({super.key, required this.titleHeading,required this.onTap, required this.buttonText});
  final String titleHeading;
  final VoidCallback onTap;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
    margin:const EdgeInsets.symmetric(horizontal:3,vertical:10),
      child:Padding(
        padding: const EdgeInsets.only(left:3),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Text(titleHeading,style:Theme.of(context).textTheme.labelLarge?.copyWith(color:Colors.white)),
            InkWell(
              focusColor:Colors.transparent,
              highlightColor:Colors.transparent,
              hoverColor:Colors.transparent,
              splashColor:Colors.transparent,
              onTap:onTap,
              child: Card(
                color:Colors.white12,
                child: Container(
                  padding:const EdgeInsets.all(8),
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(15),
                  ),
                  child:Text(buttonText,style:Theme.of(context).textTheme.labelMedium?.copyWith(color:Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
