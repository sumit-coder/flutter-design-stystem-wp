import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScreenshotApp extends StatefulWidget {
  const ScreenshotApp({Key? key}) : super(key: key);

  @override
  State<ScreenshotApp> createState() => _ScreenshotAppState();
}

class _ScreenshotAppState extends State<ScreenshotApp> {
  String defaultImageUrl = '';
  bool onHover = false;

  getFile() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    print(image!.path);
    setState(() {
      defaultImageUrl = image.path;
    });
    // File(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 1632 / 3,
              width: 783 / 3,
              padding: EdgeInsets.only(top: 11.3, left: 12.5, right: 12.5, bottom: 11.5),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/device-test.png"),
                ),
              ),
              margin: EdgeInsets.only(top: 11.15, left: 12.5),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black,
                        // color: Colors.black,
                      ),
                      child: InkWell(
                        onTap: () {
                          getFile();
                        },
                        child: defaultImageUrl != ''
                            ? Image.network(
                                defaultImageUrl,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                "assets/screen-shot.jpg",
                                alignment: Alignment.topCenter,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 13,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(44 / 3),
                      child: Image.asset(
                        "assets/device-test-cam.png",
                        height: 41 / 3,
                        width: 44 / 3,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
