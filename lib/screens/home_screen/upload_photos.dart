import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'gender_selection_screen.dart';

class UploadPhotos extends StatefulWidget {
  UploadPhotos({Key? key}) : super(key: key);

  @override
  State<UploadPhotos> createState() => _UploadPhotosState();
}

class _UploadPhotosState extends State<UploadPhotos> {
  bool isUploaded = false;

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: Adaptive.h(45),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 15.sp,
              ),
              Text(
                'Upload guidelines',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25.sp),
              Padding(
                padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        iconText(CupertinoIcons.smiley,
                            'Close to your face, not', 'too far away'),
                        iconText(
                            Icons.group, 'No other people on the', 'photo'),
                      ],
                    ),
                    SizedBox(height: 25.sp),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        iconText(CupertinoIcons.arrow_3_trianglepath,
                            'Different angles', ''),
                        iconText(Icons.person_4, 'No sunglasses and', 'scarfs'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  String _selectedMenuItem = 'Item 1';

  // Function to show the popup menu
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
      constraints: BoxConstraints.tight(Size(Adaptive.w(50), 41.sp)),
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

  Widget iconText(IconData iconData, String text, String text2) {
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.black,
          size: 22.sp,
        ),
        SizedBox(
          height: 10.sp,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 17.sp),
        ),
        Text(
          text2,
          style: TextStyle(fontSize: 17.sp),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                _showPopupMenu(context);
                _showBottomSheet(context);
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
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25.sp,
            ),
            Text(
              'Upload photos of yourself',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 5.sp,
            ),
            Text('6-12 close-up portraits where only you are seen.',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey)),
            SizedBox(
              height: 20.sp,
            ),
            SizedBox(
              width: Adaptive.w(100),
              height: 30.sp,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isUploaded = !isUploaded;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.sp),
                  )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_upload_outlined,
                        color: Colors.white,
                        size: 22.sp,
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Text(
                        'Browse Photos',
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 20.sp,
            ),
            SizedBox(
              width: Adaptive.w(100),
              height: 30.sp,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.sp),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black,
                        size: 22.sp,
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      Text(
                        'Take Selfie',
                        style: TextStyle(color: Colors.black, fontSize: 16.sp),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 20.sp,
            ),
            isUploaded
                ? Container(
                    height: Adaptive.h(30),
                    child: GridView.builder(
                        itemCount: 6,
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
                                  'https://stylesatlife.com/wp-content/uploads/2021/06/Manu-Bora.jpg',
                                  fit: BoxFit.fitWidth),
                            ),
                          );
                        }),
                  )
                : Container()
          ],
        ),
      ),
      bottomSheet: Container(
        width: Adaptive.w(100),
        height: 38.sp,
        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.05)),
        child: Padding(
          padding: EdgeInsets.only(left: 18.sp, right: 18.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.lightbulb_outline_rounded,
                    size: 22.sp,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  Text(
                    'Guidelines',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ],
              ),
              isUploaded
                  ? SizedBox(
                      height: 28.sp,
                      width: 50.sp,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.sp))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        GenderSelectionScreen()));
                          },
                          child: Text(
                            'Submit Photos',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.sp),
                          )),
                    )
                  : Text(
                      '0 / 6 photos',
                      style: TextStyle(fontSize: 16.sp),
                    )
            ],
          ),
        ),
      ),
    ));
  }

  TextStyle textStyle = TextStyle(fontSize: 18.sp);
}
