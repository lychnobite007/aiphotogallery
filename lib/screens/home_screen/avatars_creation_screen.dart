import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'avatars_screen.dart';

class AvtarCreationScreen extends StatefulWidget {
  AvtarCreationScreen({Key? key}) : super(key: key);

  @override
  State<AvtarCreationScreen> createState() => _AvtarCreationScreenState();
}

class _AvtarCreationScreenState extends State<AvtarCreationScreen> {
  TextStyle textStyle = TextStyle(fontSize: 18.sp);

  String _selectedMenuItem = 'Item 1';

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
      constraints: BoxConstraints.tight(Size(Adaptive.w(50), 42.sp)),
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

  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          // _showPopupMenu(context);
                          setState(() {
                            isCompleted = !isCompleted;
                          });

                          if (isCompleted) {
                            Future.delayed(Duration(seconds: 1), () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AvatarsScreen()));
                            });
                          }
                        },
                        icon: Icon(
                          Icons.face,
                          size: 22.sp,
                        )),
                  ],
                ),
              ),
              isCompleted
                  ? Container(
                      height: Adaptive.h(32),
                      width: Adaptive.w(100),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: CircleAvatar(
                          backgroundColor: Colors.greenAccent.withOpacity(0.2),
                          radius: 35.sp,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 21.sp,
                            child: CircleAvatar(
                                backgroundColor: Colors.greenAccent,
                                radius: 16.sp,
                                child: Icon(
                                  CupertinoIcons.checkmark_alt,
                                  color: Colors.white,
                                  size: 18.sp,
                                )),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: Adaptive.h(32),
                      width: Adaptive.w(100),
                      child: CircleAvatar(
                        radius: 20.sp,
                        backgroundColor: Colors.orange.withOpacity(0.1),
                        child: CircleAvatar(
                          backgroundColor: Colors.orange.withOpacity(0.1),
                          radius: 40.sp,
                          child: CircleAvatar(
                            backgroundColor: Colors.orange.withOpacity(0.1),
                            radius: 30.sp,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 21.sp,
                              child: CircleAvatar(
                                  backgroundColor: Colors.orange,
                                  radius: 16.sp,
                                  child: Icon(
                                    CupertinoIcons.person_solid,
                                    color: Colors.white,
                                    size: 18.sp,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
              Padding(
                padding: EdgeInsets.only(right: 15.sp, top: 10.sp, left: 15.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isCompleted
                          ? 'Your Avatars Are Ready'
                          : 'Your Avatars Are Being Created',
                      style: TextStyle(
                          fontSize: isCompleted ? 23.sp : 24.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    isCompleted
                        ? Container()
                        : Text(
                            "We'll let you know when they are ready.",
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(17.5.sp),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey.withOpacity(0.15),
                        minHeight: 11.sp,
                        color: Colors.orange,
                        value: isCompleted ? 1 : 0.8,
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Row(
                      mainAxisAlignment: isCompleted
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        isCompleted
                            ? Container()
                            : Text(
                                'Generating your avatars...',
                                style: style,
                              ),
                        isCompleted
                            ? Text(
                                'Ready',
                                style: style,
                              )
                            : Text('Ready in 32 minutes', style: style),
                      ],
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Text(
                      "FAQ",
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        onExpansionChanged: (value) {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        title: Text(
                          "Why does it take so long to create your avatars?",
                          style: textOfExpansion,
                        ),
                        childrenPadding: EdgeInsets.only(left: 29.sp),
                        tilePadding: EdgeInsets.zero,
                        leading: Icon(
                          isExpanded
                              ? CupertinoIcons.multiply
                              : CupertinoIcons.add,
                          color: Colors.grey,
                        ),
                        children: [
                          Text(
                            "We are using very complex Artificial Intelligence (AI) to create your Avatars. It takes a lot of time for our high-performance servers to create them. As a premium user, you will get your avatars faster.",
                            style: textOfExpansion2,
                          )
                        ],
                        trailing: Icon(
                          Icons.add,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        onExpansionChanged: (value) {
                          setState(() {
                            isExpanded2 = !isExpanded2;
                          });
                        },
                        title: Text(
                          "What's the difference between Free and Premium avatars?",
                          style: textOfExpansion,
                        ),
                        childrenPadding: EdgeInsets.only(left: 29.sp),
                        tilePadding: EdgeInsets.zero,
                        leading: Icon(
                          isExpanded2
                              ? CupertinoIcons.multiply
                              : CupertinoIcons.add,
                          color: Colors.grey,
                        ),
                        trailing: Icon(
                          Icons.add,
                          color: Colors.transparent,
                        ),
                        children: [
                          Text(
                            "We are using very complex Artificial Intelligence (AI) to create your Avatars. It takes a lot of time for our high-performance servers to create them. As a premium user, you will get your avatars faster.",
                            style: textOfExpansion2,
                          )
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        onExpansionChanged: (value) {
                          setState(() {
                            isExpanded3 = !isExpanded3;
                          });
                        },
                        title: Text(
                          "Are all avatars high-quality?",
                          style: textOfExpansion,
                        ),
                        childrenPadding: EdgeInsets.only(left: 29.sp),
                        tilePadding: EdgeInsets.zero,
                        leading: Icon(
                          isExpanded3
                              ? CupertinoIcons.multiply
                              : CupertinoIcons.add,
                          color: Colors.grey,
                        ),
                        trailing: Icon(
                          Icons.add,
                          color: Colors.transparent,
                        ),
                        children: [
                          Text(
                            "We are using very complex Artificial Intelligence (AI) to create your Avatars. It takes a lot of time for our high-performance servers to create them. As a premium user, you will get your avatars faster.",
                            style: textOfExpansion2,
                          )
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        onExpansionChanged: (value) {
                          setState(() {
                            isExpanded4 = !isExpanded4;
                          });
                        },
                        title: Text(
                          "Where can I follow Magic AI Avatars?",
                          style: textOfExpansion,
                        ),
                        childrenPadding: EdgeInsets.only(left: 29.sp),
                        tilePadding: EdgeInsets.zero,
                        leading: Icon(
                          isExpanded4
                              ? CupertinoIcons.multiply
                              : CupertinoIcons.add,
                          color: Colors.grey,
                        ),
                        trailing: Icon(
                          Icons.add,
                          color: Colors.transparent,
                        ),
                        children: [
                          Text(
                            "We are using very complex Artificial Intelligence (AI) to create your Avatars. It takes a lot of time for our high-performance servers to create them. As a premium user, you will get your avatars faster.",
                            style: textOfExpansion2,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  bool isExpanded = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;

  TextStyle textOfExpansion2 = TextStyle(
    fontSize: 16.sp,
    color: Colors.black,
  );

  TextStyle textOfExpansion = TextStyle(
      fontSize: 16.sp, color: Colors.grey, fontWeight: FontWeight.bold);

  TextStyle style = TextStyle(fontSize: 16.sp);
}
