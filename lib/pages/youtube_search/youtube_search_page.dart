import 'dart:convert';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
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
bool _isLoading = true;
int navIndex = 0;
List<ItemData> items = [];
String? _nextPageToken;
ScrollController _listScrollController = ScrollController();
TextEditingController _controller = TextEditingController();

String baseUrl = "https://youtube.googleapis.com/youtube/v3/";
String API_KEY = "AIzaSyBjGloNHkJq0fXNS9gCa-kQJhZWjffaMUY";
static const MAXRESULT = "10";
final httpClient = http.Client();

@override
void dispose() {
_controller.dispose();
_listScrollController.dispose();
super.dispose();
}

@override
void initState() {
super.initState();
_getResult();
}

Future<void> _getResult() async {
setState(() {
_isLoading = true;
});
dynamic url = baseUrl +
"search?part=snippet&maxResults=$MAXRESULT&q=${_controller.text}&videoType=any&key=$API_KEY"+(_nextPageToken!=null?"&pageToken=$_nextPageToken":"");

final uri = Uri.parse(url);
final response = await httpClient.get(uri);

if (response.statusCode == 200) {
final data = YoutubeSearchModel.fromJson(json.decode(response.body));

setState(() {
_nextPageToken != data.nextPageToken;
items = data.items!;
_isLoading=false;
});
}
}

Future<void> nextPageResult() async {
  if(_nextPageToken==null){
    return;
  }
  if(_controller.text.isEmpty){
    return;
  }



dynamic url = baseUrl +
"search?part=snippet&maxResults=$MAXRESULT&q=${_controller.text}&videoType=any&key=$API_KEY"+(_nextPageToken!=null?"&pageToken=$_nextPageToken":"");

final uri = Uri.parse(url);
final response = await httpClient.get(uri);

if (response.statusCode == 200) {
final data = YoutubeSearchModel.fromJson(json.decode(response.body));

setState(() {
_nextPageToken != data.nextPageToken;
items = data.items!;
_isLoading = false;
});
}
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
child: Icon(Icons.arrow_back),
),
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
controller: _controller,
style: TextStyle(color: Colors.white),
decoration: InputDecoration(
suffixIcon: InkWell(
onTap: () {
_getResult();
},
child: Icon(Icons.search),
),
hintText: "Youtube Search",
border: InputBorder.none,
),
),
),
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
child: Icon(Icons.mic),
),
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
height: 20,
child: Image.asset("assets/images/logo.png"),
),
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
child: Icon(Icons.search),
),
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
borderRadius: BorderRadius.all(Radius.circular(500)),
child: Image.asset("assets/images/wali123.png"),
),
),
],
),
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
body:_controller.text.isEmpty?Center(child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [

  Icon(Icons.search,size: 48,color: Colors.black.withOpacity(.4),),
  Text("Search Data",style: TextStyle(fontSize: 28,color: Colors.black.withOpacity(.4)),)
],
),):_isLoading == true
? Center(child: CircularProgressIndicator())
    : NotificationListener<ScrollNotification>(
onNotification: (ScrollNotification scrollNotification) {
if (scrollNotification is ScrollEndNotification &&
_listScrollController.position.extentAfter == 0) {
nextPageResult();
}
return false;
},
child: ListView.builder(
controller: _listScrollController,
itemCount: _calculateItemLen(),
itemBuilder: (context, index) {
if (items.length == index) {
return _buildProgressIndicator();
} else {
return InkWell(
onTap: () {
Navigator.pushNamed(
context,
"/playVideo",
arguments: items[index],
);
},
child: Container(
height: 280,
child: Card(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Expanded(
flex: 1,
child: Container(
height: 200,
width: double.infinity,
color: Colors.grey,
child: Image.network(
items[index].snippet?.thumbnails?.medium
    ?.url as String,
fit: BoxFit.cover,
),
),
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
}
},
),
),
);
}

int _calculateItemLen() {
return items.length + 1;
}

Widget _buildProgressIndicator() {
return Padding(
padding: const EdgeInsets.all(8.0),
child: Center(
child: CircularProgressIndicator(),
),
);
}
}
