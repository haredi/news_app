import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/data/model/sources_response/source.dart';

class SourceItemWidget extends StatelessWidget {
  SourceItemWidget({super.key, required this.source, required this.isSelected});
  Source source;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
          color: isSelected ? ColorsManager.green : Colors.transparent,
          border: Border.all(color: ColorsManager.green,width: 2.w),
          borderRadius: BorderRadius.circular(25.r)),
      child: Text(
        source.name ?? '',
        style: GoogleFonts.inter(
            color: isSelected ? ColorsManager.white : ColorsManager.green),
      ),
    );
  }
}
