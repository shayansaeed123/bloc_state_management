import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:blocs/res/reusableListTile.dart';
import 'package:blocs/res/reusablebottomsheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  File? _imageupdateprofileimage;
  bool updateprofileimage = false;
  String base64updateprofileimage = 'noimage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hwllo'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.all(10.0),
              color: Colors.orange,
              child: GestureDetector(
                onTap: () {
                },
                child: Stack(
                  children: [
                    // reusableimgornot(context, 130),
                    Positioned(
                      bottom: 15,
                      right: 115,
                      child: reusableassetimg(context, "man.png", 0.4,
                          0.3, BoxFit.contain),
                    ),
                  ],
                ),
              ),
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Center(
              //   child: InkWell(
              //     onTap: (){
              //       reuablebottomsheet(context, "Choose Profile Image", (){
              //         selectupdateprofileimage(ImageSource.gallery);
              //       }, (){
              //         selectupdateprofileimage(ImageSource.camera);
              //       });
              //     },
              //     child: Container(
              //       // margin: EdgeInsets.symmetric(
              //       //     horizontal: MediaQuery.of(context).size.width * 0.07,
              //       //     vertical: MediaQuery.of(context).size.height * 0.07),
              //       width: MediaQuery.of(context).size.width * .7,
              //       height: MediaQuery.of(context).size.height * .2,
              //       decoration: BoxDecoration(
              //         shape: BoxShape.circle,
              //         border: Border.all(color: Colors.white, width: 6),
              //         color: Colors.orange,
              //       ),
              //       // child: Image.file(File(_imageupdateprofileimage!.path.toString()),),
              //     ),
              //   ),
              // ),
              // ],)
            ),
          ),
          //  SizedBox(height: MediaQuery.of(context).size.height * 0.0001),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            width: double.infinity,
            child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(10.0),
                color: Colors.orange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 6.0),
                      child: Text(
                        'User Details',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    reusabletile(
                        'Basic Info', () {}, Icon(Icons.arrow_forward)),
                    reusabletile(
                        'Notification List', () {}, Icon(Icons.arrow_forward)),
                    reusabletile('About', () {}, Icon(Icons.arrow_forward)),
                    reusabletile('Contact', () {}, Icon(Icons.arrow_forward)),
                    // SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/facebook.png',
                              filterQuality: FilterQuality.high,
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.height * 0.07,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/instagram.png',
                              filterQuality: FilterQuality.high,
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.height * 0.07,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/linkedin.png',
                              filterQuality: FilterQuality.high,
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.height * 0.07,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/youtube.png',
                              filterQuality: FilterQuality.high,
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.height * 0.07,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Future<void> selectupdateprofileimage(ImageSource source) async {
    // setState(() {
    //   isLoading = true;
    // });
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);

      setState(() {
        if (pickedFile != null) {
          _imageupdateprofileimage = File(pickedFile.path);

          List<int> imageBytes = _imageupdateprofileimage!.readAsBytesSync();
          base64updateprofileimage = base64Encode(imageBytes);

          print('Base64 Image: $base64updateprofileimage');
          // updateprofileimage = true;

          // if (updateprofileimage) {
          //   showUpdateProfileImageDialog();
          // }
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {
      print('Error in selectupdateprofileimage: $e');
      // Handle error here
    } finally {
      // setState(() {
      //   isLoading = false;
      // });
    }
  }
  Widget reusableassetimg(BuildContext context, String imgpath, double width,
    double height, BoxFit boxFit) {
  return Image.asset(
    "assets/$imgpath",
    fit: boxFit,
    width: MediaQuery.of(context).size.width * width,
    height: MediaQuery.of(context).size.height * height,
  );
}
}
