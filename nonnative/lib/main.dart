import 'package:flutter/material.dart';

import 'Screens/browser.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MaterialApp(
      home: MyMainScreen()
  )
  );
}

class MyMainScreen extends StatefulWidget
{
  const MyMainScreen({super.key});

  @override
  State<StatefulWidget> createState() => MyMainScreenState();
}

class MyMainScreenState extends State<MyMainScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: Column(
        children: <Widget>
        [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 125, 0, 0),
          ),
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0, 250, 0, 0),
              child: ElevatedButton(
                onPressed: () =>
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const browser()))
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade50
                ),
                child: const Text(
                    "Start Browsing",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                    )),
              )
          )
        ],
      ),
    );
  }
}