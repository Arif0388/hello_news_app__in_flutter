import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:newsapplication/Models/all_category_news_model.dart';
import 'package:newsapplication/Models/trending_news_model.dart';

import '../Config/assets_path.dart';
import '../Models/breaking_news_model.dart';
import '../Models/category_news_model.dart';
import 'package:http/http.dart' as http;

import '../Models/hindi_news_model.dart';
class AllServiceController extends GetxController{

  @override
  void onInit(){
    super.onInit();
    trendingNews();
    breakingNews();
    trendingHindiNews();
  }
  RxList<CategoryNewsModel> newsCategory =<CategoryNewsModel> [
    CategoryNewsModel(
        categoryName:'Business',
        categoryImage:AssetsPath.businessImage
    ),
    CategoryNewsModel(
        categoryName:'Sports',
        categoryImage:AssetsPath.sportsImage
    ),
    CategoryNewsModel(
        categoryName:'Science',
        categoryImage:AssetsPath.scienceImage
    ),
    CategoryNewsModel(
        categoryName:'Health',
        categoryImage:AssetsPath.healthImage
    ),
    CategoryNewsModel(
        categoryName:'General',
        categoryImage:AssetsPath.generalImage
    ),
  ].obs;
  RxList<BreakingNewsModel> breakingNewsList =<BreakingNewsModel>[].obs;
  List<TrendingNewsModel> trendingNewsList = <TrendingNewsModel>[].obs;
  List<HindiNewsModel> hindiNewsList = [];
  RxList<AllCategoryNewsModel> allCategoryNewsList =<AllCategoryNewsModel>[].obs;
  RxInt slideValue =0.obs;
  RxBool isLoading = false.obs;
  RxBool isSearch = false.obs;

  //......for trending news.....
  String trendingNewsUrl = 'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=0321e45667514b32bf13f530aa35b3b7';
  String hindiNewsUrl = 'https://bbc-api.vercel.app/news?lang=hindi';

  //......for breaking news.....
  String breakingNewsUrl = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=0321e45667514b32bf13f530aa35b3b7';



  Future<void> trendingNews()async{
     isLoading.value = true;
    final response = await http.get(Uri.parse(trendingNewsUrl));
    var data = jsonDecode(response.body);
    if(response.statusCode==200)
    {
      data['articles'].forEach((e){
        if(e['urlToImage'] !=null && e['description'] !=null)
        {
          var allNews = TrendingNewsModel(
            author:e['author'],
            content:e['content'],
            description:e['description'],
            publishedAt:e['publishedAt'],
            title:e['title'],
            url:e['url'],
            urlToImage:e['urlToImage']
          );
          trendingNewsList.add(allNews);
        }
      });
    }
     isLoading.value = false;
  }


  Future<void> breakingNews()async{
     isLoading.value = true;
    final response = await http.get(Uri.parse(breakingNewsUrl));
    var data = jsonDecode(response.body);
    if(response.statusCode==200)
    {
      data['articles'].forEach((e){
        if(e['urlToImage'] !=null && e['description'] !=null)
        {
          var allNews = BreakingNewsModel(
            author:e['author'],
            content:e['content'],
            description:e['description'],
            publishedAt:e['publishedAt'],
            title:e['title'],
            url:e['url'],
            urlToImage:e['urlToImage']
          );
          breakingNewsList.add(allNews);
        }
      });
    }
     isLoading.value = false;
  }


  Future<void> allCategoryNews(String categoryName)async{
    String allCategoryNewsUrl = 'https://newsapi.org/v2/top-headlines?country=us&category=$categoryName&apiKey=0321e45667514b32bf13f530aa35b3b7';
    isLoading.value = true;
    final response = await http.get(Uri.parse(allCategoryNewsUrl));
    var data = jsonDecode(response.body);
    if(response.statusCode==200)
    {
      allCategoryNewsList.clear();
      data['articles'].forEach((e){
        if(e['urlToImage'] !=null && e['description'] !=null)
        {
          var allNews = AllCategoryNewsModel(
              author:e['author'],
              content:e['content'],
              description:e['description'],
              publishedAt:e['publishedAt'],
              title:e['title'],
              url:e['url'],
              urlToImage:e['urlToImage']
          );
          allCategoryNewsList.add(allNews);
        }
      });
    }
    isLoading.value = false;
  }

  Future<void> trendingHindiNews()async{
    isLoading.value = true;
    final response = await http.get(Uri.parse(hindiNewsUrl));
    var data = jsonDecode(response.body);
    if(response.statusCode==200)
    {
      data['प्रमुख समाचार'].forEach((e){
        if(e['image_link'] !=null && e['summary'] !=null)
        {
          var allNews = HindiNewsModel(
            title:e['title'],
            description: e['summary'],
            imageUrl:e['image_link'],
            newsUrl: e['news_link']
          );
          hindiNewsList.add(allNews);
        }
      });
    }
    isLoading.value = false;
  }

  Future<void> searchBreakingNews(String search)async{
    try{
      String sbreakingNewsUrl = 'https://newsapi.org/v2/everything?q=$search&sources=techcrunch&apiKey=0321e45667514b32bf13f530aa35b3b7';
      isLoading.value = true;
      final response = await http.get(Uri.parse(sbreakingNewsUrl));
      if(response.statusCode == 200)
      {
        breakingNewsList.clear();
        var body = jsonDecode(response.body);
        var articles = body['articles'];
        int i = 0;
        for(var news in articles)
        {
          i++;
           var allSearchNews = BreakingNewsModel(
             description:news['description']??'',
             author:news['author']??'',
             content:news['content']??'',
             publishedAt:news['publishedAt']??'',
             title:news['title']??'',
             url:news['url']??'',
             urlToImage:news['urlToImage']??''
           );
          breakingNewsList.add(allSearchNews);
          if(i==10)
          {
            break;
          }
        }
      }
      else
      {
        print('Something Went Wrong');
      }
    }catch(e)
    {
      if (kDebugMode) {
        print(e);
      }
    }
    isLoading.value =false;
  }

  Future<void> searchTrendingNews(String search)async {
    try{
      String strendingNewsUrl = 'https://newsapi.org/v2/everything?q=$search&domains=wsj.com&apiKey=0321e45667514b32bf13f530aa35b3b7';
      isLoading.value = true;
      final response = await http.get(Uri.parse(strendingNewsUrl));
      if(response.statusCode == 200)
      {
        trendingNewsList.clear();
        var body = jsonDecode(response.body);
        var articles = body['articles'];
           int i=0;
         for(var news in articles){
           var allSearchNews = TrendingNewsModel(
               description: news['description']??'',
               author: news['author']??'',
               content: news['content']??'',
               publishedAt: news['publishedAt']??'',
               title: news['title']??'',
               url: news['url']??"",
               urlToImage: news['urlToImage']??''
           );
           trendingNewsList.add(allSearchNews);
           if(i==10){break;}
         }
      }
      else
      {
        print('Something Went Wrong');
      }
    }catch(e)
    {
      if (kDebugMode) {
        print(e);
      }
    }
    isLoading.value =false;
  }

  Future<void> searchNews(String query) async {
    // Update the URL to use the 'q' parameter for search
    String searchNewsUrl = 'https://newsapi.org/v2/everything?q=$query&apiKey=0321e45667514b32bf13f530aa35b3b7';

    // Set loading state to true while fetching data
    isLoading.value = true;

    // Make the HTTP GET request
    final response = await http.get(Uri.parse(searchNewsUrl));

    // Parse the response JSON
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // Clear any previous news data
      allCategoryNewsList.clear();

      // Iterate through the articles in the response
      data['articles'].forEach((e) {
        // Check if both urlToImage and description are not null
        if (e['urlToImage'] != null && e['description'] != null) {
          // Create an AllCategoryNewsModel object for each article
          var allNews = AllCategoryNewsModel(
              author: e['author'],
              content: e['content'],
              description: e['description'],
              publishedAt: e['publishedAt'],
              title: e['title'],
              url: e['url'],
              urlToImage: e['urlToImage']
          );

          // Add the created model object to the list
          allCategoryNewsList.add(allNews);
        }
      });
    }

    // Set loading state to false after fetching the data
    isLoading.value = false;
  }

}