import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class MyProfilepage extends StatefulWidget {
  const MyProfilepage({
    super.key,
  });

  @override
  State<MyProfilepage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilepage> {
  String handle = '';
  int rating = 0;
  String rank = '';
  int maxRating = 0;
  int contribution = 0;
  int friendOfCount = 0;
  String titlePhoto = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String url =
        'https://codeforces.com/api/user.info?handles=CTC_45_21_15&checkHistoricHandles=false';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      setState(() {
        handle = data['result'][0]['handle'];
        rating = data['result'][0]['rating'];
        rank = data['result'][0]['rank'];
        maxRating = data['result'][0]['maxRating'];
        contribution = data['result'][0]['contribution'];
        friendOfCount = data['result'][0]['friendOfCount'];
        titlePhoto = data['result'][0]['titlePhoto'];
      });
    } else {
      print('Failed to fetch data');
    }
       
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: false,
        leading: const Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 148, 144, 144),
        ),
        backgroundColor: const Color.fromARGB(255, 245, 237, 237),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: const Text(
                  "CodeForces",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 10, top: 10),
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.alarm_add_outlined),
                          Text(
                            "  |",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.flag),
                          Icon(Icons.flag_rounded),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$handle',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Logout',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child:  Row(
                children: [
                  Text('$handle',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Text('Settings',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Text('Lists', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Text('Blog', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Text('Teams', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Text('Submissions',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Text('Favorites',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Text('Contests',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: const BoxDecoration(
                      // border: Border.all(
                      //   color: Colors.black,
                      //   width: 1,
                      // ),
                      ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$rank',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.green),
                        ),
                        SizedBox(height: 0),
                        Text(
                          '$handle',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.green),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.book_sharp),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Contest Rating: ',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '$maxRating',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.green),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.lightBlue,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Contribution: 0',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Freind of: $friendOfCount',
                              style: const TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                       const SizedBox(height: 10),
                       const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'My Friends',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            Icon(
                              Icons.settings,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'change settings',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        const Row(
                          children: [
                            Icon(
                              Icons.email_rounded,
                              color: Color.fromRGBO(220, 244, 3, 1),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'nithinrohitian@gmail.com',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color.fromRGBO(220, 244, 3, 1),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Last visit:',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              ' online now',
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.green),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        const Row(
                          children: [
                            Icon(
                              Icons.email_rounded,
                              color: Color.fromRGBO(220, 244, 3, 1),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Registered: 12 months ago',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        const Row(
                          children: [
                            Icon(
                              Icons.book_sharp,
                              color: Color.fromRGBO(220, 244, 3, 1),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Blogentry (0)',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.book_rounded,
                              color: Color.fromRGBO(220, 244, 3, 1),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Write new entry',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.mail,
                              color: Color.fromRGBO(220, 244, 3, 1),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'View my Talks',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: Image.asset(
                          '/Users/sagilinithin/flutter_projects/codeforces_profile_flutterclass_1/assets/images/IMG_2678.HEIC',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: const Row(
                              children: [
                                Expanded(
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'ChangePhoto',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Expanded(
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'ChangePhoto',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
