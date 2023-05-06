import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_strings.dart';
import 'package:lecture_app/features/presentation/screens/account_page/change_password.dart';
import 'package:lecture_app/features/presentation/screens/account_page/information_screen.dart';

class AccountScreen extends StatefulWidget {
  static final ROUTE='AccountScreen';
  static String routeName = '/profile';

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
   File? uploadimage;

  final imagepicker = ImagePicker();

  uploadImage() async {
    var pickedImage = await imagepicker.pickImage(source: ImageSource.gallery);
    if(pickedImage != null){
      setState(() {
        uploadimage = File(pickedImage.path);
      });
    }else{

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
              color: AppColors.primary,
            ),
            onPressed: () {
              CircularProgressIndicator();
              Navigator.pop(
                context,
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.save,
                color: AppColors.primary,
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
            ),
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      'Change Photo'.tr,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: AppStrings.constantFont,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(radius: 70,

                          child:  uploadimage == null ? Image(image: AssetImage("R/icons/PIC-1.png"),): Image.file(uploadimage!,),
                    ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                                elevation: 5.0,
                                height: 40,
                                onPressed:uploadImage,
                                //     () {
                                //   PickImage();
                                // },
                                child: Text(
                                  "Upload".tr,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: AppStrings.constantFont,
                                    color: Colors.white,
                                  ),
                                ),
                                color: AppColors.primary,
                              ),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                                elevation: 5.0,
                                height: 40,
                                onPressed: uploadImage,
                                //     (){
                                //   Saveimage(_imagepath);
                                // },
                                child: Text(
                                  "Save".tr,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: AppStrings.constantFont,
                                    color: Colors.white,
                                  ),
                                ),
                                color: AppColors.primary,
                              ),
                            ],
                          ),

                        ],
                      ),
                  ),
                    // child: _imagepath != null ? CircleAvatar(backgroundImage: FileImage(File(_imagepath!)),radius: 80,)
                    //     : CircleAvatar(
                    //   radius: 80,
                    //     backgroundImage:_image != null ? FileImage(_image!): AssetImage("R/icons/PIC-1.png")
                    // ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Name'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 255,
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            hintText: 'Dr.Osama.ElKomy',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppStrings.constantFont,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: BorderSide(
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(onPressed: (){},
                          child: Text('Edit'.tr,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppStrings.constantFont,
                            color: AppColors.primary,
                          ),
                          )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Email'.tr,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 255,
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            hintText: 'Dr.Osama.ElKomy@gmail.com',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppStrings.constantFont,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: BorderSide(
                                color: AppColors.primary,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(onPressed: (){},
                          child: Text('Edit'.tr,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppStrings.constantFont,
                              color: AppColors.primary,
                            ),
                          ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Proffessor'.tr,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 255,
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            hintText: 'Proffessor',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppStrings.constantFont,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: BorderSide(
                                color: AppColors.primary,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(onPressed: (){},
                          child: Text('Edit'.tr,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppStrings.constantFont,
                              color: AppColors.primary,
                            ),
                          )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    onPressed: () {
                      CircularProgressIndicator();
                      Navigator.pushNamed(context,ChangePassword.ROUTE);
                    },
                    child: Text(
                      "Change Password".tr,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: AppStrings.constantFont,
                        color: Colors.white,
                      ),
                    ),
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }

  // void Saveimage(path) async{
  //   SharedPreferences saveimage = await SharedPreferences.getInstance();
  //   saveimage.setString("imagepath", path);
  // }
  //
  // void LoadImage() async{
  //   SharedPreferences saveimage = await SharedPreferences.getInstance();
  //   setState(() {
  //     _imagepath = saveimage.getString("imagepath");
  //   });
  // }
  //
  // void PickImage()  async{
  //   var image = await imagepicker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = (image as File?)!;
  //   });
  // }
}
