import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/core/utils/routes_manager.dart';
import 'package:news_app/data/model/articles_response/article.dart';

class ArticleItemWidget extends StatelessWidget {
  ArticleItemWidget({super.key, required this.article});
  Article article;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesManager.articleDetails,
            arguments: article);
      },
      child: Container(
        margin: REdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: article.urlToImage??'',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? '',
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.error)),
                ),
              ),
            ),
            Text(
              article.source?.name ?? '',
              style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF79828B)),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(article.description ?? '',
                style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF42505C))),
            SizedBox(
              height: 2.h,
            ),
            Text(
              article.publishedAt ?? '',
              textAlign: TextAlign.end,
              style: GoogleFonts.inter(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFA3A3A3)),
            ),
          ],
        ),
      ),
    );
  }
}
