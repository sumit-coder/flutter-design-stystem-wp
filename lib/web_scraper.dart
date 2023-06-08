import 'dart:convert';
import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:chaleno/chaleno.dart';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart' as wb;

class WebScraper extends StatefulWidget {
  const WebScraper({Key? key}) : super(key: key);

  @override
  State<WebScraper> createState() => _WebScraperState();
}

class _WebScraperState extends State<WebScraper> {
  Parser? parser;

  getScrapData() async {
    if (parser == null) {
      return;
    }
    List<Result>? allTablesBody = parser!.getElementsByTagName('tbody');

    List aTableAllRows = allTablesBody![1].innerHTML!.replaceAll("</tr>", "").split("<tr>");

    List<String> listOfTableData = [];
    for (var i = 0; i < aTableAllRows.length; i++) {
      String aRowDescription = aTableAllRows[i].toString().replaceAll("</td>", "").split("<td>").last;

      final webScraper = wb.WebScraper();
      webScraper.loadFromString(aTableAllRows[i].toString());
      List linkAndTitle = webScraper.getElement("a", ["href"]);
      // for (var i = 0; i < count; i++) {}
      // print(linkAndTitle);
      if (linkAndTitle.isEmpty) {
        continue;
      }
      listOfTableData.add(
          '{ "title": ${linkAndTitle.first['title']},  "url": ${linkAndTitle.first['attributes']['href']}, "description": ${aRowDescription.replaceAll("\n", "").replaceAll("&amp; ", "")}, }');
    }

    print(listOfTableData.toString());

    sendData(listOfTableData);
// [{title: LogoSear.ch, attributes: {href: https://logosear.ch/search.html}}]

    // allTablesBody!.forEach((element) {
    //   log(
    //     {
    //       "title": element.querySelectorAll("a")!.length,
    //       "link": element.querySelector("a")!.text,
    //       "shortDescription": element.querySelectorAll("tr")!.length,
    //     }.toString(),
    //   );
    // });
  }

  sendData(List data) async {
    final client = Client().setEndpoint('https://cloud.appwrite.io/v1').setProject('64803e0044c9826d779b');

    final databases = Databases(client);

    try {
      final document = databases.createDocument(
        databaseId: '6481a970aa1248a2b697',
        collectionId: '6481a9bc39b87d8f945f',
        documentId: ID.unique(),
        data: {
          "resourceTitle": "Fonts",
          "resourcesCount": data.length,
          "resourceDescription": "Websites that offer free fonts as well as font-based tools",
          "resourcesList": data,
        },
      );
      // databases.updateDocument(
      //     databaseId: '6481a970aa1248a2b697',
      //     collectionId: '6481a9bc39b87d8f945f',
      //     documentId: '6481b8a3665801de54ec',
      //     data: {
      //       "resourcesList": ["card"],
      //     });
    } on AppwriteException catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Chaleno().load('https://github.com/bradtraversy/design-resources-for-developers#table-of-contents').then((value) {
      setState(() {
        parser = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(children: [
          IconButton(
            color: Colors.deepPurple,
            onPressed: () {
              getScrapData();
            },
            icon: Icon(Icons.get_app),
          ),
          IconButton(
            color: Colors.deepPurple,
            onPressed: () {
              // sendData();
            },
            icon: Icon(Icons.send),
          ),
        ]),
      ),
    );
  }
}
