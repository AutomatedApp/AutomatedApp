import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lecture_app/core/utils/app_strings.dart';

class AttendanceList extends StatefulWidget {
  static final ROUTE='Attendce';
  @override
  _AttendanceListState createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  final List<Map<String, dynamic>> attendanceData = [
    {
      'name': 'Ahmed Mahmoud',
      'avatar': 'https://i.pravatar.cc/1100',
      'status': 'Absent',
      'isPresent': false,
    },
    {
      'name': 'Ayman Salah',
      'avatar': 'https://i.pravatar.cc/1200',
      'status': 'In 9:00 am   Out 2:00 pm',
      'isPresent': true,
    },
    {
      'name': 'Doaa Abdallah',
      'avatar': 'https://i.pravatar.cc/100',
      'status': 'In 10:00 am   Out 1:00 pm',
      'isPresent': true,
    },
    {
      'name': 'Foaad Omar',
      'avatar': 'https://i.pravatar.cc/3400',
      'status': 'In 11:00 am   Out 3:00 pm',
      'isPresent': true,
    },
    {
      'name': 'Ehsan Mostafa',
      'avatar': 'https://i.pravatar.cc/5300',
      'status': 'In 9:00 am   Out 2:30 pm',
      'isPresent': true,
    },
    {
      'name': 'Hager Osama',
      'avatar': 'https://i.pravatar.cc/900',
      'status': 'Absent',
      'isPresent': false,
    } ,{
      'name': 'Hager Ramadan',
      'avatar': 'https://i.pravatar.cc/700',
      'status': 'In 9:00 am   Out 2:00 pm',
      'isPresent': true,
    },
    {
      'name': 'Galal Hassan',
      'avatar': 'https://i.pravatar.cc/2800',
      'status': 'In 9:00 am   Out 3:00 pm',
      'isPresent': true,
    },
    {
      'name': 'Sama Ayman',
      'avatar': 'https://i.pravatar.cc/400',
      'status': 'In 11:00 am   Out 1:00 pm',
      'isPresent': true,
    },
    {
      'name': 'Omar Gaber',
      'avatar': 'https://i.pravatar.cc/2100',
      'status': 'In 9:00 am   Out 1:00 pm',
      'isPresent': true,
    },
    {
      'name': 'Osama Elkholy ',
      'avatar': 'https://i.pravatar.cc/1300',
      'status': 'Absent',
      'isPresent': false,
    },
    {
      'name': 'Marawan Mahmoud',
      'avatar': 'https://i.pravatar.cc/2900',
      'status': 'In 9:00 am   Out 2:00 pm',
      'isPresent': true,
    }, {
      'name': 'Mostafa Rashwan',
      'avatar': 'https://i.pravatar.cc/2600',
      'status': 'In 9:00 am   Out 1:00 pm' ,
      'isPresent': true,

    },
    {
      'name': 'Yasser Wael',
      'avatar': 'https://i.pravatar.cc/1900',
      'status': 'In 9:00 am   Out 5:00 pm',
      'isPresent': true,
    },
    {
      'name': 'Youssef Abdelrauf',
      'avatar': 'https://i.pravatar.cc/4300',
      'status': 'Absent', 'isPresent': false,

    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance List'.tr,style: TextStyle(fontSize: AppStrings.app_header),),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Robotics',  style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppStrings.primaryFont,
                  color: Colors.white,
                ),
                ),
                Container(height: 25,width: 1.5,color: Colors.white,),
                Text(
               ('May 21st'),
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: AppStrings.primaryFont,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: attendanceData.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(attendanceData[index]['avatar']),
            ),
            title: Text(attendanceData[index]['name']),
            subtitle: Text(attendanceData[index]['status']),
            trailing: Icon(
              attendanceData[index]['isPresent'] ? Icons.check : Icons.close,
              color: attendanceData[index]['isPresent'] ? Colors.green : Colors.red,
            ),
          );
        },
      ),
    );
  }
}