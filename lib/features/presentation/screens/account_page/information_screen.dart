import 'dart:io';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lecture_app/core/utils/app_colors.dart';
import 'package:lecture_app/core/utils/app_strings.dart';
import 'package:lecture_app/features/presentation/screens/account_page/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:lecture_app/core/utils/network/local_network.dart';

class InformationScreen extends StatefulWidget {
  static final ROUTE='InformationScreen';
  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  var name=cashNetwork.getCashData(key: "name");
  var Role=cashNetwork.getCashData(key: "Role");
  DateTime date = DateTime.now();
  File? yearsplanimage;
  File? mylecturescheduleimage;
  String? _imagepath;

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

  // Calender
    DateTime? selectedDay;
    late List <CleanCalendarEvent> selectedEvent;

  final Map<DateTime,List<CleanCalendarEvent>> events = {

    DateTime (DateTime.now().year,DateTime.now().month,DateTime.now().day):
    [
      CleanCalendarEvent('Event A',
          startTime: DateTime(
              DateTime.now().year,DateTime.now().month,DateTime.now().day,10,0),
          endTime:  DateTime(
              DateTime.now().year,DateTime.now().month,DateTime.now().day,12,0),
          description: 'A special event',
          color: Colors.blue),
    ],

    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
    [
      CleanCalendarEvent('Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          color: Colors.orange),
      CleanCalendarEvent('Event C',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.pink),
    ],
  };

  void _handleData(date){
    setState(() {
      selectedDay = date;
      selectedEvent = events[selectedDay] ?? [];
    });
    print(selectedDay);
  }
  @override
  void initState() {
    // TODO: implement initState
    LoadImage();
    selectedEvent = events[selectedDay] ?? [];
    super.initState();
  }
  DateTimeRange selectedDates = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Colors.white
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
              Icons.perm_contact_calendar_outlined,
              color: Colors.white,
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
                  backgroundImage:FileImage( File(cashNetwork.getCashData(key: "image_profile"))),
                ),
              ),
              Text(
                name!=""?'${cashNetwork.getCashData(key: "name")}':"User",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppStrings.primaryFont,
                  color: Colors.black,
                ),
              ),
              Text(
                Role!=""?'${cashNetwork.getCashData(key: "jop")}':'Proffessor',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppStrings.primaryFont,
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
                    'My Lecture Schedule'.tr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppStrings.primaryFont,
                      color:AppColors.primary,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: AppColors.primary,
                    ),
                    onPressed: MyLectureScheduleImage,
                  ),

                ],
              ),
              SizedBox(
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
                    'Years Plan'.tr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppStrings.primaryFont,
                      color:AppColors.primary,
                    ),
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
                    'Calender'.tr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppStrings.primaryFont,
                      color: AppColors.primary,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: AppColors.primary,
                    ),
                    onPressed: () async {
                      final DateTimeRange? dateTimeRange = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime(1600),
                          lastDate: DateTime(2100));
                      if (dateTimeRange != null ){
                        setState(() {
                          selectedDates = dateTimeRange;
                        });
                      }
                    },
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Date Of Event :".tr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppStrings.primaryFont,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                      "${selectedDates.duration.inDays}",
                    style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppStrings.primaryFont,
                    color: AppColors.primary,
                  ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  height: 400,
                  // color: AppColors.primary,
                  child: Calendar(

                    startOnMonday: true,
                    selectedColor: AppColors.primary,
                    todayColor: AppColors.primary,
                    eventColor: AppColors.primary,
                    eventDoneColor: AppColors.primary,
                    bottomBarColor: AppColors.primary,
                    onRangeSelected: (range) {
                      print('selected Day ${range.from},${range.to}');
                    },
                    onDateSelected: (date){
                      return _handleData(date);
                    },
                    events: events,
                    isExpanded: true,
                    dayOfWeekStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    bottomBarTextStyle: TextStyle(
                      color: AppColors.primary,
                    ),
                    hideBottomBar: false,
                    hideArrows: false,
                    weekDays: ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Text(
              //   'Date Of Day :  ${date.day}/${date.month}/${date.year}',
              //   style: TextStyle(
              //       color: AppColors.primary,
              //       fontSize: 20,
              //       fontFamily: AppStrings.primaryFont),
              // ),
              // Container(
              //   padding: EdgeInsets.all(20),
              //   width: 330,
              //   child: SingleChildScrollView(
              //     child: TableCalendar(
              //       firstDay: DateTime.utc(1900, 10, 20),
              //       lastDay: DateTime.utc(2100, 10, 20),
              //       focusedDay: DateTime.now(),
              //       headerVisible: true,
              //       daysOfWeekVisible: true,
              //       sixWeekMonthsEnforced: true,
              //       shouldFillViewport: false,
              //       headerStyle: HeaderStyle(
              //           titleTextStyle: TextStyle(
              //               fontSize: 16,
              //               color: Colors.black,
              //               fontWeight: FontWeight.bold)),
              //       calendarStyle: CalendarStyle(
              //         defaultDecoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(20),
              //         ),
              //         todayTextStyle: TextStyle(
              //             fontSize: 16,
              //             color: Colors.black,
              //             fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //   ),
              // ),
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
