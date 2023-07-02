import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  var folderName;
  var formKey = GlobalKey<FormState>();
  var namecontroller = TextEditingController();
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
    //final path = 'files/${PickedFile!.name}';
    // ignore: use_build_context_synchronously
    showDialog(context: context, builder: (context)=>
        Form(
          key: formKey,
          child: AlertDialog(

            actions: [
              TextFormField(

                onChanged: (data){
                  folderName=data.trim();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'name must not be empty'.tr;
                  }

                  return null;
                },
                keyboardType: TextInputType.name,
                controller: namecontroller,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.drive_folder_upload_rounded),
                  labelText: 'Write/Select the folder location'.tr,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: MaterialButton(onPressed: ()async{
                      Navigator.pop(
                        context,
                      );
                      var folderId;
                      final File file = File(PickedFile!.path!);
                      final authHeaders = await account?.authHeaders;
                      final authenticateClient = GoogleAuthClient(authHeaders!);
                      final driveApi = drive.DriveApi(authenticateClient);

                      drive.FileList folderList = await driveApi.files.list(q: "mimeType='application/vnd.google-apps.folder' and name='$folderName'");
                      if (folderList.files != null && folderList.files!.isNotEmpty) {
                        // Assuming there is only one folder with the given name, retrieve its ID
                        folderId = folderList.files![0].id!;
                      } else {
                        // Folder with the given name not found
                        print("Folder not found.");
                        return;
                      }
                      Future.delayed(Duration(seconds: 10), () async{
                        var media = new drive.Media(file.openRead(), file.lengthSync());
                        var driveFile = new drive.File();
                        driveFile.parents = ['${folderId}'];
                        driveFile.name = "${PickedFile!.name}";
                         await driveApi.files.create(driveFile, uploadMedia: media,
                            uploadOptions: drive.UploadOptions(),
                            supportsAllDrives: true).then((value) async {
                          await file.delete();
                          constants.Dialog(context: context,Text:Text(PickedFile!.name+" Uploaded Successfully") ,image: ImageAssets.success);
                        });
                        await googleSignIn.signOut();

                      });

                    }, child: Text('Done', style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppStrings.primaryFont,
                      color: Colors.white,
                    ),)),
                  )
                ],)
            ],
            backgroundColor: Colors.white.withOpacity(.8),
            title: Text('\t\t  Where will you put this file?\t\t  '),
            icon: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.close))],),
                Image(
                  height: 50,
                  width: 50,
                  image: AssetImage(
                    ImageAssets.files),),
              ],
            ),

          ),
        ));
// Search for the folder by name
    
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(

          children: [
            Text(
              'Upload File'.tr,
              style: TextStyle(color: Colors.white,
                  fontSize: AppStrings.app_header), //<-- SEE HERE
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
                            width: context.width*.7,
                            decoration: BoxDecoration(color: AppColors.primary,
                                borderRadius: BorderRadius.circular(10.0)),
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: MaterialButton(
                              onPressed: selectFile,
                              child: Text(
                                'Browse Files'.tr,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppStrings.primaryFont,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          Container(
                            width: context.width*.7,
                            decoration: BoxDecoration(color:AppColors.primary,
                                borderRadius: BorderRadius.circular(10.0)),
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: MaterialButton(
                              onPressed:  uploadFile,
                              child: Text(
                                'Send'.tr,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
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