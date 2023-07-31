import 'package:aiphotogallery/screens/premium_screen/premium_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../settings_screen/settings_screen.dart';

class AvatarsScreen extends StatefulWidget {
  const AvatarsScreen({Key? key}) : super(key: key);

  @override
  State<AvatarsScreen> createState() => _AvatarsScreenState();
}

class _AvatarsScreenState extends State<AvatarsScreen> {
  String _selectedMenuItem = 'Item 1';

  TextStyle textStyle = TextStyle(fontSize: 18.sp);

  void _showPopupMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderObject? overlay =
        Overlay.of(context).context.findRenderObject();
    final Offset topLeft = Offset(1, 1); // Define your desired position here

    // Create and show the popup menu
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        topLeft.dx + 1, // Left
        topLeft.dy + 37.sp, // Top
        topLeft.dx, // Right
        topLeft.dy, // Bottom
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.sp)),
      // constraints: BoxConstraints.tight(Size(Adaptive.w(50), 50.sp)),

      items: [
        PopupMenuItem<String>(
          value: 'Item 1',
          child: Text('Sign In', style: textStyle),
        ),
        PopupMenuItem<String>(
          value: 'Item 2',
          child: Text(
            'Legal',
            style: textStyle,
          ),
        ),

        // Add more menu items as needed
      ],
    ).then((value) {
      // Update the selected menu item when a menu item is chosen
      if (value != null) {
        setState(() {
          _selectedMenuItem = value;
        });
      }
    });
  }

  Widget customBox(String text) {
    return Container(
      height: 30.sp,
      width: Adaptive.w(100),
      child: Padding(
        padding: EdgeInsets.only(left: 15.sp, top: 15.sp),
        child: Text(
          text,
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
    );
  }

  void showTopRightDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(top: 32.sp, right: 20.sp),
          child: Align(
            alignment: Alignment.topRight,
            child: Material(
              borderRadius: BorderRadius.circular(8.sp),
              child: Container(
                height: Adaptive.h(40),
                width: Adaptive.w(65),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.sp,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.sp, top: 12.sp),
                        child: Text(
                          'Profiles',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ),
                      // Profiles
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 30.sp,
                          width: Adaptive.w(100),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.sp),
                            child: Row(
                              children: [
                                Icon(Icons.add,
                                    size: 24.sp, color: Colors.grey),
                                SizedBox(
                                  width: 12.sp,
                                ),
                                Text(
                                  'New Profile',
                                  style: TextStyle(fontSize: 18.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 30.sp,
                          width: Adaptive.w(100),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.sp),
                            child: Row(
                              children: [
                                Icon(Icons.face,
                                    size: 24.sp, color: Colors.grey),
                                SizedBox(
                                  width: 12.sp,
                                ),
                                Text(
                                  'Profile #1',
                                  style: TextStyle(fontSize: 18.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          width: Adaptive.w(100),
                          child: Divider(
                            color: Colors.grey,
                            height: 15.sp,
                          )),
                      SizedBox(
                        height: 5.sp,
                      ),
                      // Settings
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingsScreen()));
                          },
                          child: customBox('Settings')),
                      // Rate Us
                      InkWell(onTap: () {}, child: customBox('Rate Us')),
                      // Support
                      InkWell(onTap: () {}, child: customBox('Support')),
                      // Legal
                      InkWell(onTap: () {}, child: customBox('Legal')),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 35.sp,
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PremiumScreen()));
              },
              child: Container(
                height: 28.sp,
                width: Adaptive.w(62.5),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(35.sp)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.wand_stars,
                      color: Colors.white,
                    ),
                    SizedBox(width: 15.sp),
                    Text(
                      'Enhance Your Avatars',
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ],
                ),
              ),
            ),
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.transparent,
              splashBorderRadius: BorderRadius.circular(25.sp),
              labelStyle: TextStyle(fontSize: 16.sp, color: Colors.white),
              padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
              labelPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 0.sp,
              indicator: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25.sp),
              ),
              tabs: [
                Tab(
                  text: 'Watercolor',
                ),
                Tab(text: 'Business'),
                Tab(text: 'Old'),
                Tab(text: 'Painting'),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showTopRightDialog(context);
                  },
                  icon: Icon(
                    Icons.face,
                    size: 22.sp,
                  )),
              SizedBox(
                width: 10.sp,
              )
            ],
          ),
          body: TabBarView(
            children: [
              tabsInBody(
                  'https://static.toiimg.com/thumb.cms?msid=80482421&height=600&width=600'), // Watercolor
              tabsInBody(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR197kMTUvs8K2diDPXJg9WtgwVt1SgLnWa4w&usqp=CAU'), // Business
              tabsInBody(
                  'https://img.mensxp.com/media/content/2018/Jun/indian-models-to-follow-on-instagram-for-everyday-style-inspiration-500-5-1528118320.jpg'), // Old
              tabsInBody(
                  'https://i0.wp.com/4.bp.blogspot.com/-gXF6kT8-pjM/V7Hq4i9GOwI/AAAAAAAABDY/aIf2qPT4ZP8XB8TjP8sjYIHs3juUCJ3JwCLcB/s1600/smaransahu.jpg?ssl=1'), // Painting
            ],
          ),
        ),
      ),
    );
  }

  Widget tabsInBody(String url) {
    return Padding(
      padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
      child: Column(
        children: [
          SizedBox(
            height: 15.sp,
          ),
          Container(
            height: 28.sp,
            width: Adaptive.w(100),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15.sp)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Unlock 12 New Avatars for Free',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 10.sp,
                ),
                Icon(Icons.arrow_forward)
              ],
            ),
          ),
          SizedBox(
            height: 15.sp,
          ),
          SingleChildScrollView(
            child: Container(
              height: Adaptive.h(68),
              child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of containers in each row
                    crossAxisSpacing:
                        14.sp, // Spacing between containers horizontally
                    mainAxisSpacing:
                        14.sp, // Spacing between containers vertically
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
                        child: Image.network(url, fit: BoxFit.fitWidth),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
