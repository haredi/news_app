
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/colors_manager.dart';
import '../../../data/model/articles_response/article.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Article article=ModalRoute.of(context)?.settings.arguments as Article;
    // int now=DateTime.now().hour;
// int time= now - int.parse(article.publishedAt?.substring("")??'');
    return Container(
        decoration:const BoxDecoration(
            color: ColorsManager.white,
            image: DecorationImage(
                image: AssetImage(AssetsManager.pattern), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(article.title ?? ''),
        ),

        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 5,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: Image.network(article.urlToImage??''),
              ),
              Text(article.source?.name ?? '',style: GoogleFonts.poppins(fontSize: 10.sp, fontWeight: FontWeight.w400,color: Color(0xFF79828B),)),
              SizedBox(height: 2.h,),
              Text(article.description ?? '',style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500,color: Color(0xFF42505C),)),
              SizedBox(height: 2.h,),

              Text( article.publishedAt?? '', textAlign: TextAlign.end,style: GoogleFonts.inter(fontSize: 13.sp,fontWeight: FontWeight.w400,color: Color(0xFFA3A3A3),),),
              SizedBox(height: 2.h,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    article.content ?? '',
                    style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w300,color:const Color(0xFF42505C),)),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () async{

                    String webUrl = article.url??'';
                    if (await canLaunchUrlString(webUrl)) {
                      launchUrlString(webUrl, mode: LaunchMode.externalApplication);
                    } else {
                      print("Can't launch $webUrl");
                    }

                     // if (!await launchUrl(
                     //    article.url??'',
                     //    mode: LaunchMode.externalApplication,
                     //  )) {
                     //
                     //  }

                }, child: Text('View Full Article', style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14.sp,color:const Color(0xFF42505C))),),
              )


            ],
          ),
        ),
      ),
    );
  }
}
