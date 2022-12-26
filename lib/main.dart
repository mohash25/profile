import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mohammad Shahbazi'),
          actions: [
            Icon(CupertinoIcons.chat_bubble),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
              child: Icon(CupertinoIcons.ellipsis_vertical),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/profile_image.jpeg',
                        width: 60,
                        height: 60,
                      )),
                  const SizedBox(width: 16,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Masoud Shahbazi'),
                      const SizedBox(height: 2,),
                      Text('Full Stack Web & Mobile app Developer '),
                      const SizedBox(height: 4,),
                      Row(
                        children: [
                          Icon(CupertinoIcons.placemark),
                          Text('Tehran, Iran')
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: const Text('Lorem ipsum dolor sit amet, aliquid liberavisse per at, qui ad amet facete. Per alterum adipisci ea. Equidem pericula ex eos, nullam nusquam erroribus eam an, paulo homero reprehendunt ne nec Lobortis.'),
            )
          ],
        ));
  }
}
