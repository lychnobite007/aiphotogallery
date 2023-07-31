import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PremiumScreen extends StatefulWidget {
  PremiumScreen({Key? key}) : super(key: key);

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: Adaptive.w(100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.sp,
              ),
              Text(
                'Users Love Our App',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 15.sp,
              ),
              Container(
                width: Adaptive.w(90),
                height: Adaptive.h(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    border: Border.all(color: Colors.grey)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color: Colors.orange,
                        );
                      }),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                      child: Text(
                        'The AI generates better photos compared to other competitors out there. It is worth trying the paid version.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text(
                      '- Punith',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Container(
                height: Adaptive.h(16),
                width: Adaptive.w(100),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.sp),
                        bottomRight: Radius.circular(15.sp)),
                    child: Container(
                      width: Adaptive.w(29),
                      height: Adaptive.h(16),
                      child: Image.network(url, fit: BoxFit.fitHeight),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.sp),
                      child: Container(
                        width: Adaptive.w(35),
                        height: Adaptive.h(16),
                        child: Image.network(url, fit: BoxFit.fitHeight),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.sp),
                      bottomLeft: Radius.circular(15.sp),
                    ),
                    child: Container(
                      width: Adaptive.w(29),
                      height: Adaptive.h(16),
                      child: Image.network(url, fit: BoxFit.fitHeight),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 15.sp,
              ),
              Padding(
                padding: EdgeInsets.only(left: 17.5.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '200+ Premium Avatars',
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      'Premium profile with high quality avatars.',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                    Column(
                      children: List.generate(points.length, (index) {
                        return Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Row(
                            children: [
                              Icon(Icons.check, size: 19.sp),
                              SizedBox(
                                width: 10.sp,
                              ),
                              Text(
                                points[index],
                                style: TextStyle(fontSize: 17.sp),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.sp,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.sp, right: 16.sp),
                child: Column(
                  children: [
                    RadioListTile<String>(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 5.sp,
                              color: selectedRadioTile == '1'
                                  ? Colors.orange
                                  : Colors.grey),
                          borderRadius: BorderRadius.circular(20.sp)),
                      title: Text(
                        '1 Week',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      subtitle: Text(
                        'First 3 days free, then 0.99\$/week',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      ),
                      value: '1',
                      groupValue: selectedRadioTile,
                      activeColor: Colors.orange,
                      selected: selectedRadioTile == '1',
                      onChanged: (val) {
                        setSelectedRadio(val!);
                      },
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    RadioListTile<String>(
                      activeColor: Colors.orange,
                      selected: selectedRadioTile == '2',
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 5.sp,
                              color: selectedRadioTile == '2'
                                  ? Colors.orange
                                  : Colors.grey),
                          borderRadius: BorderRadius.circular(20.sp)),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Annual',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                              Text(
                                'One time payment, \$3.99',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            height: 23.sp,
                            width: 35.sp,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(20.sp)),
                            child: Center(
                              child: Text('%90 Off',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        '',
                        style: TextStyle(
                            fontSize: 1.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      ),
                      value: '2',
                      groupValue: selectedRadioTile,
                      onChanged: (val) {
                        setSelectedRadio(val!);
                      },
                    ),
                    SizedBox(
                      height: 15.sp,
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
                          'Start Free Trial',
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  List points = [
    '26 different themes',
    'Higher resolution & more details',
    'Photo realistic avatars',
    'Expand 10 avatars to full-body shots',
    'Faster generation of your avatars',
    'No ads & no watermarks'
  ];

  String weekly = 'Weekly';
  bool isSelectedWeekly = false;
  bool isSelectedAnnul = false;

  String? selectedRadioTile;

  setSelectedRadio(String val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  String url =
      'https://img.freepik.com/premium-photo/young-brazilian-man-isolated-white-background-laughing_1368-358225.jpg';
}
