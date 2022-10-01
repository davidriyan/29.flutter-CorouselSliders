import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:corousel_slide/main_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<MainPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<Widget> app = [
    Container(
      width: double.maxFinite,
      height: 200,
      color: Colors.amber,
    ),
    Container(
      width: double.maxFinite,
      height: 200,
      color: Colors.green,
    ),
    Container(
      width: double.maxFinite,
      height: 200,
      color: Colors.red,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carousel slider')),
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //membuat list widget
            CarouselSlider(
              items: app,
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            //membuat indicatornya
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: app.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
