import 'package:flutter/material.dart';
import 'package:newsharbour/Constants/AppConstants.dart';
import 'package:newsharbour/Screens/ReUsableScreenForCustomDrawer.dart';
import 'package:newsharbour/Screens/privacypolicy.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final Uri _url = Uri.parse('https://play.google.com/store/apps/dev?id=7814871565193201079');
  
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // Profile Section Header
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            accountName: const Text("News Harbour "),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/slider_one.jpg"),
            ),
            accountEmail: const Text("Welcome User"),
          ),
          // Additional List Tiles
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReUsabelScreenForCustomDrawer(label: "About Us", StringData: AppConstants.aboutustext)),
              );
            },
            leading: const Icon(Icons.info_outline),
            title: const Text("About Us"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()),
              );
            },
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text("Privacy Policy"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReUsabelScreenForCustomDrawer(label: "Contact Us", StringData: AppConstants.contactus)),
              );
            },
            leading: const Icon(Icons.mail_outline),
            title: const Text("Contact Us"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReUsabelScreenForCustomDrawer(label: "News Source", StringData: AppConstants.newssource)),
              );
            },
            leading: const Icon(Icons.newspaper),
            title: const Text("News Source"),
          ),
        ],
      ),
    );
  }
}
