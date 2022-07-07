import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../controller/popular_book_controller.dart';

class PdfPage extends StatelessWidget {
  final int pageId;
   PdfPage({Key? key,required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var articles = Get.find<PopularProductController>().popularProductList[pageId];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(articles.name!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
      ),
      body: SfPdfViewer.network(AppConstants.Base_Url+articles.pdf!,),
    );
  }
}
