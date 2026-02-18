import 'dart:io';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meditationapp_task/widgets/player_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class CourseDetailScreen extends StatefulWidget {
  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen>
    with SingleTickerProviderStateMixin {

  final AudioPlayer _audioPlayer = AudioPlayer();

  bool isFavorite = false;
  int selectedVoice = 0;
  int currentPlayingIndex = -1;

  late TabController _tabController;

  final List<Map<String, String>> tracks = [
    {
      "title": "Focus Attention",
      "duration": "10 MIN",
      "url":
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
    },
    {
      "title": "Body Scan",
      "duration": "5 MIN",
      "url":
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3"
    },
    {
      "title": "Making Happiness",
      "duration": "3 MIN",
      "url":
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3"
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Future<void> playAudio(String url, int index) async {
    if (currentPlayingIndex == index) {
      await _audioPlayer.stop();
      setState(() => currentPlayingIndex = -1);
    } else {
      await _audioPlayer.setUrl(url);
      await _audioPlayer.play();
      setState(() => currentPlayingIndex = index);
    }
  }

  Future<void> downloadAudio(String url) async {
    final response = await http.get(Uri.parse(url));
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/audio.mp3');
    await file.writeAsBytes(response.bodyBytes);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Downloaded Successfully")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          /// TOP IMAGE
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(25)),
                child: Image.asset(
                  "assets/images/morning.png",
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 40,
                left: 20,
                child: _circleIcon(Icons.arrow_back, () {
                  Navigator.pop(context);
                }),
              ),

              Positioned(
                top: 40,
                right: 20,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() => isFavorite = !isFavorite);
                      },
                      child: AnimatedScale(
                        scale: isFavorite ? 1.3 : 1.0,
                        duration: Duration(milliseconds: 200),
                        child: _circleIcon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          null,
                          iconColor:
                          isFavorite ? Colors.red : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    _circleIcon(Icons.download, () {
                      downloadAudio(tracks[0]['url']!);
                    }),
                  ],
                ),
              ),
            ],
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Happy Morning",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),

                  SizedBox(height: 6),

                  Text(
                    "COURSE",
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 1.5,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: 14),

                  Text(
                    "Ease the mind into a restful night's sleep with these deep, ambient tones.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: 20),

                  Row(
                    children: [
                      Icon(Icons.favorite, color: Colors.pink, size: 18),
                      SizedBox(width: 6),
                      Text("24.234 Favorits"),
                      SizedBox(width: 30),
                      Icon(Icons.headphones, color: Colors.blue, size: 18),
                      SizedBox(width: 6),
                      Text("34.234 Listening"),
                    ],
                  ),

                  SizedBox(height: 30),

                  Text(
                    "Pick a Nrrator",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 15),


                  /// SMOOTH TAB
                  TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.blue,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: "MALE VOICE"),
                      Tab(text: "FEMALE VOICE"),
                    ],
                  ),

                  SizedBox(height: 20),

                  Expanded(
                    child: ListView.builder(
                      itemCount: tracks.length,
                      itemBuilder: (context, index) {
                        final track = tracks[index];
                        bool isActive =
                            currentPlayingIndex == index;

                        return ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PlayerScreen(
                                  title: track['title']!,
                                  url: track['url']!,
                                ),
                              ),
                            );
                          },

                          leading: GestureDetector(
                            onTap: () =>
                                playAudio(track['url']!, index),
                            child: CircleAvatar(
                              backgroundColor: isActive
                                  ? Colors.blue
                                  : Colors.grey.shade300,
                              child: Icon(
                                isActive
                                    ? Icons.stop
                                    : Icons.play_arrow,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          title: Text(track['title']!),
                          subtitle: Text(track['duration']!),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleIcon(IconData icon, VoidCallback? onTap,
      {Color iconColor = Colors.black}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20, color: iconColor),
      ),
    );
  }
}
