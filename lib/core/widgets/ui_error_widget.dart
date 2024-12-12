import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/result.dart';

class UiErrorWidget extends StatelessWidget {
   UiErrorWidget({super.key, this.serverError, this.error,
   this.retryButtonText, this.retryButtonAction});
  ServerError? serverError;
  Error? error;
  String? retryButtonText;
  VoidCallback? retryButtonAction;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(extractError(),textAlign: TextAlign.center,),
        SizedBox(height: 4.h,),
        if(retryButtonText != null)
        ElevatedButton(onPressed: () {
          retryButtonAction?.call();
        }, child: Text(retryButtonText!))
      ],
    );
  }

  String extractError(){
    String message='something went error';
    if(serverError?.message != null){
      return serverError!.message;
    }
    if(error?.exception != null){
     Exception ex = error!.exception;
     switch(ex){
       case SocketException():
         message="No Internet connection";
         break;
       case HttpException():
         message = "Couldn't find the post";
         break;
       case FormatException():
         message = 'Bad response format';
         break;
     }
    }
    return message;
  }

}
