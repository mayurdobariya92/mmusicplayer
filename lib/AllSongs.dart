import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:mmusicplayer/model.dart';

class AllSongs extends StatefulWidget {
  const AllSongs({Key? key}) : super(key: key);

  @override
  State<AllSongs> createState() => _AllSongsState();
}

class _AllSongsState extends State<AllSongs> {
  AudioPlayer player = AudioPlayer();
  List<bool> statuslist = [];

  @override
  void initState() {
    super.initState();

    statuslist = List.filled(Model.songlist.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Song"),
      ),
      body: ListView.builder(
        itemCount: Model.songlist.length,
        itemBuilder: (context, index) {
          return ListTile(
            trailing: statuslist[index]
                ? IconButton(
                    onPressed: () async {
                      setState(() {
                        statuslist = List.filled(Model.songlist.length, false);
                      });
                      print(statuslist);
                      await player.stop();
                    },
                    icon: Icon(Icons.pause))
                : IconButton(
                    onPressed: () async {
                      await player.stop();
                      setState(() {
                        statuslist = List.filled(Model.songlist.length, false);
                        statuslist[index] = true;
                      });
                      print(statuslist);
                      await player
                          .play(DeviceFileSource(Model.songlist[index].data));
                    },
                    icon: Icon(Icons.pause)),
            title: Text("${Model.songlist[index].displayNameWOExt}"),
            subtitle: Text("${Model.songlist[index].duration}"),
          );
        },
      ),
    );
  }
}

///// only songs code///

// class _AllSongsState extends State<AllSongs> {
//   AudioPlayer player = AudioPlayer();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("All Song"),
//       ),
//       body: ListView.builder(
//         itemBuilder: (context, index) {
//           return ListTile(onTap: () async {
//             await player.play(DeviceFileSource(Model.songlist[index].data));
//           },
//             title: Text("${Model.songlist[index].displayNameWOExt}"),
//             subtitle: Text("${Model.songlist[index].duration}"),
//           );
//         },
//       ),
//     );
//   }
// }
