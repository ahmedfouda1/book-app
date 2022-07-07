import 'package:food_delivery/pages/food/popular_book_details.dart';
import 'package:food_delivery/pages/food/recommended_book_details.dart';
import 'package:food_delivery/pages/pdf_page.dart';
import 'package:get/get.dart';


class RouteHelper{

  static const String initial ="/";
  static const String popularFood ="/popular-food";
  static const String recommendedFood ="/recommended-food";
  static const String pdfPage ="/pdf-page";


  static  String getInitial ()=>"$initial";
  static  String getPopularFood (int pageId,String page)=>"$popularFood?pageId=$pageId&page=$page";
  static  String getRecommendedFood(int pageId,String page)=>"$recommendedFood?pageId=$pageId&page=$page";
  static  String getPdfPage(int pageId,String page)=>"$pdfPage?pageId=$pageId&page=$page";

  static List<GetPage> routes =[


    GetPage(name: popularFood, page: () {
      var pageId =Get.parameters['pageId'];

      return PopularFoodDetails(pageId: int.parse(pageId!),);

    },
    transition: Transition.fadeIn,
    ),
    GetPage(name: recommendedFood, page: () {

      var pageId =Get.parameters['pageId'];
      return RecommendedFoodDetails(pageId: int.parse(pageId!));

    },
      transition: Transition.fadeIn,
    ),
    GetPage(name: pdfPage, page: () {
    var pageId =Get.parameters['pageId'];
    return PdfPage(pageId: int.parse(pageId!),);

    },
      transition: Transition.fadeIn,
    ),
  ];

}