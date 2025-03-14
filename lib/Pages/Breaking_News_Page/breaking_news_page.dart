
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapplication/Config/assets_path.dart';
import 'package:newsapplication/Pages/Breaking_News_Page/widget/breaking_news_widget.dart';
import 'package:newsapplication/Pages/Web_View_Page/web_view_page.dart';
import 'package:newsapplication/Pages/Widget/search_widget.dart';
import 'package:newsapplication/controller/all_service_controller.dart';

import '../HomePage/widget/trending_news_widget.dart';

class BreakingNewsPage extends StatelessWidget {
  const BreakingNewsPage({super.key});
  @override
  Widget build(BuildContext context) {
    AllServiceController allServiceController = Get.put(AllServiceController());
    return Scaffold(
      appBar:AppBar(
        centerTitle:true,
        title:Obx(() => allServiceController.isSearch.value? SearchWidget(onChanged: (value) {
               allServiceController.searchBreakingNews(value);
                  },
        ) : Text('Breaking News!',style:Theme.of(context).textTheme.headlineSmall)),
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
        children: [
          Expanded(
            child: Obx(() =>
                ListView.builder(
                  shrinkWrap:true,
                  physics:const PageScrollPhysics(),
                  itemCount:allServiceController.breakingNewsList.length,
                  itemBuilder:(context, index) {
                    return BreakingNewsWidget(
                      newsImage:allServiceController.breakingNewsList[index].urlToImage!,
                      newsTitle:allServiceController.breakingNewsList[index].title!,
                      newsDesc:allServiceController.breakingNewsList[index].description!,
                      onTap: () {
                        Get.to(WebViewPage(blogUrl:allServiceController.breakingNewsList[index].url!));
                      },
                    );
                  },
                ),
            )
          ),
        ],
      )
    );
  }
}
