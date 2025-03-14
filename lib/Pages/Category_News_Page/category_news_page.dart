import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newsapplication/Pages/Category_News_Page/widget/category_news_widget.dart';
import 'package:newsapplication/controller/all_service_controller.dart';

import '../Web_View_Page/web_view_page.dart';
import '../Widget/search_widget.dart';

class CategoryNewsPage extends StatefulWidget {
  const CategoryNewsPage({super.key, required this.newsCategoryName});
 final String newsCategoryName;

  @override
  State<CategoryNewsPage> createState() => _CategoryNewsPageState();
}

class _CategoryNewsPageState extends State<CategoryNewsPage> {
  AllServiceController allServiceController = Get.put(AllServiceController());
  @override
  void initState(){
    super.initState();
    setState(() {
      allServiceController.allCategoryNews(widget.newsCategoryName.toLowerCase());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle:true,
        title:Obx(() => allServiceController.isSearch.value? SearchWidget(onChanged: (value) {

        },
        ) : Text(widget.newsCategoryName,style:Theme.of(context).textTheme.headlineSmall)),
        elevation:1,
        actions: [
          Obx(() =>
          allServiceController.isSearch.value? const Text('') : IconButton(onPressed: (){
            allServiceController.isSearch.value = true;
          }, icon:const Icon(Icons.search)),
          )
        ],
      ),
      body:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Obx(() =>
          allServiceController.isLoading.value?const Center(child: CupertinoActivityIndicator()) :  Expanded(
            child:
            ListView.builder(
              shrinkWrap:true,
              physics:const PageScrollPhysics(),
              itemCount:allServiceController.allCategoryNewsList.length,
              itemBuilder:(context, index) {
                return CategoryNewsWidget(
                    newsImage:allServiceController.allCategoryNewsList[index].urlToImage!,
                    newsTitle:allServiceController.allCategoryNewsList[index].title!,
                    newsDesc:allServiceController.allCategoryNewsList[index].description!,
                  onTap: () {
                    Get.to(WebViewPage(blogUrl:allServiceController.allCategoryNewsList[index].url!));
                  },
                );
              },
            ),
          ),
          )

        ],
      ),
    );
  }
}
