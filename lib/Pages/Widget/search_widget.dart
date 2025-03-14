import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapplication/controller/all_service_controller.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, required this.onChanged});
  final ValueChanged onChanged;
  @override
  Widget build(BuildContext context) {
    AllServiceController allServiceController  = Get.put(AllServiceController());
    return Container(
      child:TextFormField(
        onChanged:onChanged,
        style:Theme.of(context).textTheme.labelMedium,
        decoration:InputDecoration(
          labelText:'Search.....',
          labelStyle:Theme.of(context).textTheme.labelMedium,
          suffixIcon:InkWell(
              onTap:(){
              allServiceController.isSearch.value = false;
              },
              child: const Icon(Icons.highlight_remove_rounded,size:22,))
        ),
      ),
    );
  }
}
