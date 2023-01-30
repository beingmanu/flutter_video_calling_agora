import 'package:flutter/material.dart';
import 'package:flutter_video_calling_app/Screens/agora_screen.dart';

import '../utils/navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              MyWidget(
                title: "agora",
                size: size,
                icon: Icons.flutter_dash,
                onTap: () => navigateTo(context, const AgoraScreen()),
              ),
              MyWidget(
                title: "jitsi",
                size: size,
                icon: Icons.flourescent,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final VoidCallback onTap;
  final icon;
  final title;
  final size;
  const MyWidget({
    Key? key,
    required this.onTap,
    this.icon,
    this.title,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * .4,
      width: size.width * .3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onTap,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Card(
                child: Center(
                  child: Icon(icon),
                ),
              ),
            ),
          ),
          Text(title)
        ],
      ),
    );
  }
}
