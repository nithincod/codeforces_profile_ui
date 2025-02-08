import 'dart:convert';

import 'package:codeforces_profile_flutterclass_1/ui/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String handle = '';
int rating = 0;
String rank = '';
int maxRating = 0;
int contribution = 0;
int freindOfCount = 0;
String titlePhoto = '';

Future<void> fetchData() async {
  String url =
      'https://codeforces.com/api/user.info?handles=CTC_45_21_15&checkHistoricHandles=false';

  var response = await http.get(Uri.parse(url));

  var data = jsonDecode(response.body);

  if (response.statusCode == 200) {
    for (int i = 0; i < data['result'].length; i++) {
      handle = data['result'][i]['handle'];
      rating = data['result'][i]['rating'];
      rank = data['result'][i]['rank'];
      maxRating = data['result'][i]['maxRating'];
      contribution = data['result'][i]['contribution'];
      freindOfCount = data['result'][i]['friendOfCount'];
      titlePhoto = data['result'][i]['titlePhoto'];
    }
    
  } else {
    print('Failed');
  }
}

void main() {
  fetchData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyProfilepage(),
    );
  }
}
