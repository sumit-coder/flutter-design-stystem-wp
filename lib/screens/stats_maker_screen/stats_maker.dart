import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class StatsMaker extends StatefulWidget {
  StatsMaker({Key? key}) : super(key: key);

  @override
  State<StatsMaker> createState() => _StatsMakerState();
}

class _StatsMakerState extends State<StatsMaker> {
  String title = '';
  String description = '';
  String noteText = '';
  String sourceText = '';

  List<Map> fakeData = [
    {'name': 'Chinese', 'progress': 1311},
    {'name': 'Spanish', 'progress': 460},
    {'name': 'English', 'progress': 379},
    {'name': 'Hindi', 'progress': 341},
    {'name': 'Arabic', 'progress': 319},
    {'name': 'Bengali', 'progress': 228},
    {'name': 'Portuguese', 'progress': 221},
    {'name': 'Russian', 'progress': 154},
    {'name': 'Japanese', 'progress': 128},
    {'name': 'Lahnda', 'progress': 119},
  ];

  // WidgetsToImageController to access widget
  WidgetsToImageController controller = WidgetsToImageController();

// to save image bytes of widget
  Uint8List? bytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InteractiveViewer(
          constrained: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Preview Of Data Section
              WidgetsToImage(
                controller: controller,
                child: Container(
                  color: Colors.grey.shade200,
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // title and description
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.deepPurple,
                              width: 14,
                              height: 99,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'The World\'s Most Spoken \nLanguages ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'The World\'s Most Spoken Languages',
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 18,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                      // Data Preview
                      Container(
                        // height: 300,
                        width: 500,
                        margin: const EdgeInsets.only(top: 24),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: fakeData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return StatsInfoCard(
                              leadingText: fakeData[index]['name'],
                              progress: fakeData[index]['progress'] / fakeData[0]['progress'],
                              lastText: fakeData[index]['progress'].toString(),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 18),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '* Each language also includes',
                            style: TextStyle(fontSize: 17, color: Colors.grey.shade600),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Source: Ethnologue',
                            style: TextStyle(fontSize: 17, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),

                      SizedBox(
                        width: 500,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.public,
                                  size: 32,
                                  color: Colors.grey.shade600,
                                ),
                                const SizedBox(width: 4),
                                Icon(
                                  Icons.closed_caption_outlined,
                                  size: 34,
                                  color: Colors.grey.shade600,
                                ),
                                const SizedBox(width: 4),
                                Icon(
                                  Icons.wind_power,
                                  size: 32,
                                  color: Colors.grey.shade600,
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.flutter_dash,
                              size: 54,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  bytes = await controller.capture();
                  setState(() {});
                  // print(bytes);
                  await ImageGallerySaver.saveImage(bytes!, quality: 80, name: "hello");
                },
                child: const Text('save'),
              ),
              Container(
                width: 600,
                color: const Color(0xFFF5F7FB),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.deepPurple,
                            width: 14,
                            height: 88,
                          ),
                          const SizedBox(width: 8),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 350,
                                child: TextFormField(
                                  // controller: textEditingController,
                                  cursorColor: Colors.black,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    height: 1,
                                  ),
                                  initialValue: "The World's Most Spoken Languages",
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    isDense: true,
                                  ),
                                  // onChanged: onChangeValue,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                width: 350,
                                child: TextFormField(
                                  // controller: textEditingController,
                                  cursorColor: Colors.black,
                                  maxLines: 2,

                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 18,
                                    height: 1,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                  initialValue: "The World's Most Spoken Languages",
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                  ),
                                  // onChanged: onChangeValue,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      // height: 300,
                      width: 600,
                      // margin: const EdgeInsets.only(top: 24),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: fakeData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return StatsInfoEditCard(
                            onTapAddButton: () {
                              fakeData.add({'name': 'Jkk', 'progress': 50});
                              setState(() {});
                            },
                            onTapDeleteButton: () {
                              fakeData.removeAt(index);
                              setState(() {});
                            },
                            isShowActionButtons: fakeData.length == index + 1,
                            leadingText: fakeData[index]['name'],
                            progress: fakeData[index]['progress'] / fakeData[0]['progress'],
                            lastText: fakeData[index]['progress'].toString(),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          width: 350,
                          child: TextFormField(
                            // controller: textEditingController,
                            cursorColor: Colors.black,
                            maxLines: 1,

                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 17,
                              height: 1,
                              // fontWeight: FontWeight.bold,
                            ),
                            initialValue: "* Each language also includes",
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                            // onChanged: onChangeValue,
                          ),
                        ),
                        Container(
                          width: 350,
                          height: 34,
                          child: TextFormField(
                            // controller: textEditingController,
                            cursorColor: Colors.black,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 17,
                              height: 1,
                              // fontWeight: FontWeight.bold,
                            ),
                            initialValue: "Source: Ethnologue",
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            // onChanged: onChangeValue,
                          ),
                        ),
                        // Text(
                        //   '* Each language also includes',
                        //   style: TextStyle(fontSize: 17, color: Colors.grey.shade600),
                        // ),
                        const SizedBox(height: 4),
                        // Text(
                        //   'Source: Ethnologue',
                        //   style: TextStyle(fontSize: 17, color: Colors.grey.shade600),
                        // ),
                      ],
                    ),
                  ],
                ),
              )
              // SizedBox(width: 300, child: Image.memory(bytes!))
            ],
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.textEditingController,
    required this.fieldTitle,
    required this.fieldHintText,
    required this.onChangeValue,
    required this.inputFieldWith,
  });

  final TextEditingController textEditingController;
  final String fieldTitle;
  final String fieldHintText;
  final Function(String newValue) onChangeValue;
  final double inputFieldWith;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: inputFieldWith,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          fieldTitle.isNotEmpty
              ? Text(
                  fieldTitle,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF7B849C)),
                )
              : const SizedBox(),
          SizedBox(height: fieldTitle.isNotEmpty ? 8 : 0),
          TextFormField(
            controller: textEditingController,
            cursorColor: Colors.black,
            maxLines: 1,
            style: const TextStyle(),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              hintText: fieldHintText,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1.3, color: Color(0xFFB3BDD9)), //<-- SEE HERE
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1.3, color: Color(0xFFB3BDD9)), //<-- SEE HERE
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: onChangeValue,
          ),
        ],
      ),
    );
  }
}

class StatsInfoEditCard extends StatelessWidget {
  const StatsInfoEditCard({
    super.key,
    required this.progress,
    required this.leadingText,
    required this.lastText,
    required this.isShowActionButtons,
    required this.onTapDeleteButton,
    required this.onTapAddButton,
  });

  final double progress;
  final String leadingText;
  final String lastText;
  final bool isShowActionButtons;
  final VoidCallback onTapDeleteButton;
  final VoidCallback onTapAddButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 100,
                // height: 34,
                child: TextFormField(
                  // controller: textEditingController,
                  cursorColor: Colors.black,
                  maxLines: 1, textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1,
                  ),
                  initialValue: leadingText,
                  decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                  ),
                  // onChanged: onChangeValue,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                height: 28,
                width: 300 * progress,
                color: Colors.deepPurple,
              ),
              const SizedBox(width: 8),
              Container(
                width: 88,
                // height: 34,
                child: TextFormField(
                  // controller: textEditingController,
                  cursorColor: Colors.black,
                  maxLines: 1, textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1,
                  ),
                  initialValue: lastText,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                  ),
                  // onChanged: onChangeValue,
                ),
              ),
            ],
          ),
          Container(
            // color: Colors.red,
            child: Row(
              children: [
                isShowActionButtons
                    ? IconButton(
                        onPressed: onTapAddButton,
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.add_box_rounded,
                        ),
                      )
                    : const SizedBox(),
                IconButton(
                  onPressed: onTapDeleteButton,
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StatsInfoCard extends StatelessWidget {
  const StatsInfoCard({
    super.key,
    required this.progress,
    required this.leadingText,
    required this.lastText,
  });

  final double progress;
  final String leadingText;
  final String lastText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              leadingText,
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            height: 28,
            width: 300 * progress,
            color: Colors.deepPurple,
          ),
          const SizedBox(width: 8),
          Text(
            lastText,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
