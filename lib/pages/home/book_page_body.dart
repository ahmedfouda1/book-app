import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/text_widget.dart';
import 'package:get/get.dart';

import '../../controller/recommended_book_controller.dart';
import '../../widgets/icon_and_text_widget.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currentPageValue = 0.0;

  @override
  void initState() {
    pageController.addListener(() {
      setState(() => _currentPageValue = pageController.page!);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GetBuilder<RecommendedProductController>(
          builder: (recommendedProduct) {
            return recommendedProduct.isloaded?Container(
              height: height * 0.3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recommendedProduct.recommendedProductList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getRecommendedFood(index,"home"));
                    },
                    child: Container(
                      height: height * 0.3,
                      width: Dimensions.height15*10,
                      margin: EdgeInsets.only(
                        left: Dimensions.width20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.network(
                               AppConstants.Base_Url+AppConstants.upload_Url+recommendedProduct.recommendedProductList[index].img!,
                              fit: BoxFit.contain,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                          ),
                          TextWidget(fontSize: 20, text: "ahmed"),
                          TextWidget(
                            fontSize: 16,
                            text: "fouda",
                            color: Color(0xffa9b3bd),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ):CircularProgressIndicator();
          },
        )
      ],
    );
  }
}
