import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:labmaflutter/Screens/add.dart';
import 'package:labmaflutter/Screens/viewUpdate.dart';
import '../Album.dart';

class browser extends StatefulWidget
{
  const browser({super.key});

  @override
  State<StatefulWidget> createState() => browserState();
}

class browserState extends State<browser>
{
  final List<Album> albums = Album.init();

  Album? getAlbumById(int id)
  {
    for (Album a in albums)
    {
      if (a.id == id) return a;
    }
  }

  void update(Album newAlbum)
  {
    for(int i = 0; i < albums.length; i++)
    {
      if(albums[i].id == newAlbum.id)
      {
        albums[i] = newAlbum;
      }
    }
  }

  void removeFromList(int id)
  {
    albums.removeWhere((element) => element.id == id);
  }

  _showDialog(BuildContext context, int id)
  {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text("Confirmation required"),
          content: const Text("Are you sure you want to delete this album?"),
          actions: <Widget>
          [
            CupertinoDialogAction(
              child: const Text("Yes"),
              onPressed: ()
              {
                setState(()
                {
                  removeFromList(id);
                  Navigator.of(context).pop();
                });
              },
            ),
            CupertinoDialogAction(
              child: const Text("No"),
              onPressed: ()
              {
                setState(()
                {
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context)
  {
    List<Album> sortedAlbums = [...albums];
    sortedAlbums.sort((a, b) => a.listen ? 1 : (b.listen ? -1 : 0));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Albums",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade50,
      ),
      body: Center(
        child: Container(
            color: Colors.green.shade900,
            child: ListView.builder(
                itemCount: sortedAlbums.length,
                itemBuilder: (context, index)
                {
                  return templateAlbum(sortedAlbums[index]);
                })),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async
          {
            Album album = await Navigator.push(context,
                MaterialPageRoute(builder: (context) => addAlbumScreen()));
            setState(()
            {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Added"),
              ));
              albums.add(album);
            });
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.add)),
    );
  }

  Widget templateAlbum(album)
  {
    return Card(
        elevation: 0,
        // margin: EdgeInsets.zero,
        margin: const EdgeInsets.fromLTRB(20, 12, 30, 0),
        child: Container(
            color: Colors.green.shade900,
            child: Container(
              decoration: BoxDecoration(
                  color: album.listen
                      ? const Color(0XFFAFECB3) // Green for listened albums
                      : Colors.red.shade300, // Red for not-listened albums
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(25))),
              child: Column(
                children: <Widget>
                [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      "${album.title}    ${album.artist}     ${album.genre}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  Row(children: <Widget>
                  [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: IconButton(
                          onPressed: ()  async {
                            Album album2 = await Navigator.push(context,
                                MaterialPageRoute(builder: (context) => updateAlbumScreen(album: album!)));
                            setState(() {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Updated"),
                              ));
                              update(album2);
                            });
                          },
                          icon: const Icon(
                            CupertinoIcons.eye,
                            size: 25,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: IconButton(
                          onPressed: () => {_showDialog(context, album.id)},
                          icon: const Icon(
                            CupertinoIcons.delete,
                            size: 25,
                          )),
                    )
                  ])
                ],
              ),
            )));
  }
}