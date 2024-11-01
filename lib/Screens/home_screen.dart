import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsharbour/Constants/CustomDrawer.dart';
import 'package:newsharbour/Constants/ReUsableContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imagelist = [
    "assets/images/slider_one.jpg",
    "assets/images/slider_two.jpg",
    "assets/images/slider_three.jpg",
    "assets/images/slider_four.jpg",
  ];

  List<String> labels = ["Technology", "Sports", "Economy", "Politics", "StartUps", "AI"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text(
          "News Harbour",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        elevation: 5.0,
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          /// AutoImageSlider Container
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            child: CarouselSlider(
              items: imagelist.map((item) => BuildEachImage(item)).toList(),
              options: CarouselOptions(autoPlay: true),
            ),
          ),
          /// Expanded Grid View
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: labels.length,
              itemBuilder: (context, index) {
                return ReUsablecontainer(label: labels[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget BuildEachImage(String imagepath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagepath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
