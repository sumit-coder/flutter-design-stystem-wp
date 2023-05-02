import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DesignSystemDemo extends StatelessWidget {
  const DesignSystemDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // status bar color
      statusBarBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.person_2_outlined,
                  color: Color(0xFF3A3A3A),
                  size: 30,
                ),
                Icon(
                  Icons.search_outlined,
                  color: Color(0xFF3A3A3A),
                  size: 30,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              children: [
                const SizedBox(width: 12),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 16 / 6,
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          width: 2,
                          color: const Color(0xFFE6E6E3),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add),
                          Text('Favorites'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 16 / 6,
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          width: 2,
                          color: const Color(0xFFE6E6E3),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add),
                          Text('Recent'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.all(14),
              height: 144,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: const Color(0xFFF7F6F4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Enjoy 5 Deep Breaths',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Emotional care of processing world tragedies and injustices.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF292826)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                // height: 500,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return DayCard();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DayCard extends StatelessWidget {
  const DayCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
      // height: 108,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          width: 2,
          color: const Color(0xFFE6E6E3),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              const Text(
                'Enjoy 5 Deep \nBreaths',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.soap_outlined, size: 18, color: Color(0xFF333333)),
                  SizedBox(width: 4),
                  Text(
                    'Mindful Activity',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF333333), fontSize: 12),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(Icons.timer_outlined, size: 18, color: Color(0xFF333333)),
                  SizedBox(width: 4),
                  Text(
                    '3-7 min',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF333333), fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              "https://cdn.dribbble.com/users/505559/screenshots/17475512/media/f998490f9882f7bbddcfcc204bab4bb8.png?compress=1&resize=800x600",
              width: 144,
            ),
          )
        ],
      ),
    );
  }
}
