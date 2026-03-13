import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SleepPlayerScreen extends StatefulWidget {
  final String title;
  final String url;

  const SleepPlayerScreen({required this.title, required this.url});

  @override
  State<SleepPlayerScreen> createState() => _SleepPlayerScreenState();
}

class _SleepPlayerScreenState extends State<SleepPlayerScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool isPlaying = false;
  bool isFavorite = false;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  Future<void> initPlayer() async {
    await _audioPlayer.setUrl(widget.url);

    duration = _audioPlayer.duration ?? Duration.zero;

    _audioPlayer.positionStream.listen((p) {
      setState(() {
        position = p;
      });
    });

    _audioPlayer.durationStream.listen((d) {
      setState(() {
        duration = d ?? Duration.zero;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String formatTime(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img_4.png'),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(3, 23, 77, 1),
                  Color.fromRGBO(30, 37, 94, 1),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  /// Top Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _circleButton(Icons.close, () {
                        Navigator.pop(context);
                      }),

                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                            child: AnimatedScale(
                              scale: isFavorite ? 1.2 : 1,
                              duration: Duration(milliseconds: 200),
                              child: _circleButton(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                null,
                                iconColor: isFavorite
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          _circleButton(Icons.download, () {}),
                        ],
                      ),
                    ],
                  ),

                  //Spacer(),
                  SizedBox(height: 286),

                  /// Title
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "sleep music",
                    style: TextStyle(letterSpacing: 1.5, color: Colors.grey),
                  ),

                  SizedBox(height: 40),

                  /// Controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.replay_10),
                        iconSize: 32,
                        color: Colors.white,
                        onPressed: () {
                          final newPos = position - Duration(seconds: 15);
                          _audioPlayer.seek(newPos);
                        },
                      ),

                      SizedBox(width: 20),

                      GestureDetector(
                        onTap: () async {
                          if (isPlaying) {
                            await _audioPlayer.pause();
                          } else {
                            await _audioPlayer.play();
                          }
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.grey,
                            size: 40,
                          ),
                        ),
                      ),

                      SizedBox(width: 20),

                      IconButton(
                        icon: Icon(Icons.forward_10),
                        iconSize: 32,
                        color: Colors.white,
                        onPressed: () {
                          final newPos = position + Duration(seconds: 15);
                          _audioPlayer.seek(newPos);
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 40),

                  /// Slider
                  Slider(
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble().clamp(
                      0,
                      duration.inSeconds.toDouble(),
                    ),
                    onChanged: (value) {
                      _audioPlayer.seek(Duration(seconds: value.toInt()));
                    },
                  ),

                  /// Time Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatTime(position),
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        formatTime(duration),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),

                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleButton(
    IconData icon,
    VoidCallback? onTap, {
    Color iconColor = Colors.white,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Color.fromRGBO(3, 23, 76, 1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor),
      ),
    );
  }
}
