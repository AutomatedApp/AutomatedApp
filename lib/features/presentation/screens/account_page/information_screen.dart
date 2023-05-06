import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_strings.dart';
import 'package:lecture_app/features/presentation/screens/account_page/profile_screen.dart';
import 'package:lecture_app/features/presentation/screens/settings_page/setting_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class InformationScreen extends StatefulWidget {
  static final ROUTE='InformationScreen';
  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  DateTime date = DateTime.now();
  File? yearsplanimage;
  File? mylecturescheduleimage;
  String? _imagepath;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadImage();
  }

  final imagepicker = ImagePicker();

  YearsPlanImage() async {
    var pickedImage = await imagepicker!.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        yearsplanimage = File(pickedImage.path);
      });
    } else {}
  }

  MyLectureScheduleImage() async {
    var pickedImage = await imagepicker!.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        mylecturescheduleimage = File(pickedImage.path);
      });
    } else {}
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
              context
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: AppColors.primary,
            ),
            onPressed: () {
              CircularProgressIndicator();
              Navigator.pushNamed(context,AccountScreen.ROUTE);
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 115,
                width: 115,
                child: CircleAvatar(
                  backgroundImage: AssetImage("R/icons/PIC-1.png"),
                ),
              ),
              Text(
                'Dr.Osama ElKomy',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: AppStrings.constantFont,
                ),
              ),
              Text(
                'Proffessor',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: AppStrings.constantFont,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'My Lecture Schedule',
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontFamily: AppStrings.constantFont),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: AppColors.primary,
                    ),
                    onPressed: MyLectureScheduleImage,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.save,
                      color: AppColors.primary,
                    ),
                    onPressed: (){
                      Saveimage(_imagepath);
                      },
                  ),
                ],
              ),
              SizedBox(
                  // _imagepath != null ? FileImage(File(_imagepath!)):

                  width: double.infinity,
                  child: mylecturescheduleimage == null
                      ? Image(
                          image: AssetImage("R/icons/lecturetable.jpg"),
                        )
                      : Image.file(mylecturescheduleimage!)),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Years Plan',
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontFamily: AppStrings.constantFont),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: AppColors.primary,
                    ),
                    onPressed: YearsPlanImage,
                  ),
                ],
              ),
              SizedBox(
                  width: double.infinity,
                  child: yearsplanimage == null
                      ? Image(
                          image: AssetImage("R/icons/Plan.jpeg"),
                        )
                      : Image.file(yearsplanimage!)),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Calender',
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontFamily: AppStrings.constantFont),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: AppColors.primary,
                    ),
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (newDate == null) return;
                      setState(() {
                        date = newDate;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Date Of Day :  ${date.day}/${date.month}/${date.year}',
                style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 20,
                    fontFamily: AppStrings.constantFont),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: 330,
                child: SingleChildScrollView(
                  child: TableCalendar(
                    firstDay: DateTime.utc(1900, 10, 20),
                    lastDay: DateTime.utc(2100, 10, 20),
                    focusedDay: DateTime.now(),
                    headerVisible: true,
                    daysOfWeekVisible: true,
                    sixWeekMonthsEnforced: true,
                    shouldFillViewport: false,
                    headerStyle: HeaderStyle(
                        titleTextStyle: TextStyle(
                            fontSize: 16,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold)),
                    calendarStyle: CalendarStyle(
                      defaultDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      todayTextStyle: TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
void Saveimage(path) async{
  SharedPreferences saveimage = await SharedPreferences.getInstance();
  saveimage.setString("imagepath", path);
}

void LoadImage() async{
  SharedPreferences saveimage = await SharedPreferences.getInstance();
  setState(() {
    _imagepath = saveimage.getString("imagepath");
  });
}
}
