import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waleed/pages/youtube_search/model/item_data.dart';
import 'package:waleed/pages/youtube_search/model/youtube_search_model.dart';
class YoutubeSearchPage extends StatefulWidget {
  const YoutubeSearchPage({Key? key}) : super(key: key);

  @override
  State<YoutubeSearchPage> createState() => _YoutubeSearchPageState();
}

class _YoutubeSearchPageState extends State<YoutubeSearchPage> {
  bool _isSearch = false;
  bool _isLoading=true;
  int navIndex = 0;
  List <ItemData> items=[];
  @override
  void initState(){
    super.initState();
    _loadMockDataFromAssets();

  }

  Future<void> _loadMockDataFromAssets()async{

    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        _isLoading=false;
      });
    });

    final assetsData=await rootBundle.loadString("assets/images/youtube_search.json");

    final response=YoutubeSearchModel.fromJson(json.decode(assetsData));


    items=response.items!;

    print(response.items?[0].snippet?.thumbnails?.high?.width);


  }


  Widget _searchWidget() {
    return Row(
      children: [
        InkWell(
            onTap: () {
              setState(() {
                _isSearch = false;
              });
            },
            child: Icon(Icons.arrow_back)),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                color: Colors.black.withOpacity(.2),
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Youtube Search", border: InputBorder.none),
              )),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.mic)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearch == true
            ? _searchWidget()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 20, child: Image.asset("assets/images/logo.png")),
                  Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      InkWell(
                          onTap: () {
                            if (_isSearch == false) {
                              setState(() {
                                _isSearch = true;
                              });
                            }
                          },
                          child: Icon(Icons.search)),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.notifications),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 40,
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(500)),
                            child: Image.asset("assets/images/wali123.png")),
                      )
                    ],
                  )
                ],
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex,
        onTap: (index) {
          setState(() {
            navIndex = index;
          });
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Create"),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions), label: "Subscriptions"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_add_check), label: "Library"),
        ],
      ),
      body:_isLoading==true?Center(child: CircularProgressIndicator(),): ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return InkWell(onTap: (){
                Navigator.pushNamed(context, "/playVideo",arguments: items[index]);
            },
              child: Container(
                height: 280,
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.grey,
                        child: Image.network(items[index].snippet?.thumbnails?.medium?.url as String,fit: BoxFit.cover,),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${items[index].snippet?.title}",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${items[index].snippet?.channelTitle}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
