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
    Color surfaceColor = const Color(0x0dffffff);
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
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black
        ),
        fontFamily: 'Lato',
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 15),
          bodyText1: TextStyle(fontSize: 13, color: Color.fromARGB(200, 255, 255, 255)),
          headline6: TextStyle(fontWeight: FontWeight.bold),
          subtitle1: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)

        ),
        primarySwatch: Colors.blue,
        primaryColor: Colors.pinkAccent,
        dividerTheme: DividerThemeData(thickness: 0.75,indent: 32,endIndent: 32,color: surfaceColor)
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(width: 16,),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Masoud Shahbazi',style: Theme.of(context).textTheme.subtitle1,),
                          const SizedBox(height: 2,),
                          Text('Full Stack Web Developer '),
                          const SizedBox(height: 8,),
                          Row(
                            children: [
                              Icon(CupertinoIcons.placemark,color: Theme.of(context).textTheme.bodyText1!.color,size: 14,),
                              SizedBox(width: 3,),
                              Text('Tehran, Iran',style: Theme.of(context).textTheme.caption,)
                            ],
                          )
                        ],
                      ),
                  ),
                  Icon(CupertinoIcons.heart,color: Theme.of(context).primaryColor,),


                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child:  Text("Lorem ipsum dolor sit amet, aliquid liberavisse per at, qui ad amet facete. Per alterum adipisci ea. Equidem pericula ex eos, nullam nusquam erroribus eam an, paulo homero reprehendunt ne nec Lobortis.", style: Theme.of(context).textTheme.bodyText1,),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Skills",style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w900),),
                  SizedBox(width: 2,),
                  Icon(CupertinoIcons.chevron_down,size: 12,)
                ],
              ),
            ),
            Center(
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                runSpacing: 8,
                children: [
                  Container(
                    decoration: BoxDecoration(color: Theme.of(context).dividerTheme.color,borderRadius: BorderRadius.circular(16)),
                    width: 110,
                    height: 110,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/Adobe_Photoshop.png",width: 40,height: 40,),
                        Text("Photoshop")
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
