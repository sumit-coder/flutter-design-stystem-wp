import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BookDemoScreen extends StatefulWidget {
  const BookDemoScreen({Key? key}) : super(key: key);

  @override
  State<BookDemoScreen> createState() => _BookDemoScreenState();
}

class _BookDemoScreenState extends State<BookDemoScreen> {
  double flipValue = 0;
  bool flipValue2 = false;
  List listOfPages = [
    'page 1',
    'page 2',
    'page 3',
    'page 4',
    'page 5',
    'page 6',
    'page 7',
    'page 8',
    'page 9',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    width: 154,
                    decoration: BoxDecoration(
                      color: const Color(0xFF293146),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const BookPage(isFlipped: false, pageTitle: '4'),
                  const BookPage(isFlipped: false, pageTitle: '3'),
                  const BookPage(isFlipped: false, pageTitle: '2'),
                  const BookPage(isFlipped: false, pageTitle: '1'),
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  // if (flipValue + 0.09 >= 1) {
                  //   return;
                  // }
                  setState(() {
                    flipValue2 = !flipValue2;
                    log(flipValue.toString());
                  });
                },
                child: Text('Flip')),
          ],
        ),
      ),
    );
  }
}

class BookPage extends StatefulWidget {
  const BookPage({
    super.key,
    required this.isFlipped,
    required this.pageTitle,
  });

  final bool isFlipped;
  final String pageTitle;

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  bool onSwipe = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        print("drag end");
        // if (details.velocity.pixelsPerSecond ) {

        // }
        setState(() {
          onSwipe = !onSwipe;
        });
      },
      onTap: () {
        print("object");
      },
      onVerticalDragEnd: (details) {
        print('v Drag');
      },
      child: Container(
        height: 200,
        width: 154,
        decoration: BoxDecoration(
          color: const Color(0xFF4769E7),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(widget.pageTitle),
      ),
    ).animate(target: onSwipe ? 1 : 0).flipH(end: 1, begin: 0, duration: 784.ms, alignment: Alignment.centerLeft);
  }
}
