import 'package:food_delivery/controller/popular_book_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/popular_book_repo.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';

import '../controller/recommended_book_controller.dart';
import '../data/repository/recommended_book_repo.dart';

Future<void> init() async{

  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.Base_Url));

  Get.lazyPut(()=>PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));


  Get.lazyPut(()=>PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));


}