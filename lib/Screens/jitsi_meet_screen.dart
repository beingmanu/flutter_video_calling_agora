import 'package:flutter/material.dart';
import 'package:flutter_video_calling_app/utils/navigator.dart';

class JitsiScreen extends StatefulWidget {
  const JitsiScreen({super.key});

  @override
  State<JitsiScreen> createState() => _JitsiScreenState();
}

class _JitsiScreenState extends State<JitsiScreen> {
  late String id, peerId, groupChatId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("jitsi Meet")),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // navigateTo(context, MeetingScreen());
              // showModalBottomSheet(
              //   context: context,
              //   builder: (context) {
              //     return SizedBox(
              //       child: Column(
              //         children: [
              //           ListTile(
              //             onTap: () {
              //               Navigator.pop(context);
              //               String meetingLinkInstant =
              //                   fetchInstantMeetingUrl(groupChatId);
              //             },
              //             leading: Icon(Icons.flash_on),
              //             title: Text("Send instant meeting link"),
              //           ),
              //           ListTile(
              //             title: Text("Send instant meeting link"),
              //           )
              //         ],
              //       ),
              //     );
              //   },
              // );
            },
            child: const Text("Start Meet")),
      ),
    );
  }
}
