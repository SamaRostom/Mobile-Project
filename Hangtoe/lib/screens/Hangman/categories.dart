import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/data.dart';
import 'package:flutter_application_1/providers/hangman_provider.dart';
import 'package:flutter_application_1/screens/Hangman/game_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/size_config.dart';

class Categories extends ConsumerStatefulWidget {
  static const routeName = "/categories-screen";

  const Categories({super.key});

  // ignore: library_private_types_in_public_api
  @override
  // _ConsumerCategoriesState createState() => _CategoriesState();
  ConsumerState<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends ConsumerState<Categories> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(180),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Text(
                  'Choose A Category',
                  style: GoogleFonts.kanit(fontSize: getProportionateScreenWidth(30), color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(90),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(70), //height of button
                  width: getProportionateScreenWidth(190), //width of button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      Data.category = "animals";
                      Navigator.pushNamed(context, GameScreen.routeName);
                      // Data.cc = Data.animals;
                    },
                    child: Text(
                      'Animals',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(70), //height of button
                  width: getProportionateScreenWidth(190), //width of button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      Data.category = "sports";
                      Navigator.pushNamed(context, GameScreen.routeName);
                      // Data.cc = Data.sports;
                    },
                    child: Text(
                      'Sports',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(70), //height of button
                  width: getProportionateScreenWidth(190), //width of button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () {
                      Data.category = "countries";
                      Navigator.pushNamed(context, GameScreen.routeName);
                    },
                    child: Text(
                      'Countries',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
