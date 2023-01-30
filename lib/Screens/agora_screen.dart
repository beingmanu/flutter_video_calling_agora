import 'package:flutter/material.dart';
import 'package:flutter_video_calling_app/utils/navigator.dart';
import 'package:flutter_video_calling_app/video_call_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';

class AgoraScreen extends StatefulWidget {
  const AgoraScreen({super.key});

  @override
  State<AgoraScreen> createState() => _AgoraScreenState();
}

class _AgoraScreenState extends State<AgoraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () => navigateTo(context, const NewMeetingScreen()),
              icon: const Icon(Icons.add),
              label: const Text("New Meeting"),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(350, 30), backgroundColor: Colors.blue),
            ),
            const Divider(thickness: 1, indent: 30, height: 40, endIndent: 30),
            OutlinedButton.icon(
                onPressed: () => navigateTo(context, const JoinMeetingScreen()),
                icon: const Icon(Icons.margin),
                label: const Text("Join a Meeting..."))
          ],
        ),
      ),
    );
  }
}

class JoinMeetingScreen extends StatefulWidget {
  const JoinMeetingScreen({super.key});

  @override
  State<JoinMeetingScreen> createState() => _JoinMeetingScreenState();
}

class _JoinMeetingScreenState extends State<JoinMeetingScreen> {
  final TextEditingController _codecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Enter Meeting code below"),
            SizedBox(
              width: size.width * .8,
              child: TextField(
                controller: _codecontroller,
              ),
            ),
            ElevatedButton(
                onPressed: () => navigateTo(
                    context,
                    VCScreenAgora(
                      channelName: _codecontroller.text.trim(),
                    )),
                child: const Text("Join"))
          ],
        ),
      ),
    );
  }
}

class NewMeetingScreen extends StatefulWidget {
  const NewMeetingScreen({super.key});

  @override
  State<NewMeetingScreen> createState() => _NewMeetingScreenState();
}

class _NewMeetingScreenState extends State<NewMeetingScreen> {
  final TextEditingController codecontroller = TextEditingController();
  String _meetingCode = "abcdefgh";
  @override
  void initState() {
    var uuid = const Uuid();
    _meetingCode = uuid.v4().substring(0, 8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Your meeting is ready"),
            SizedBox(
                width: size.width * .8,
                child: ListTile(
                  leading: const Icon(Icons.link),
                  title: SelectableText(_meetingCode),
                  trailing: const Icon(Icons.copy),
                )),
            const Divider(thickness: 1, indent: 30, height: 40, endIndent: 30),
            ElevatedButton.icon(
              onPressed: () =>
                  Share.share("Your meeting code is ${_meetingCode.trim()}"),
              icon: const Icon(Icons.share),
              label: const Text("Share invite"),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(350, 30), backgroundColor: Colors.blue),
            ),
            OutlinedButton.icon(
                onPressed: () => navigateTo(
                    context, VCScreenAgora(channelName: _meetingCode.trim())),
                icon: const Icon(Icons.video_call),
                label: const Text("Start call"))
          ],
        ),
      ),
    );
  }
}
