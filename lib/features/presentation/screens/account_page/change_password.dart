import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_images.dart';
import 'package:lecture_app/core/utils/app_strings.dart';
import 'package:lecture_app/core/utils/network/local_network.dart';

class ChangePassword extends StatefulWidget {
  static final ROUTE='ChangePass';
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var formKey = GlobalKey<FormState>();
  bool password1 = true;
  bool password2 = true;
  bool password3 = true;
  var pass1,pass2,pass3;

  Icon ic1 = Icon(Icons.remove_red_eye_outlined);
  Icon ic2 = Icon(Icons.remove_red_eye_outlined);
  Icon ic3 = Icon(Icons.remove_red_eye_outlined);

  var currentpasswordController = TextEditingController();
  var newpasswordController = TextEditingController();
  var confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(
            'Change Password'.tr,
            style: TextStyle(
              fontSize:AppStrings.app_header,
              fontFamily: AppStrings.primaryFont,
              color: Colors.white,
            ),
          ),
        ]),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            CircularProgressIndicator();
            Navigator.pop(
              context,
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          )
        ],
      ),
      body: Form(
        key: formKey,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.background_Setting),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  onChanged: (data){
                    pass1=data;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password must not be empty'.tr;
                    }if(pass1!= cashNetwork.getCashData( key: "pass")){
                      return 'Current password not correct'.tr;
                    }
                    return null;
                  },
                  controller: currentpasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: password1,
                  decoration: InputDecoration(
                    labelText: 'Current Password'.tr,
                    enabled: true,
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: IconButton(
                      icon: ic1,
                      onPressed: () {
                        setState(() {
                          password1 = !password1;
                          if (password1 == false)
                            ic1 = Icon(Icons.visibility);
                          else
                            ic1 = Icon(Icons.visibility_off);
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color:AppColors.primary,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (data){
                    pass2=data;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password must not be empty'.tr;
                    }
                    return null;
                  },
                  controller: newpasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: password2,
                  decoration: InputDecoration(
                    labelText: 'New Password'.tr,
                    enabled: true,
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: IconButton(
                      icon: ic2,
                      onPressed: () {
                        setState(() {
                          password2 = !password2;
                          if (password2 == false)
                            ic2 = Icon(Icons.visibility);
                          else
                            ic2 = Icon(Icons.visibility_off);
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color:AppColors.primary,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (data){
                    pass3=data;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password must not be empty'.tr;
                    }
                    if( value!=pass2){
                      return 'Password must be a same'.tr;
                    }
                    return null;
                  },
                  controller: confirmpasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: password3,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password'.tr,
                    enabled: true,
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: IconButton(
                      icon: ic3,
                      onPressed: () {
                        setState(() {
                          password3 = !password3;
                          if (password3 == false)
                            ic3 = Icon(Icons.visibility);
                          else
                            ic3 = Icon(Icons.visibility_off);
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color:AppColors.primary,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(10.0))),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        cashNetwork.insertToCash( key: "pass",value: pass3!);
                      });
                      Navigator.pop(
                        context,
                      );
                    }
                    CircularProgressIndicator();
                  },
                  child: Text(
                    "Change Password".tr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppStrings.primaryFont,
                      color: Colors.white,
                    ),
                  ),
                  color:AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
