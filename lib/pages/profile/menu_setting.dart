import 'package:flutter/material.dart';
import 'package:my_architect/pages/auth_page.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_architect/pages/profile/edit_profile.dart';
import 'package:my_architect/pages/profile/profile.dart';
import 'package:my_architect/component/animation_fade.dart';

class SettingsPage extends StatelessWidget {
  static final String path = "lib/src/pages/settings/settings3.dart";
  final TextStyle headerStyle = TextStyle(
    color: Colors.grey.shade800,
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          'MyArchitect App\'s',
          textScaleFactor: 1.12,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "ACCOUNT",
              style: headerStyle,
            ),
            const SizedBox(height: 10.0),
            Card(
              elevation: 0.5,
              margin: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 0,
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://github.com/GrahadiM/MyArchitect_Web/blob/main/public/image/profile/admin.png?raw=true'),
                    ),
                    title: Text("Customer"),
                    onTap: () => Navigator.push(
                      context,
                      FadeRoute2(
                        Profile(),
                      ),
                    ),
                  ),
                  _buildDivider(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 0, bottom: 0, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Calling to admin",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        IconButton(
                          iconSize: 32.0,
                          icon: const Icon(Icons.call),
                          onPressed: () => launch('https://wa.me/085767113554'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0,
              ),
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Logout"),
                onTap: () => Navigator.push(
                  context,
                  FadeRoute2(
                    AuthPage(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60.0),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade300,
    );
  }
}
