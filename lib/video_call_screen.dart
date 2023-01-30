import 'dart:convert';

import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video_calling_app/Screens/agora_screen.dart';
import 'package:flutter_video_calling_app/utils/navigator.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart';

// ignore: must_be_immutable
class VCScreenAgora extends StatefulWidget {
  String channelName;
  VCScreenAgora({
    Key? key,
    required this.channelName,
  }) : super(key: key);

  @override
  State<VCScreenAgora> createState() => _VCScreenAgoraState();
}

class _VCScreenAgoraState extends State<VCScreenAgora> {
  late final AgoraClient _client;
  bool _isLoading = true;
  String _tempToken = "";
  @override
  void initState() {
    gettoken();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gettoken() async {
    String link =
        "https://agora-node-tokenserver.manishsapela.repl.co/access_token?channelName=${widget.channelName}";
    Response response = await get(Uri.parse(link));
    Map data = jsonDecode(response.body);

    setState(() {
      _tempToken = data["token"];
    });
    _client = AgoraClient(
        agoraConnectionData: AgoraConnectionData(
          appId: "c280a9d8d2894f9e919f5a14ae20fd29",
          tempToken: _tempToken,
          channelName: widget.channelName,
        ),
        enabledPermission: [
          Permission.camera,
          Permission.microphone,
        ]);
    await _client.initialize();

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
          _isLoading = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        body: Stack(
          children: [
            AgoraVideoViewer(
              client: _client,
              floatingLayoutSubViewPadding: const EdgeInsets.all(5),
            ),
            AgoraVideoButtons(
              client: _client,
              enabledButtons: const [BuiltInButtons.callEnd],
              onDisconnect: () async {
                await Future.delayed(const Duration(seconds: 2))
                    .then((value) => Navigator.pop(context, (route) => false));
              },
            )
          ],
        ),
      );
    }
  }
}
