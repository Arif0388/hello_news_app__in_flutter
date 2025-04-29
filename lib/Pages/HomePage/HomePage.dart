import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapplication/Pages/Breaking_News_Page/breaking_news_page.dart';
import 'package:newsapplication/Pages/Category_News_Page/category_news_page.dart';
import 'package:newsapplication/Pages/HomePage/widget/breaking_news_widget.dart';
import 'package:newsapplication/Pages/HomePage/widget/category_tile_widget.dart';
import 'package:newsapplication/Pages/HomePage/widget/developer_widget.dart';
import 'package:newsapplication/Pages/HomePage/widget/heading_widget.dart';
import 'package:newsapplication/Pages/HomePage/widget/trending_news_widget.dart';
import 'package:newsapplication/Pages/Web_View_Page/web_view_page.dart';
import 'package:newsapplication/controller/all_service_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Trending_News_Page/trending_news_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AllServiceController allServiceController = Get.put(AllServiceController());
    return Scaffold(
      appBar:AppBar(
        actions: [
         IconButton(onPressed: (){
           showDialog(
               context:context,
               builder: (BuildContext context) {
                 return const DeveloperInfoDialog();
               }
           );
         }, icon:const Icon(Icons.info_outline_rounded)),
        ],
        elevation:0.0,
        centerTitle:true,
        title:const Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [Text('Quick'),Text(' News',style:TextStyle(color:Colors.blue,fontWeight:FontWeight.bold),)],)
      ),
      body:Padding(
        padding: const EdgeInsets.only(top:10,right:5,left:5),
        child: ListView(
          children:[
            Column(
              children: [
                //......CategoryNewsTile........
                   Obx(() =>
                       SizedBox(
                         height:90,
                         child: ListView.builder(
                           shrinkWrap:true,
                           scrollDirection:Axis.horizontal,
                           itemCount:allServiceController.newsCategory.length,
                           itemBuilder:(context, index) {
                             return CategoryTile(
                               categoryImage:allServiceController.newsCategory[index].categoryImage!,
                               categoryName:allServiceController.newsCategory[index].categoryName!,
                               onTap: () {
                                 allServiceController.allCategoryNews(allServiceController.newsCategory[index].categoryName!);
                                 Get.to(CategoryNewsPage(newsCategoryName:allServiceController.newsCategory[index].categoryName!,));
                               },
                             );
                           },
                         ),
                       )),
                //.........breaking news..........
                HeadingWidget(
                    titleHeading:'Breaking News',
                    onTap:(){
                      Get.to(const BreakingNewsPage());
                    },
                    buttonText:'View All'
                ),
                const SizedBox(height:10),
                CarouselSlider.builder(
                    itemCount:5,
                    itemBuilder:(context, index, realIndex) {
                   return breakingNewsWidget(
                       allServiceController.breakingNewsList[index].urlToImage! ?? '',
                       allServiceController.breakingNewsList[index].title!, index,context,
                           (){
                             Get.to(WebViewPage(blogUrl:allServiceController.breakingNewsList[index].url!));
                           }
                   );
                },
                    options:CarouselOptions(
                      autoPlay:true,
                      enlargeCenterPage:true,
                      enlargeStrategy:CenterPageEnlargeStrategy.height,
                      aspectRatio:2,
                      onPageChanged:(index, reason) {
                        allServiceController.slideValue.value = index;
                    },
                    )
                ),
                const SizedBox(height:15),


             // ....SmoothIndicator..........
             Obx(() =>SmoothPageIndicator(
                 controller:PageController(
                   initialPage:allServiceController.slideValue.value),
                   count:5,
               effect:const WormEffect(
                 type:WormType.thinUnderground,
                 activeDotColor:Colors.greenAccent,
                 dotColor:Colors.white54,
                 dotHeight:8,
                 paintStyle:PaintingStyle.stroke
               ),
                )),
                //........trending news.........
                HeadingWidget(titleHeading:'Trending News!',onTap:(){Get.to(const TrendingNewsPage());}, buttonText:'View All'),
                    Obx(() =>
                       allServiceController.isLoading.value?const CupertinoActivityIndicator() : Container(
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap:true,
                                physics:const PageScrollPhysics(),
                                itemCount:allServiceController.trendingNewsList.length,
                                itemBuilder:(context, index) {
                                  return   TrendingNewsWidget(
                                    newsTitle:allServiceController.trendingNewsList[index].title!,
                                    newsDescription: allServiceController.trendingNewsList[index].description!,
                                    newsImage:allServiceController.trendingNewsList[index].urlToImage!,
                                    onTap: () {
                                      Get.to(WebViewPage(blogUrl:allServiceController.trendingNewsList[index].url!));
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        )),
              ],
            ),
      ]
        ),
      ),
    );
  }
}