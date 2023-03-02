import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(const VideoApp());

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late List<String> _videoUrls;
  late List<String> _videoNames;
  late List<String> _userNames;
  late List<String> _timeStamps;
  late List<VideoPlayerController> _controllers;

  @override
  void initState() {
    super.initState();
    _videoUrls = [      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',    ];
    _videoNames = [      'Bee Video',      'Butterfly Video',      'Copy of Bee Video 1',      'Copy of Bee Video 2',      'Copy Bee Video 4',      'Copy of Butterfly Video 1',    ];
    _userNames = ['Beelover101','Butterflylover101','Beelover911','Kanyelover101',"Kanyelover911",'Free Thugger'];
    _timeStamps =['10','9','8','7','6','5'];
    _controllers = List.generate(_videoUrls.length,
            (index) => VideoPlayerController.network(_videoUrls[index]))
      ..forEach((controller) async {
        await controller.initialize();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube Demo',
      home: Scaffold(
        body: ListView.builder(
          itemCount: _videoUrls.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPage(
                      videoUrl: _videoUrls[index],
                      controller: VideoPlayerController.network(_videoUrls[index]),
                    ),
                  ),
                );
              },
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: VideoPlayer(_controllers[index]),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 15,
                            backgroundColor : Colors.black,
                            foregroundColor: Colors.white,
                            child: Icon(Icons.person),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_videoNames[index], style: const TextStyle(fontSize: 15),),
                              Text(_userNames[index] + "  " + _timeStamps[index] + " hours ago", style: const TextStyle(fontSize: 12),),
                            ],
                          ),
                        ],
                      ),
                  // const CircleAvatar(
                  //   radius: 15,
                  //   backgroundColor: Colors.black,
                  //   foregroundColor: Colors.white,
                  //   child: Icon(Icons.person),
                  // ),
                  //     Text(_videoNames[index])
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controllers.forEach((controller) => controller.dispose());
  }
}

class VideoPage extends StatefulWidget {
  final String videoUrl;
  final VideoPlayerController controller;

  const VideoPage({
    Key? key,
    required this.videoUrl,
    required this.controller,
  }) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Tap'),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}