import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Album.dart';

class addAlbumScreen extends StatefulWidget
{
  addAlbumScreen({super.key});

  @override
  State<StatefulWidget> createState() => addAlbumScreenState();
}

class addAlbumScreenState extends State<addAlbumScreen>
{
  final _formKey = GlobalKey<FormState>();

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

  String title = "";
  String artist = "";
  String rating = "";
  String release = "";
  String genre = "";
  bool listen = false;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        backgroundColor: Colors.green.shade900,
        body: Container(
            child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>
                    [
                      Row(
                        children: <Widget>
                        [
                          Container(
                            padding: const EdgeInsets.fromLTRB(150, 80, 0, 0),
                            child: const Text('Add album',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: SizedBox(
                          width: 370,
                          child: TextFormField(
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: SizedBox(
                          width: 370,
                          child: TextFormField(
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: SizedBox(
                          width: 370,
                          child: TextFormField(
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
                                  fontSize: 20),
                              hintText: 'Rating',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: SizedBox(
                          width: 370,
                          child: TextFormField(
                            validator: (value)
                            {
                              if (value == null || value.isEmpty)
                              {
                                return "Input required";
                              }
                              else if (!isValidRelease(value))
                              {
                                return "Release must be a positive integer";
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: SizedBox(
                          width: 370,
                          height: 50,
                          child: TextFormField(
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
                                          Navigator.pop(context,Album(title, artist, rating, int.parse(release), genre, listen))
                                        }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0XFFAFECB3)),
                                    child: const Text("Add",
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
                                    child: const Text("Cancel",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25)),
                                  )),
                            ))
                      ])
                    ])))));
  }
}