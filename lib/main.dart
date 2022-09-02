import 'package:flutter/material.dart';
import 'package:mmusicplayer/AllSongs.dart';
import 'package:mmusicplayer/model.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

void main()
{
  runApp(MaterialApp(home: Splash(),));
}
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
   OnAudioQuery _audioQuery = OnAudioQuery();


   @override
  void initState() {
    super.initState();
        loadAllMusic();
  }
  loadAllMusic()
  async {
    var status = await Permission.storage.status;
    if(status.isDenied)
      {
        await[Permission.storage].request();
      }
    Model.songlist = await _audioQuery.querySongs();
    print(Model.songlist);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return AllSongs();
    },));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Loading..."),),
    );
  }
}
