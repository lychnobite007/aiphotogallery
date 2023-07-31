import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'get_started.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          width: Adaptive.w(100),
          padding: EdgeInsets.only(
            top: 15.sp,
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                child: GridView.builder(
                    itemCount: 18,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of containers in each row
                      crossAxisSpacing:
                          10.sp, // Spacing between containers horizontally
                      mainAxisSpacing:
                          10.sp, // Spacing between containers vertically
                    ),
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15.sp),
                        child: Container(
                          height: 24.sp,
                          width: 26.sp,
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(15.sp)),
                          child: Image.network(
                              'https://static.toiimg.com/thumb.cms?msid=80482421&height=600&width=600'),
                        ),
                      );
                    }),
              ),
              Positioned(
                bottom: 0.sp,
                child: Container(
                  width: Adaptive.w(100),
                  height: Adaptive.h(30),
                  padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.white,
                        spreadRadius: 40.sp,
                        blurRadius: 40.sp)
                  ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.sp),
                      Text('Magic AI', style: textStyle),
                      Text(
                        'Avatars',
                        style: textStyle,
                      ),
                      SizedBox(height: 15.sp),
                      Padding(
                        padding: EdgeInsets.only(left: 10.sp, right: 15.sp),
                        child: Text(
                            'Get 200+ custom avatars made by artificial intelligence.',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey)),
                      ),
                      SizedBox(height: 15.sp),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: Adaptive.w(90),
                          height: 26.sp,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            GetStartedScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.sp),
                              )),
                              child: Text(
                                'See How It Works',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.sp),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle textStyle = TextStyle(
      color: Colors.black,
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      height: 0.9);
}
