import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Album.dart';

class updateAlbumScreen extends StatefulWidget
{
  const updateAlbumScreen({super.key, required this.album});

  final Album album;

  @override
  State<StatefulWidget> createState() => updateAlbumScreenState();
}

class updateAlbumScreenState extends State<updateAlbumScreen>
{
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String artist;
  late String rating;
  late String release;
  late String genre;
  late bool listen;

  @override
  void initState() {
    super.initState();
    title = widget.album.title;
    artist = widget.album.artist;
    rating = widget.album.rating;
    release = widget.album.release.toString();
    genre = widget.album.genre;
    listen = widget.album.listen;
  }

  bool isValidRating(stringToTest)
  {
    try
    {
      int outputInger = int.parse(stringToTest);
    }
    catch (e)
    {
      return false;
    }
    int convertedRating = int.parse(stringToTest);
    if (convertedRating < 0 || convertedRating > 100)
    {
      return false;
    }
    return true;
  }

  bool isValidRelease(stringToTest)
  {
    try
    {
      int outputInger = int.parse(stringToTest);
    }
    catch (e)
    {
      return false;
    }
    int convertedRelease = int.parse(stringToTest);
    if (convertedRelease < 0)
    {
      return false;
    }
    return true;
  }


  @override
  Widget build(BuildContext context)
  {

    // String title = widget.album.title;
    // String artist = widget.album.artist;
    // String rating = widget.album.rating;
    // String release = widget.album.release.toString();
    // String genre = widget.album.genre;
    // bool listen = widget.album.listen;

    return Scaffold(
        backgroundColor: Colors.green.shade900,
        body: Container(
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                      Row(
                        children: <Widget>
                        [
                          Container(
                            padding: const EdgeInsets.fromLTRB(150, 80, 0, 0),
                            child: const Text('View&Edit',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0)),
                          ),
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
                          child: Text("Title:",
                            style: TextStyle(
                                fontSize: 20
                            ),)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: SizedBox(
                          width: 370,
                          child: TextFormField(
                            initialValue: widget.album.title,
                            validator: (value)
                            {
                              if (value == null || value.isEmpty)
                              {
                                return "Input required";
                              }
                              else
                              {
                                return null;
                              }
                            },
                            onChanged: (value) => title = value,
                            decoration: const InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Color(0XFFAFECB3),
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20),
                              hintText: 'Title',
                            ),
                          ),
                        ),
                      ),
                      const Text("Artist", style: TextStyle(
                          fontSize: 20
                      ),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: SizedBox(
                          width: 370,
                          child: TextFormField(
                            initialValue: widget.album.artist,
                            validator: (value)
                            {
                              if (value == null || value.isEmpty)
                              {
                                return "Input required";
                              }
                              else
                              {
                                return null;
                              }
                            },
                            onChanged: (value) => artist = value,
                            decoration: const InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Color(0XFFAFECB3),
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20),
                              hintText: 'Artist',
                            ),
                          ),
                        ),
                      ),
                      const Text("Rating",
                        style: TextStyle(
                            fontSize: 20
                        ),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: SizedBox(
                          width: 370,
                          child: TextFormField(
                            initialValue: widget.album.rating,
                            validator: (value)
                            {
                              if (value == null || value.isEmpty)
                              {
                                return "Input required";
                              }
                              else if (!isValidRating(value) && value != "-")
                              {
                                return "Rating must be a positive integer up to 100";
                              }
                              else
                              {
                                return null;
                              }
                            },
                            onChanged: (value) => rating = value,
                            decoration: const InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Color(0XFFAFECB3),
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 21.0),
                              hintText: 'Rating',
                            ),
                          ),
                        ),
                      ),
                      const Text("Release",
                        style: TextStyle(
                            fontSize: 20
                        ),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: SizedBox(
                          width: 370,
                          child: TextFormField(
                            initialValue: widget.album.release.toString(),
                            validator: (value)
                            {
                              if (value == null || value.isEmpty)
                              {
                                return "Input required";
                              }
                              else if (!isValidRelease(value) && value != "-")
                              {
                                return "Rating must be a positive integer up to 100";
                              }
                              else
                              {
                                return null;
                              }
                            },
                            onChanged: (value) => release = value,
                            decoration: const InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Color(0XFFAFECB3),
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20),
                              hintText: 'Release',
                            ),
                          ),
                        ),
                      ),
                      const Text("Genre",
                        style: TextStyle(
                            fontSize: 20
                        ),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                        child: SizedBox(
                          width: 370,
                          height: 50,
                          child: TextFormField(
                            initialValue: widget.album.genre,
                            validator: (value)
                            {
                              if (value == null || value.isEmpty) {
                                return "Input required";
                              }
                              else
                              {
                                return null;
                              }
                            },
                            onChanged: (value) => genre = value,
                            keyboardType: TextInputType.datetime,
                            maxLines: 400,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                              fillColor: Color(0XFFAFECB3),
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20),
                              hintText: 'Genre',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Column(
                          children: [
                            const Text(
                              "Have you listened to this album?",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18),
                            ),
                            RadioListTile<bool>(
                              title: const Text("Yes"),
                              value: true,
                              groupValue: listen,
                              onChanged: (value) {
                                setState(() {
                                  listen = value!;
                                });
                              },
                            ),
                            RadioListTile<bool>(
                              title: const Text("No"),
                              value: false,
                              groupValue: listen,
                              onChanged: (value) {
                                setState(() {
                                  listen = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Row(children: <Widget>
                      [
                        Container(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: SizedBox(
                                  width: 150,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () =>
                                    {
                                      if(_formKey.currentState!.validate())
                                        {
                                          Navigator.pop(context,Album.fromAlbum(widget.album.id, title, artist, rating, int.parse(release), genre, listen))
                                        }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0XFFAFECB3)),
                                    child: const Text("Save",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25)),
                                  )),
                            )),
                        Container(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(70, 20, 0, 0),
                              child: SizedBox(
                                  width: 150,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () => {Navigator.pop(context)},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0XFFAFECB3)),
                                    child: const Text("Back",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25)),
                                  )),
                            ))
                      ])
                    ])))));
  }
}