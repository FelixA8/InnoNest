import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mechar/models/asset_models.dart';
import 'package:mechar/widgets/category_home_icons.dart';
import 'package:mechar/widgets/product_home_overview.dart';
import 'package:mechar/libraries/globals.dart' as globals;

class HomeSection extends StatefulWidget {
  const HomeSection({super.key, required this.userName});
  final String userName;

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  String userName = '';
  String userEmail = '';
  void getCurrentUserData() async {
    //get hold of the users collection
    final users = FirebaseFirestore.instance.collection('users');
    //get hold of the documents which is the user.uid and get the data
    final userData = await users.doc(globals.userData.uid).get();
    setState(
      () {
        userName = userData.data()![
            'username']; //reach the username in the firebase firestore and set it to the userName
        userEmail = globals.userData.email; //set the user email
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, $userName',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: Color(0xff0085FF),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                //seperator or giving space
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemCount: categoryTypeAssets.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryHomeIcon(
                          icons: categoryTypeAssets[index].icons,
                          title: categoryTypeAssets[index].title);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: ListView.separated(
                    itemCount: furnitureAssets.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ProductHomeOverview(
                        furniture: furnitureAssets[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 25,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
