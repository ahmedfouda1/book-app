import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/food/popular_book_details.dart';
import 'package:food_delivery/widgets/text_widget.dart';
import 'package:get/get.dart';

import '../../controller/popular_book_controller.dart';
import '../../model/books_model.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/dimensions.dart';
import 'book_page_body.dart';


class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
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
    final double height =MediaQuery.of(context).size.height;
    final double width =MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top:height*0.015,
                  left: Dimensions.width30,
                  right: Dimensions.width30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu_book_sharp,color: Color(0xff363f93),),
                     Icon(Icons.menu,color: Color(0xff363f93)),
                  ],
                ),
            ),
            SizedBox(height: height*0.015,),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  TextWidget(text: "Today",fontSize: 36,),
                  Expanded(child: Container()),
                ],
              ),
            ),
            SizedBox(height: height*0.01,),
            Container(
              height: height*0.06,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                child: CupertinoSearchTextField(),
              ),
            ),
            SizedBox(height: height*0.01,),
            Container(
                padding: EdgeInsets.only(left: Dimensions.width20,right:Dimensions.width10*3,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(fontSize: 30, text: "Recommend"),
                    Expanded(child: Container(),),
                    Row(
                      children: [
                        TextWidget(fontSize: 16, text: "view all",color: Color(0xffa9b3bd),),
                        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,color: Color(0xff363f93),size: 16,)),


                      ],
                    ),
                  ],
                ),

            ),
            SizedBox(height: height*0.01,),

            GetBuilder<PopularProductController>(builder:(popularProducts){
              return Container(
                height: height*0.235,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: popularProducts.popularProductList.length,
                  itemBuilder: (context, position) {
                    return _buildPageItem(position,popularProducts.popularProductList[position]);
                  },
                ),
              );
            }),

            SizedBox(
              height: height*0.01,
            ),
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(fontSize: 30, text: "New Book List"),
                  Row(
                    children: [
                      TextWidget(fontSize: 16, text: "view all",color: Color(0xffa9b3bd),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,color: Color(0xff363f93),size: 16,)),

                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: height*0.007,),
            Expanded(
                child: SingleChildScrollView(
                  child:FoodPageBody(),
                ),
              ),



          ],
        ),
      ),
    );
  }

  Widget _buildPageItem(

      int index,ProductModel popularProduct,
      ) {
    final double height =MediaQuery.of(context).size.height;
    final double width =MediaQuery.of(context).size.width;
    return
      GestureDetector(
        onTap: (){
          //Get.toNamed(RouteHelper.getPopularFood(index,"home"));
           Get.toNamed(RouteHelper.getPopularFood(index,"home"));
        },
        child: Stack(
          children: [
            Positioned(
              top: Dimensions.height30,

              child: new Material(
                elevation: 0.0,
                child: new Container(
                  height: Dimensions.height20*8,
                  width: width*0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: new Offset(-10.0, 0.0),
                          blurRadius: 20.0,
                          spreadRadius: 4.0,
                        ),
                      ]
                  ),
                ),
              ),

            ),
            Positioned(
              top: 0,
              left: 10,
              child: Card(
                elevation: 10.0,
                shadowColor: Colors.grey.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  height: height*0.21,
                  width: width*.33,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppConstants.Base_Url+"/uploads/"+popularProduct.img!),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: Dimensions.height45,
              left: width*0.45,
              child: Container(
                height: Dimensions.height20*10,
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(fontSize: 20, text: popularProduct.name!),
                    TextWidget(color:Colors.grey,fontSize: 16, text: popularProduct.author!),
                    Divider(
                      color: Colors.black,
                    ),
                    TextWidget(color:Colors.grey,fontSize: 16, text: popularProduct.name!),
                  ],
                ),
              ),
            ),
          ],


         ),
      );
  }
}
