import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:google_sign_in/google_sign_in.dart' as signIn;
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_images.dart';
import 'package:lecture_app/core/utils/app_strings.dart';
import 'package:lecture_app/core/utils/constant.dart';
import 'package:lecture_app/features/modules/GoogleAuthClient.dart';



class UploadFiles extends StatefulWidget {
  static final ROUTE='UploadFile';
  const UploadFiles({Key? key}) : super(key: key);

  @override
  State<UploadFiles> createState() => _UploadFiles();
}
class _UploadFiles extends State<UploadFiles> {
  PlatformFile? PickedFile;
  UploadTask? uploadtask;
  Future selectFile() async {
    final resul = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (resul == null) return;
    //final path = result.files.single.path!;
    setState(() {
      PickedFile = resul?.files.first;
    });
    constants.ShowDialog(context: context,msg: resul.files.first.name+" Selected");
  }



  Future uploadFile() async {
    //signInWithGoogle();
    final googleSignIn =
    signIn.GoogleSignIn.standard(scopes: [drive.DriveApi.driveScope]);
     signIn.GoogleSignInAccount? account = await googleSignIn.signIn();
    print("User account $account");
    final path = 'files/${PickedFile!.name}';
    final File file = File(PickedFile!.path!);


    final authHeaders = await account?.authHeaders;
    final authenticateClient = GoogleAuthClient(authHeaders!);
    final driveApi = drive.DriveApi(authenticateClient);


    var media = new drive.Media(file.openRead(), file.lengthSync());
    var driveFile = new drive.File();
   // driveFile.parents = ["1NxIlrbN_5J-xBspiAJENqntQ7s4HpufH"];
    driveFile.name = "${PickedFile!.name}";
    final result = await driveApi.files.create(driveFile, uploadMedia: media,
        uploadOptions: drive.UploadOptions(),
        supportsAllDrives: true).then((value) async {
      await file.delete();
      constants.Dialog(context: context,msg: PickedFile!.name+" Uploaded Successfully",image: ImageAssets.success);
    });
    print("Upload result: $result");
    account = await googleSignIn.signOut();
  }

  void SnacMessage() {
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        action: SnackBarAction(label: "Undo ", onPressed: (){ }),
        behavior:SnackBarBehavior.floating ,
        backgroundColor:AppColors.primary,
        content: Container( height: 30,width: 30, margin:EdgeInsetsDirectional.only(bottom: 10),child: Center(child: Text(' uploaded successfully',style: TextStyle(fontSize: 20,fontFamily: 'Segoe Print'),))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Row(

          children: [
            Text(
              'Upload File'.tr,
              style: TextStyle(color: Colors.white,
                  fontSize: 30), //<-- SEE HERE
            ),

          ],
        ),
        backgroundColor:AppColors.primary,
      ),

      body: Container(
        child: Column(

          children:

          [
            Expanded(

              child: Image(image: AssetImage(
                  ImageAssets.OSupgrade),),
            ),


            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: DottedBorder(
                  color: AppColors.primary,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(20),
                  dashPattern: [20, 20, 20, 20],
                  child: Container(
                    width: context.width*.9,
                    child: Container(
                      child: Column(

                        children: [
                          Row(children: [
                            Padding(padding: EdgeInsets.only(left: 50, top: 140),)
                            , Text('Upload File'.tr,
                              style: TextStyle(
                                  fontSize: 31, fontFamily: AppStrings.primaryFont,
                                  color: Color(0xFF707070)),
                            ),
                            SizedBox(width: 20,)

                            , Image(image: AssetImage(
                                ImageAssets.cloud))
                          ],),
                          Container(
                            width: context.width*.6,
                            decoration: BoxDecoration(color: AppColors.primary,
                                borderRadius: BorderRadius.circular(10.0)),
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: MaterialButton(
                              onPressed: selectFile,
                              child: Text(
                                'Browse Files'.tr,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppStrings.primaryFont,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          Container(
                            width: context.width*.6,
                            decoration: BoxDecoration(color:AppColors.primary,
                                borderRadius: BorderRadius.circular(10.0)),
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: MaterialButton(
                              onPressed:  uploadFile,
                              child: Text(
                                'Send'.tr,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: AppStrings.primaryFont,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),


                        ],

                      ),
                    ),
                  ),),
              ),
            )
          ],
        ),
      ),


    );
  }

}