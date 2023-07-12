




import 'package:flutter/material.dart';
import 'package:waleed/pages/sign%20up%20page.dart';
import 'package:waleed/pages/youtube_search/model/item_data.dart';
import 'package:waleed/pages/youtube_search/play_video.dart';
import 'package:waleed/pages/youtube_search/youtube_search_page.dart';

import 'Home_page.dart';
import 'day8.dart';
import 'login page.dart';

class OnGenerateRoute{
  static Route<dynamic>? route(RouteSettings settings){
    final args=settings.arguments;

    if (settings.name=="/"){
      return MaterialPageRoute(
      builder:(_)=>YoutubeSearchPage()
      );
    }else if(settings.name=="/playVideo"){
      if (args is ItemData) {
        return MaterialPageRoute(builder: (_) => PlayVideo(item: args,)
        );
      }else{


        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(
                    appBar: AppBar(
                      title: Text("error"),
                    ),
                    body: Center(
                      child: Text("error"),
                    ),
                )
        );

      }
    }else if(settings.name=="/signup") {
  return MaterialPageRoute(
  builder: (_) => SignUpPage()
  );
  }else if(settings.name=="/login") {
      return MaterialPageRoute(builder: (_) => LoginPage()
      );
    } else if(settings.name=="/homePage"){
      if(args is UserData)
        return MaterialPageRoute(builder:(_)=>Homepage(userData: args,)
        );
      else
        return MaterialPageRoute(
            builder: (_)=>Scaffold(
              appBar: AppBar(
                title: Text("error"),
              ),
              body: Center(
                child: Text("error"),
              ),
            )
        );
    }else {
      return MaterialPageRoute(
        builder: (_) =>
            Scaffold(
              appBar: AppBar(
                title: Text("error"),
              ),
              body: Center(
                child: Text("error"),
              ),
            ),

      );
    }
  }
}