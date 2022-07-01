// ignore_for_file: unnecessary_const, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, unused_element, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:uas_mobpro/models/popular_phone.dart';
import 'package:uas_mobpro/widgets/phone_card.dart';
import 'package:uas_mobpro/widgets/recomended_phone.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/phone.dart';
import '../style.dart';
import '../widgets/bottom_navbar_item.dart';

class HomePage extends StatelessWidget {
  final String apiUrl = "https://dummyjson.com/products?skip=0&limit=5";
  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['products'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const SizedBox(
              height: edge,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari Smartphone Terbaik',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular Smartphone',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  PhoneCard(
                    PopularPhone(
                      id: 1,
                      name: 'Iphone 9',
                      imageUrl: 'assets/images/phone_one.jpg',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  PhoneCard(
                    PopularPhone(
                      id: 2,
                      name: 'Iphone X',
                      imageUrl: 'assets/images/phone_two.jpg',
                      isPopular: true,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  PhoneCard(
                    PopularPhone(
                      id: 3,
                      name: 'Samsung',
                      imageUrl: 'assets/images/phone_three.jpg',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  PhoneCard(
                    PopularPhone(
                      id: 4,
                      name: 'Oppo',
                      imageUrl: 'assets/images/phone_four.jpg',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  PhoneCard(
                    PopularPhone(
                      id: 5,
                      name: 'HuaWei',
                      imageUrl: 'assets/images/phone_five.jpg',
                      isPopular: true,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: Recomended Space
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recommended Phone',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: FutureBuilder<List<dynamic>>(
                future: _fecthDataUsers(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<dynamic> data = snapshot.data;
                    int index = 0;
                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(top: index == 1 ? 0 : 10),
                          child: RecommendedPhone(Phone.fromJson(item)),
                        );
                      }).toList(),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: greyColor,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_email.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
