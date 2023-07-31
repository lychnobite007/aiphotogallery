import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.face,
                size: 22.sp,
              )),
          SizedBox(
            width: 10.sp,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(left: 15.sp, right: 15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.sp,
            ),
            Text(
              'Your Account',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 7.sp,
            ),
            Text('Add an email address to always have access to your avatars.',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black)),
            SizedBox(
              height: 15.sp,
            ),
            SizedBox(
              width: Adaptive.w(100),
              height: 30.sp,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.withOpacity(0.05),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.sp),
                    )),
                child: Text(
                  'Add Email Address',
                  style: TextStyle(color: Colors.black, fontSize: 16.sp),
                ),
              ),
            ),
            SizedBox(
              height: 25.sp,
            ),
            SizedBox(
              width: Adaptive.w(100),
              height: 30.sp,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.sp),
                )),
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ),
            ),
            SizedBox(
              height: 25.sp,
            ),
            Container(
              width: Adaptive.w(100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Restore Purchase',
                        style: TextStyle(color: Colors.black, fontSize: 16.sp),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Delete Your Account',
                        style: TextStyle(fontSize: 16.sp),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
