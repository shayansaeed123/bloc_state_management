import 'dart:convert';
// import 'dart:ffi';
import 'dart:io';

import 'package:blocs/res/reusableListTile.dart';
import 'package:blocs/res/reusablebottomsheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  File? _imageupdateprofileimage;
  bool updateprofileimage = false;
  String base64updateprofileimage = 'noimage';
  String? image;
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
                  reuablebottomsheet(context, "Choose Profile Image", (){
                    Navigator.pop(context);
                      selectupdateprofileimage(ImageSource.gallery);
                    }, (){
                      Navigator.pop(context);
                      selectupdateprofileimage(ImageSource.camera);
                    });
                },
                child: Stack(
                  children: [
                    Center(child: reusableimgornot(context, 
             MediaQuery.of(context).size.height * 0.2,)),
                    Positioned(
                      bottom: 65,
                      right: 115,
                      child: reusableassetimg(context, "editprofile.png", 0.07,
                          0.040, BoxFit.contain),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
          updateprofileimage = true;

          if (updateprofileimage) {
            showUpdateProfileImageDialog();
        }
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
  void showUpdateProfileImageDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Profile Image Updated'),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: FileImage(_imageupdateprofileimage!),
              fit: BoxFit.contain,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(5),
            child: ElevatedButton(child: Text('Cancel'),onPressed: (){
              Navigator.pop(context);
            },)
            // reusablebtn(context, () {
            //   Navigator.pop(context);
            // }, 'Cancel', 0.3),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: ElevatedButton(child: Text('Submit'),onPressed: (){
              setState(() {
                updateProfileImage();
              });
              Navigator.pop(context);
            },)
            // reusablebtn(context, () {
              // setState(() {
              //   updateProfileImage();
              // });
            //   // Navigator.pop(context);
            //   Navigator.pop(context);
            // }, 'Submit', 0.3),
          ),
        ],
      ),
    );
  }
  Future<void> updateProfileImage() async {
    // setState(() {
    //   isLoading = true;
    // });

    final apiUrl =
        "https://eleprogram.turk.pk/api/profile_update.php";
    try {
      final response = await http.post(Uri.parse(apiUrl), body: {
        'image': base64updateprofileimage,
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data['success'] == 1) {
          print(data['image']);
          image = data['image']; 
          print("object");

          print("Image Updated Sucessfully");
          setState(() {
            
          });
          setState(() {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => UserDetailsScreen()));
          });
        } else {
          print("Image not Updated Sucessfully");
        }
      } else {
        print("Image not Updated Sucessfully");

        print('Error: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
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

Container reusableimgornot(
  BuildContext context,
  double radius,
) {
  return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: image == null ||
              image == ""
          ? Container(
              padding: EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.orange,
                  width: 2.0,
                ),
              ),
              child: CircleAvatar(
                radius: radius,
                // backgroundColor: colorController.bgtealColorlow,
                backgroundImage: AssetImage("assets/no.jpeg"),
              ))
          : Container(
              padding: EdgeInsets.all(5),
              // width: MediaQuery.ofrf(context).size.height*0.3,
              
              height: radius,
              width: radius,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                // border: Border.all(
                //   color: colorController
                //       .bgtealColorlow,
                //   width: 2.0,
                // ),
              ),
              child: CircleAvatar(
                  radius: radius,
                  // backgroundColor: colorController.bgtealColorlow,
                  backgroundImage: NetworkImage(
                      "${image!}"))));
}
}
