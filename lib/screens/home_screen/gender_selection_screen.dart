import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'avatars_creation_screen.dart';

class GenderSelectionScreen extends StatefulWidget {
  GenderSelectionScreen({Key? key}) : super(key: key);

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  bool isSelected = false;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: Container(
          width: Adaptive.w(100),
          height: 35.sp,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.05)),
          child: Padding(
            padding: EdgeInsets.only(left: 18.sp, right: 18.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 28.sp,
                  width: Adaptive.w(90),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.sp))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AvtarCreationScreen()));
                      },
                      child: Text(
                        'Create Your Avatars',
                        style: TextStyle(color: Colors.white, fontSize: 15.sp),
                      )),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 15.sp, top: 15.sp, right: 15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Who is on the photos?',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        width: Adaptive.w(92),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(2, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  isSelected = true;
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                height: Adaptive.h(15),
                                width: Adaptive.w(43),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    border: Border.all(
                                        color:
                                            isSelected && index == selectedIndex
                                                ? Colors.blue
                                                : Colors.black)),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(icons[index],
                                          color: isSelected &&
                                                  index == selectedIndex
                                              ? Colors.blue
                                              : Colors.black,
                                          size: 25.sp),
                                      SizedBox(
                                        height: 10.sp,
                                      ),
                                      Text(
                                        text[index],
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: isSelected &&
                                                  index == selectedIndex
                                              ? Colors.blue
                                              : Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.sp,
                ),
                Row(
                  children: [
                    Text(
                      'Your email address ',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '(optional)',
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  'Always have access to your avatars',
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 25.sp,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18.sp),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List icons = [Icons.woman, Icons.man];

  List text = ['Woman', 'Man'];
}
