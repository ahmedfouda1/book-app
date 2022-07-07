import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_book_controller.dart';
import 'package:food_delivery/pages/home/main_book_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';
import 'controller/recommended_book_controller.dart';
import 'helper/dependancies.dart'as dep;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  MainFoodPage(),
      //initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
