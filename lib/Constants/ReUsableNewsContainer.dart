import 'package:flutter/material.dart';
import 'package:newsharbour/Screens/DetailsScreen.dart';

class ReUsableNewsContainer extends StatelessWidget {
  final String url;
  final String imageurl;
  final String title;
  final String description;

  const ReUsableNewsContainer({
    super.key,
    required this.url,
    required this.imageurl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsScreen(url: url)),
        );
      },
      child: Container(
        height: 120,
        margin: const EdgeInsets.all(5.0),
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                imageurl == "null"
                    ? "https://images.app.goo.gl/2q77CPfaKAj2ynN7A"
                    : imageurl,
              ),
              radius: 40,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title == "null" ? "Null" : title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description == "null" ? "Null" : description,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
